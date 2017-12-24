//
//  ICContainerView.h
//  ICPagerComponent
//
//  Created by mac on 2017/5/2.
//  Copyright © 2017年 iCorki. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ICContainerView;
@protocol ICContainerViewDelegate <NSObject>

@optional

- (void)IC_containerView:(ICContainerView *)containerView
            didBeginDragging:(UIScrollView *)scrollView;

- (void)IC_containerView:(ICContainerView *)containerView
            didEndScroll:(UIScrollView *)scrollView;

- (void)IC_containerView:(ICContainerView *)containerView
               progress:(CGFloat)progress
            sourceIndex:(NSInteger)sourceIndex
            targetIndex:(NSInteger)targetIndex;
@end

@interface ICContainerView : UIView

@property (nonatomic, strong) NSArray <UIViewController *>*childControllers;
@property (nonatomic, weak) id <ICContainerViewDelegate>delegate;

+ (instancetype)containerWithFrame:(CGRect)frame;

- (void)setContainerViewContentOffsetAtIndex:(NSInteger)index;



@end
