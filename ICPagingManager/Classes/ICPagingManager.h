//
//  ICPagingManager.h
//  Pods
//
//  Created by mac on 2017/6/6.
//
//

#import <Foundation/Foundation.h>
#import "ICPagingManagerProtocol.h"
#import "ICSegmentBarConfig.h"
@interface ICPagingManager : NSObject

/**
 UIVIewController
 */
@property (nonatomic, weak) id<ICPagingManagerProtocol>delegate;


/**
 实例化

 @return instancetype
 */
+ (instancetype)manager;


/**
  加载分页管理器

 @param bloIC 提供个性化配置
 */
- (void)loadPagingWithConfig:(void(^)(ICSegmentBarConfig *config))bloIC;
@end
