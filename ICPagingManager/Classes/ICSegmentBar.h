//
//  ICSegmentBar.h
//  ICPagerComponent
//
//  Created by mac on 2017/5/1.
//  Copyright © 2017年 iCorki. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ICSegmentBarConfig.h"
#import "ISegmentBar.h"

@interface ICSegmentBar : UIView<ISegmentBar>

@property (nonatomic, weak) id <ISegmentBar> delegate;

@property (nonatomic, strong) NSArray <NSString *>*items;

@property (nonatomic, assign) NSInteger selectedIndex;

+ (instancetype)segmentBarWithFrame:(CGRect)frame;
//更新标题属性
- (void)updateWithConfig:(void(^)(ICSegmentBarConfig *config))bloIC;
//进度
- (void)setTitleWithProgress:(CGFloat)progress
                 sourceIndex:(NSInteger)sourceIndex
                 targetIndex:(NSInteger)targetIndex;
@end
