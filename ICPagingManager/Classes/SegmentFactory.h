//
//  SegmentFactory.h
//  Pods
//
//  Created by 三米 on 2017/6/7.
//
//

#import <Foundation/Foundation.h>
#import "ICPagingManagerProtocol.h"
#import "ICPagingManager.h"
#import "ISegmentBar.h"
@interface SegmentFactory : NSObject

- (instancetype)initWithStyle:(ICPagingComponentBarStyle)style;

- (UIView<ISegmentBar>*)manufacturingWithFrame:(CGRect)frame
                                         items:(NSArray *)items
                                      delegate:(id<ICPagingManagerProtocol>)delegate manager:(ICPagingManager *)manager;

@end
