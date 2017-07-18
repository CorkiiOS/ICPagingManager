//
//  IPagingManager.h
//  Pods
//
//  Created by mac on 2017/6/6.
//
//

#import <Foundation/Foundation.h>
#import "CKSegmentBarConfig.h"

/**
 
 选项卡的风格

 */
typedef NS_ENUM(NSInteger , CKPagingComponentBarStyle) {
    
    CKPagingComponentStyleNormal,//普通
    CKPagingComponentStyleControl,//系统的pagecontrol
};

@protocol IPagingManager <NSObject>

@optional
/**
 客户端使用的风格 默认CKPagingComponentStyleNormal
 
 @return CKPagingComponentStyle
 */
- (CKPagingComponentBarStyle)style;


/**
 frame
 
 @return 标题位置
 */
- (CGRect)pagingControllerComponentSegmentFrame;


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
