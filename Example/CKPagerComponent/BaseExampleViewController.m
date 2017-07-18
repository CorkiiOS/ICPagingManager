//
//  BaseExampleViewController.m
//  CKPagerComponent
//
//  Created by 三米 on 2017/6/8.
//  Copyright © 2017年 corkiios. All rights reserved.
//

#import "BaseExampleViewController.h"
#import "CKTestVC1.h"
#import "CKTestVC2.h"
#import "CKTestVC3.h"


@interface BaseExampleViewController ()<IPagingManager>

@end

@implementation BaseExampleViewController{
    /**
     注意Manager 要一直引用到这个控制器销毁，否则会使内部的代理失效
     */
    CKPagingManager *manager;
}

#pragma mark - LifeCircle
- (void)dealloc {}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.automaticallyAdjustsScrollViewInsets = NO;
    manager = [CKPagingManager manager];
    manager.delegate = self;
    [manager loadPagingWithConfig:^(CKSegmentBarConfig *config) {
        config.nor_color([UIColor darkGrayColor]);
        config.sel_color([UIColor orangeColor]);
        config.line_color([UIColor orangeColor]);
        config.backgroundColor = [UIColor clearColor];
    }];
}

- (CKPagingComponentBarStyle)style {
    
    return CKPagingComponentStyleControl;
}

/**
 
 控制器集合
 @return 控制器集合
 */
- (NSArray<UIViewController *> *)pagingControllerComponentChildViewControllers {
    
    return @[[CKTestVC1 new],
             [CKTestVC2 new],
             [CKTestVC1 new],
             [CKTestVC2 new],
             [CKTestVC1 new],
             [CKTestVC2 new],
             [CKTestVC2 new],
             [CKTestVC1 new],
             [CKTestVC2 new]
             ];
}

/**
 选项卡标题

 @return @[]
 */
- (NSArray<NSString *> *)pagingControllerComponentSegmentTitles {
    
    return @[@"热门",@"精华",
             @"热门",@"精华",
             @"热门",@"精华",@"精华",
             @"热门",@"精华"];
}

/**
 选项卡位置

 @return rect
 */
- (CGRect)pagingControllerComponentSegmentFrame {
    
    return CGRectMake(0, 64, self.view.bounds.size.width, 44);
}

/**
 选项卡位置 中间控制器view 高度

 @return CGFloat
 */
- (CGFloat)pagingControllerComponentContainerViewHeight {
    
    return self.view.bounds.size.height - 64;
}
@end
