//
//  CKTestVC3.m
//  CKPagerComponent
//
//  Created by mac on 2017/5/2.
//  Copyright © 2017年 corkiios. All rights reserved.
//

#import "CKTestVC3.h"

@interface CKTestVC3 ()

@end

@implementation CKTestVC3

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor orangeColor];

    NSLog(@"%s",__func__);
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NSLog(@"%s",__func__);
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
