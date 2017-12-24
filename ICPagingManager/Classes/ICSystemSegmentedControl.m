//
//  ICSystemSegmentedControl.m
//  AFNetworking
//
//  Created by mac on 2017/11/7.
//

#import "ICSystemSegmentedControl.h"
@interface ICSystemSegmentedControl()
@property (nonatomic, assign) NSInteger lastPage;
@property (nonatomic, strong) NSMutableArray <UILabel *>*itemLabels;
@property (nonatomic, assign) CGFloat currentOffsetX;
@property (nonatomic, strong) NSMutableArray <NSNumber *>*offsets;
@property (nonatomic, strong) ICSegmentBarConfig *config;
@end

@implementation ICSystemSegmentedControl


- (instancetype)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    
    if (self) {
        [self addTarget:self action:@selector(systemSegmentedControlAction:) forControlEvents:UIControlEventValueChanged];
        _lastPage = 0;
    }
    
    return self;
}

- (void)systemSegmentedControlAction:(UISegmentedControl *)segmentControl {
    if (_lastPage == segmentControl.selectedSegmentIndex) return;
    
    if (self.delegate && [self.delegate respondsToSelector:@selector(segmentBarDidSelectIndex:
                                                                     fromIndex:)]) {
        
        [self.delegate segmentBarDidSelectIndex:segmentControl.selectedSegmentIndex
                                      fromIndex:_lastPage];
    }
    
    _lastPage = segmentControl.selectedSegmentIndex;
}

- (void)updateWithConfig:(void (^)(ICSegmentBarConfig *))block {

    if (block) {
        block(self.config);
    }
   
}

- (void)setDelegate:(id<ISegmentBar>)delegate {
    _delegate = delegate;
}

- (void)setItems:(NSArray<NSString *> *)items {
    _items = items;
}

- (void)layoutSubviews {
    [super layoutSubviews];
  
}

- (void)setSelectedIndex:(NSInteger)selectedIndex {
    self.lastPage = selectedIndex;
    _selectedIndex = selectedIndex;
    [self setSelectedSegmentIndex:selectedIndex];
}

- (void)setTitleWithProgress:(CGFloat)progress
                 sourceIndex:(NSInteger)sourceIndex
                 targetIndex:(NSInteger)targetIndex {
    
//    UILabel *sourceLabel = self.itemLabels[sourceIndex];
//    UILabel *targetLabel = self.itemLabels[targetIndex];
//    if (sourceIndex > targetIndex) {
//
//        CGFloat offset = sourceLabel.centerX - targetLabel.centerX;
//        [self.scrollView setContentOffset:CGPointMake([self.offsets[targetIndex] floatValue] + progress * offset, 0) animated:NO];
//
//    }else {
//
//        CGFloat offset = targetLabel.centerX - sourceLabel.centerX;
//        [self.scrollView setContentOffset:CGPointMake([self.offsets[targetIndex] floatValue] - progress * offset, 0) animated:NO];
//    }
//    sourceLabel.alpha =  progress;
//    targetLabel.alpha = 1 - progress;//这里顺序不要变
//    _pageControl.currentPage = sourceIndex;
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

- (ICSegmentBarConfig *)config {
    
    if (_config == nil) {
        
        _config = [ICSegmentBarConfig defultCongfig];
    }
    
    return _config;
}

@end
