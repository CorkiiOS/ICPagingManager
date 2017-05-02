//
//  CKViewController.m
//  CKPagerComponent
//
//  Created by corkiios on 05/01/2017.
//  Copyright (c) 2017 corkiios. All rights reserved.
//

#import "CKViewController.h"
#import "CKSegmentBar.h"
#import "CKContainerView.h"
#import "CKPagingControllerComponent.h"
#import "CKTestVC1.h"
#import "CKTestVC2.h"
#import "CKTestVC3.h"

@interface CKViewController ()
@end

@implementation CKViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [self updateSegmentBarConfig:^(CKSegmentBarConfig *config) {
        
        config.nor_color([UIColor darkGrayColor]);
        config.sel_color([UIColor orangeColor]);
        config.line_color([UIColor orangeColor]);
    }];
}

- (NSArray<UIViewController *> *)pagingControllerComponentChildViewControllers {
    
    return @[[CKTestVC1 new],
             [CKTestVC2 new],
             [CKTestVC3 new],
             [CKTestVC3 new],
             [CKTestVC3 new],
             [CKTestVC3 new],
             [CKTestVC3 new],
             [CKTestVC3 new],
             [CKTestVC3 new]];
}

- (NSArray<NSString *> *)pagingControllerComponentSegmentTitles {
    
    return @[@"热门",@"精华",@"你好",@"热门",@"精华",@"你好",@"热门",@"精华",@"你好"];
}

- (CGRect)pagingControllerComponentSegmentFrame {
    
    return CGRectMake(0, 64, self.view.bounds.size.width, 35);
}

- (CGFloat)pagingControllerComponentContainerViewHeight {
    
    return self.view.bounds.size.height - 35 - 64;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    [self.navigationController pushViewController:[CKPagingControllerComponent new] animated:YES];
}

@end
