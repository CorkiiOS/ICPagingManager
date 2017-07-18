//
//  SegmentControl.m
//  Pods
//
//  Created by 三米 on 2017/6/7.
//
//

#import "SegmentControl.h"
#import "UIView+CKFrame.h"
@interface SegmentControl()

@property (nonatomic, strong) UIPageControl *pageControl;
@property (nonatomic, assign) NSInteger lastPage;
@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) NSMutableArray <UILabel *>*itemLabels;
@property (nonatomic, assign) CGFloat currentOffsetX;

@property (nonatomic, strong) NSMutableArray <NSNumber *>*offsets;
@property (nonatomic, strong) CKSegmentBarConfig *config;

@end

@implementation SegmentControl

- (instancetype)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    
    if (self) {
        
        _scrollView = [[UIScrollView alloc] initWithFrame:self.bounds];
        _scrollView.width = self.width - 80;
        _scrollView.scrollsToTop = NO;
        _scrollView.showsVerticalScrollIndicator = NO;
        _scrollView.showsHorizontalScrollIndicator = NO;
        _scrollView.pagingEnabled = YES;
        _scrollView.scrollEnabled = NO;
        [self addSubview:_scrollView];
        
        _pageControl = [[UIPageControl alloc] initWithFrame:self.bounds];
        _pageControl.y = 34;
        _pageControl.height = 10;
        _pageControl.numberOfPages = 3;
        _pageControl.currentPage = 0;
        _pageControl.userInteractionEnabled = NO;
        [self addSubview:_pageControl];
        
    }
    
    return self;
}

- (void)updateWithConfig:(void (^)(CKSegmentBarConfig *))block {
    
    if (block) {
        
        block(self.config);
    }
    _pageControl.pageIndicatorTintColor = self.config.normalColor;
    _pageControl.currentPageIndicatorTintColor = self.config.selectColor;
    for (NSInteger i = 0; i < self.itemLabels.count; i ++) {
        
        UILabel *label = self.itemLabels[i];
        label.textColor = self.config.indicatorColor;
        label.font =  [UIFont systemFontOfSize:self.config.titleFont];
    }
}

- (void)setDelegate:(id<ISegmentBar>)delegate {
    
    _delegate = delegate;
}

- (void)setItems:(NSArray<NSString *> *)items {
    
    _items = items;
    _pageControl.numberOfPages = items.count;
    
    [self.itemLabels makeObjectsPerformSelector:@selector(removeAllObjects)];
    self.itemLabels = nil;
    
    for (NSString *title in items) {
        
        UILabel *label = [[UILabel alloc] init];
        label.tag = self.itemLabels.count;
        [label sizeToFit];
        label.text = title;
        label.textAlignment = NSTextAlignmentCenter;
        [self.itemLabels addObject:label];
        [self.scrollView addSubview:label];
    }
    [self setNeedsLayout];//标记需要重新布局
    [self layoutIfNeeded];
}

- (void)layoutSubviews {
    
    [super layoutSubviews];
    [self.offsets removeAllObjects];
    self.scrollView.frame = self.bounds;
    _scrollView.width = self.width - 80;
    _scrollView.centerX = self.centerX;
    CGFloat totalBtnWidth = 0;
    
    for (NSInteger i = 0; i < self.itemLabels.count; i ++) {
        
        UILabel *label = self.itemLabels[i];
        label.y = 5;
        [label sizeToFit];
        if (i == 0) {
            
            label.centerX = self.scrollView.width / 2;
            [self.offsets addObject:@0];
        }else {
            
            UILabel *lastLabel = self.itemLabels[i - 1];
            label.centerX = lastLabel.centerX + self.scrollView.width / 2 + label.width / 2;
            [self.offsets addObject:@(lastLabel.centerX + lastLabel.width / 2)];
        }
        totalBtnWidth = CGRectGetMaxX(label.frame);
    }
 
    [self.scrollView setContentSize:CGSizeMake(totalBtnWidth, 0)];

}

- (void)setSelectedIndex:(NSInteger)selectedIndex {
    
    self.lastPage = _selectedIndex;
    _selectedIndex = selectedIndex;
    _pageControl.currentPage = selectedIndex;
}

- (void)setTitleWithProgress:(CGFloat)progress
                 sourceIndex:(NSInteger)sourceIndex
                 targetIndex:(NSInteger)targetIndex {

    UILabel *sourceLabel = self.itemLabels[sourceIndex];
    UILabel *targetLabel = self.itemLabels[targetIndex];
    if (sourceIndex > targetIndex) {
        
        CGFloat offset = sourceLabel.centerX - targetLabel.centerX;
        [self.scrollView setContentOffset:CGPointMake([self.offsets[targetIndex] floatValue] + progress * offset, 0) animated:NO];
        
    }else {
       
        CGFloat offset = targetLabel.centerX - sourceLabel.centerX;
        [self.scrollView setContentOffset:CGPointMake([self.offsets[targetIndex] floatValue] - progress * offset, 0) animated:NO];
    }
    sourceLabel.alpha =  progress;
    targetLabel.alpha = 1 - progress;//这里顺序不要变
    _pageControl.currentPage = sourceIndex;
}

- (NSMutableArray<UILabel *> *)itemLabels {
    
    if (_itemLabels == nil) {
        
        _itemLabels = [NSMutableArray array];
    }
    return _itemLabels;
}

- (NSMutableArray<NSNumber *> *)offsets {
    
    if (_offsets == nil) {
        
        _offsets = [NSMutableArray array];
    }
    
    return _offsets;
}

- (CKSegmentBarConfig *)config {
    
    if (_config == nil) {
        
        _config = [CKSegmentBarConfig defultCongfig];
    }
    
    return _config;
}
@end
