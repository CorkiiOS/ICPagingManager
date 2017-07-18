//
//  ISegmentFactory.h
//  Pods
//
//  Created by 三米 on 2017/6/7.
//
//

#import <Foundation/Foundation.h>
#import "IPagingManager.h"
@protocol ISegmentBar;

@protocol ISegmentFactory <NSObject>

/**
 负责生产 Segment

 @return Segment
 */
- (UIView<ISegmentBar>*)manufacturingWithFrame:(CGRect)frame
                                         style:(CKPagingComponentBarStyle)style;
@end
