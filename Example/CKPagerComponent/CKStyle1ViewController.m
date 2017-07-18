//
//  CKStyle1ViewController.m
//  CKPagerComponent
//
//  Created by 三米 on 2017/6/8.
//  Copyright © 2017年 corkiios. All rights reserved.
//

#import "CKStyle1ViewController.h"

@interface CKStyle1ViewController ()

@end

@implementation CKStyle1ViewController

#pragma mark - LifeCircle
- (void)dealloc {}

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
}

- (CKPagingComponentBarStyle)style {
    
    return CKPagingComponentStyleNormal;
}


//选项卡位置 中间控制器view 高度
- (CGFloat)pagingControllerComponentContainerViewHeight {
    
    return self.view.bounds.size.height - 64;
}
@end
