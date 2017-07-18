//
//  CKPagingManager.h
//  Pods
//
//  Created by mac on 2017/6/6.
//
//

#import <Foundation/Foundation.h>
#import "IPagingManager.h"
#import "CKSegmentBarConfig.h"
@interface CKPagingManager : NSObject

/**
 UIVIewController
 */
@property (nonatomic, weak) id<IPagingManager>delegate;


/**
 实例化

 @return instancetype
 */
+ (instancetype)manager;


/**
  加载分页管理器

 @param block 提供个性化配置
 */
- (void)loadPagingWithConfig:(void(^)(CKSegmentBarConfig *config))block;
@end
