//
//  CKPagingControllerComponent.m
//  CKPagerComponent
//
//  Created by mac on 2017/5/2.
//  Copyright © 2017年 corkiios. All rights reserved.
//

#import "CKPagingControllerComponent.h"
#import "CKSegmentBar.h"
#import "CKContainerView.h"

@interface CKPagingControllerComponent () <CKSegmentBarDelegate, CKContainerViewDelegate>

@property(nonatomic, strong) CKSegmentBar *segmentBar;

@end

@implementation CKPagingControllerComponent {
    
    CKContainerView *_container;
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    [self checkElement];
    [self setSegmentBar];
    [self setContainerView];
}

- (void)checkElement {
    
    if (self.pagingControllerComponentChildViewControllers.count !=  self.pagingControllerComponentSegmentTitles.count) {
        
        NSAssert(nil, @"仔细确定控制器个数和标题个数是否相等");
    }
}

- (void)updateSegmentBarConfig:(void(^)(CKSegmentBarConfig *))block {
    
    [self.segmentBar updateWithConfig:block];
}

- (void)setSegmentBar {
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.automaticallyAdjustsScrollViewInsets = NO;
    CGRect frame = self.pagingControllerComponentSegmentFrame;
    CKSegmentBar *bar = [CKSegmentBar segmentBarWithFrame:frame];
    bar.delegate = self;
    bar.items = self.pagingControllerComponentSegmentTitles;
    [self.view addSubview:bar];
    _segmentBar = bar;
}

- (void)setContainerView {
    
    CGRect frame = self.pagingControllerComponentSegmentFrame;
    frame.origin.y = CGRectGetMaxY(frame);
    frame.size.height = self.pagingControllerComponentContainerViewHeight;
    CKContainerView *container = [CKContainerView containerWithFrame:frame];
    container.delegate = self;
    NSArray *vcs = self.pagingControllerComponentChildViewControllers;
    [vcs enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        
        [self addChildViewController:obj];
    }];

    container.childControllers = vcs;
    [self.view addSubview:container];
    _container = container;
}

- (void)segmentBar:(CKSegmentBar *)segmentBar didSelectIndex:(NSInteger)index fromIndex:(NSInteger)formIndex {
    
    [_container setContainerViewContentOffsetAtIndex:index];
}

- (void)ck_containerView:(CKContainerView *)containerView didEndScroll:(UIScrollView *)scrollView {
    
    NSInteger index = scrollView.contentOffset.x / scrollView.bounds.size.width;
    _segmentBar.selectedIndex = index;
}

- (void)ck_containerView:(CKContainerView *)containerView progress:(CGFloat)progress sourceIndex:(NSInteger)sourceIndex targetIndex:(NSInteger)targetIndex {
    
    [_segmentBar setTitleWithProgress:progress sourceIndex:sourceIndex targetIndex:targetIndex];
}

- (NSArray <UIViewController *>*)pagingControllerComponentChildViewControllers {
    
    return @[];
}

- (NSArray <NSString *>*)pagingControllerComponentSegmentTitles {
    
    return @[];
}

- (CGRect)pagingControllerComponentSegmentFrame {
    
    return CGRectZero;
}

- (CGFloat)pagingControllerComponentContainerViewHeight {
    
    return 0;
}
@end
