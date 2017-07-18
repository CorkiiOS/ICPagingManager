//
//  CKViewController.m
//  CKPagerComponent
//
//  Created by corkiios on 05/01/2017.
//  Copyright (c) 2017 corkiios. All rights reserved.
//

#import "CKViewController.h"
#import "CKStyle1ViewController.h"
#import "CKStyle2ViewController.h"
@interface CKViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (strong, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation CKViewController

- (NSArray *)styles {
    
    return @[@"普通选项卡",
             @"pagecontrol选项卡"];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];

}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    cell.textLabel.text = self.styles[indexPath.row];
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.styles.count;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    switch (indexPath.row) {
        case 0:
            [self.navigationController pushViewController:[CKStyle1ViewController new] animated:YES];
            break;
            case 1:
             [self.navigationController pushViewController:[CKStyle2ViewController new] animated:YES];
            break;
        default:
            break;
    }
}

@end
