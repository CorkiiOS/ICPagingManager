//
//  CKPagingControllerComponent.h
//  CKPagerComponent
//
//  Created by mac on 2017/5/2.
//  Copyright © 2017年 corkiios. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CKSegmentBar.h"
#import "CKSegmentBarConfig.h"
@interface CKPagingControllerComponent : UIViewController

- (NSArray <UIViewController *>*)pagingControllerComponentChildViewControllers;

- (NSArray <NSString *>*)pagingControllerComponentSegmentTitles;

- (CGRect)pagingControllerComponentSegmentFrame;

- (CGFloat)pagingControllerComponentContainerViewHeight;

- (void)updateSegmentBarConfig:(void(^)(CKSegmentBarConfig *config))block;
@end
