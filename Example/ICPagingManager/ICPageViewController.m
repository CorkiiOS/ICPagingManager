//
//  ICPageViewController.m
//  ICPagingManager
//
//  Created by 王志刚 on 2017/11/11.
//  Copyright © 2017年 iCorki. All rights reserved.
//

#import "ICPageViewController.h"
#import <ICPagingManager/ICPagingManager.h>
#import "ICTestViewController.h"
@interface ICPageViewController ()<ICPagingManagerProtocol>
/**
 注意Manager 要一直引用到这个控制器销毁，否则会使内部的代理失效
 */
@property (nonatomic, strong) ICPagingManager *manager;

@end

@implementation ICPageViewController

#pragma mark - LifeCircle
- (void)dealloc {}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.manager = [ICPagingManager manager];
    self.manager.delegate = self;
    [self.manager loadPagingWithConfig:^(ICSegmentBarConfig *config)
    {
        config.nor_color([UIColor darkGrayColor]);
        config.sel_color([UIColor orangeColor]);
        config.line_color([UIColor orangeColor]);
        config.backgroundColor = [UIColor clearColor];
    }];
}

- (ICPagingComponentBarStyle)style
{
    return ICPagingComponentStyleNormal;
}

/**
 
 控制器集合
 @return 控制器集合
 */
- (NSArray<UIViewController *> *)pagingControllerComponentChildViewControllers
{
    return @[[ICTestViewController new],
             [ICTestViewController new],
             [ICTestViewController new],
             [ICTestViewController new],
             [ICTestViewController new],
             [ICTestViewController new]
             ];
}

/**
 选项卡标题
 
 @return @[]
 */
- (NSArray<NSString *> *)pagingControllerComponentSegmentTitles
{
    return @[@"热门",
             @"精华",
             @"热门",
             @"精华",
             @"热门",
             @"精华"];
}

/**
 选项卡位置 适配iPhone X 则减去88
 
 @return rect
 */
- (CGRect)pagingControllerComponentSegmentFrame
{
    return CGRectMake(0, 64, self.view.bounds.size.width, 44);
}

/**
 选项卡位置 中间控制器view 高度
 
 @return CGFloat
 */
- (CGFloat)pagingControllerComponentContainerViewHeight
{
    return self.view.bounds.size.height - 64;
}
@end
