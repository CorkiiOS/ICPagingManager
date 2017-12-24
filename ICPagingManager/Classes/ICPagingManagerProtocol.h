//
//  ICPagingManager.h
//  Pods
//
//  Created by mac on 2017/6/6.
//
//

#import <Foundation/Foundation.h>
#import "ICSegmentBarConfig.h"

/**
 
 选项卡的风格

 */
typedef NS_ENUM(NSInteger , ICPagingComponentBarStyle) {
    
    ICPagingComponentStyleNormal,//普通
    ICPagingComponentStyleControl,//系统的pagecontrol
    ICPagingComponentStyleNavSegment,//导航选项卡
    ICPagingComponentStyleCustomSuperView//导航选项卡
    
};

@protocol ICPagingManagerProtocol <NSObject>

@optional
/**
 客户端使用的风格 默认ICPagingComponentStyleNormal
 
 @return ICPagingComponentStyle
 */
- (ICPagingComponentBarStyle)style;


/**
 frame
 
 @return 标题位置
 */
- (CGRect)pagingControllerComponentSegmentFrame;


- (UIView *)superViewForSegmentBar;
@required
/**
 数据源方法
 
 @return 子控制器数组
 */
- (NSArray <UIViewController *>*)pagingControllerComponentChildViewControllers;

/**
 标题
 
 @return 标题数组
 */
- (NSArray <NSString *>*)pagingControllerComponentSegmentTitles;

/**
 内容
 
 @return 内容高度
 */
- (CGFloat)pagingControllerComponentContainerViewHeight;

@end
