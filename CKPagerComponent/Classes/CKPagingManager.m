//
//  CKPagingManager.m
//  Pods
//
//  Created by mac on 2017/6/6.
//
//

#import "CKPagingManager.h"
#import "CKSegmentBar.h"
#import "CKContainerView.h"
#import "SegmentFactory.h"
@interface CKPagingManager()<ISegmentBar, CKContainerViewDelegate>

@property(nonatomic, strong) UIView<ISegmentBar>* bar;
@property(nonatomic, strong) CKContainerView *container;

/*选项卡风格*/
- (CKPagingComponentBarStyle)style;

/*选项卡frame*/
- (CGRect)pagingBarFrame;
/*选项卡标题集合*/
- (NSArray <NSString *>*)pagingBarTitles;
/*子控制器集合*/
- (NSArray <UIViewController *>*)pagingChildVCs;
/*子控制器view*/
- (CGFloat)pagingContentHeight;

@end


@implementation CKPagingManager

+ (instancetype)manager {
    
    return [[self alloc] init];
}

- (void)loadPagingWithConfig:(void(^)(CKSegmentBarConfig *config))block
{
    [self checkConditions];
    [self setSegmentBar];
    [self setContainerView];
    [self.bar updateWithConfig:block];
}

- (void)checkConditions {
    
    NSAssert(self.delegate, @"请先设置manager的delegate");
    NSAssert([self.delegate isKindOfClass:[UIViewController class]], @"manager的delegate必须是UIViewController Class");
    NSAssert(self.pagingChildVCs.count ==  self.pagingBarTitles.count, @"仔细确定控制器个数和标题个数是否相等");
}

- (void)updateSegmentBarConfig:(void(^)(CKSegmentBarConfig *))block {
    [self.bar updateWithConfig:block];
}

/**
 设置选项卡
 */
- (void)setSegmentBar {
    
    UIViewController *delegate = (UIViewController *)self.delegate;
    SegmentFactory *factory = [[SegmentFactory alloc] init];
    
    self.bar = [factory manufacturingWithFrame:self.pagingBarFrame
                                         style:self.style];
    
    [self.bar setDelegate:self];
    [self.bar setItems:self.pagingBarTitles];
    [delegate.view addSubview:self.bar];
}

/**
 内容
 */
- (void)setContainerView {
    
    UIViewController *delegate = (UIViewController *)self.delegate;
    CGRect frame = self.pagingBarFrame;
    frame.origin.y = CGRectGetMaxY(frame);
    frame.size.height = self.pagingContentHeight;

    CKContainerView *container = [CKContainerView containerWithFrame:frame];
    container.delegate = self;
    [self.pagingChildVCs enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [delegate addChildViewController:obj];
    }];
    
    container.childControllers = self.pagingChildVCs;
    [delegate.view addSubview:container];
    self.container = container;
}

/**
 选项卡被点击 触发
 
 @param index 索引
 @param formIndex 索引
 */
- (void)segmentBarDidSelectIndex:(NSInteger)index
                       fromIndex:(NSInteger)formIndex {
    
    [self.container setContainerViewContentOffsetAtIndex:index];
}

- (void)ck_containerView:(CKContainerView *)containerView
            didEndScroll:(UIScrollView *)scrollView {
    
    NSInteger index = scrollView.contentOffset.x / scrollView.bounds.size.width;
    self.bar.selectedIndex = index;
}

- (void)ck_containerView:(CKContainerView *)containerView
                progress:(CGFloat)progress
             sourceIndex:(NSInteger)sourceIndex
             targetIndex:(NSInteger)targetIndex {
    
    [self.bar setTitleWithProgress:progress
                       sourceIndex:sourceIndex
                       targetIndex:targetIndex];
}

/**
 获取数据源
 */
- (CKPagingComponentBarStyle)style {
    
    if ([self.delegate respondsToSelector:@selector(style)]) {
        
        return  [self.delegate style];
    }
    return CKPagingComponentStyleNormal;
}

- (NSArray <UIViewController *>*)pagingChildVCs {
    
    return [self.delegate pagingControllerComponentChildViewControllers];
}

- (NSArray <NSString *>*)pagingBarTitles {
    
    return [self.delegate pagingControllerComponentSegmentTitles];
}

- (CGRect)pagingBarFrame {
    
    NSAssert([self.delegate respondsToSelector:@selector(pagingControllerComponentSegmentFrame)], @"自定义风格需要实现pagingControllerComponentSegmentFrame协议");
    return [self.delegate pagingControllerComponentSegmentFrame];
}

- (CGFloat)pagingContentHeight {
    
    return [self.delegate pagingControllerComponentContainerViewHeight];
}

@end
