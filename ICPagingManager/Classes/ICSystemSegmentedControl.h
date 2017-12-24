//
//  ICSystemSegmentedControl.h
//  AFNetworking
//
//  Created by mac on 2017/11/7.
//

#import <UIKit/UIKit.h>
#import "ISegmentBar.h"

@interface ICSystemSegmentedControl : UISegmentedControl<ISegmentBar>

@property (nonatomic, weak) id <ISegmentBar> delegate;
@property (nonatomic, strong) NSArray <NSString *>*items;
@property (nonatomic, assign) NSInteger selectedIndex;

//更新标题属性
- (void)updateWithConfig:(void(^)(ICSegmentBarConfig *config))block;
//进度
- (void)setTitleWithProgress:(CGFloat)progress
                 sourceIndex:(NSInteger)sourceIndex
                 targetIndex:(NSInteger)targetIndex;

@end
