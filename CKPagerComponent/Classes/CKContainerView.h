//
//  CKContainerView.h
//  CKPagerComponent
//
//  Created by mac on 2017/5/2.
//  Copyright © 2017年 corkiios. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CKContainerView;
@protocol CKContainerViewDelegate <NSObject>

@optional

- (void)ck_containerView:(CKContainerView *)containerView
            didBeginDragging:(UIScrollView *)scrollView;

- (void)ck_containerView:(CKContainerView *)containerView
            didEndScroll:(UIScrollView *)scrollView;

- (void)ck_containerView:(CKContainerView *)containerView
               progress:(CGFloat)progress
            sourceIndex:(NSInteger)sourceIndex
            targetIndex:(NSInteger)targetIndex;
@end

@interface CKContainerView : UIView

@property (nonatomic, strong) NSArray <UIViewController *>*childControllers;
@property (nonatomic, weak) id <CKContainerViewDelegate>delegate;

+ (instancetype)containerWithFrame:(CGRect)frame;

- (void)setContainerViewContentOffsetAtIndex:(NSInteger)index;



@end
