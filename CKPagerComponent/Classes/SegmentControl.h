//
//  SegmentControl.h
//  Pods
//
//  Created by 三米 on 2017/6/7.
//
//

#import <UIKit/UIKit.h>
#import "ISegmentBar.h"
@interface SegmentControl : UIView<ISegmentBar>

@property (nonatomic, weak) id <ISegmentBar> delegate;
@property (nonatomic, strong) NSArray <NSString *>*items;
@property (nonatomic, assign) NSInteger selectedIndex;

//更新标题属性
- (void)updateWithConfig:(void(^)(CKSegmentBarConfig *config))block;
//进度
- (void)setTitleWithProgress:(CGFloat)progress
                 sourceIndex:(NSInteger)sourceIndex
                 targetIndex:(NSInteger)targetIndex;
@end
