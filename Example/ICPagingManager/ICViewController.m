//
//  ICViewController.m
//  ICPagingManager
//
//  Created by iCorki on 11/11/2017.
//  Copyright (c) 2017 iCorki. All rights reserved.
//

#import "ICViewController.h"
#import "ICPageViewController.h"
@interface ICViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
- (NSArray<NSString *> *)titles;
@end

@implementation ICViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
}

- (NSArray<NSString *> *)titles {
    return @[@"ICPagingComponentStyleNormal",
             @"ICPagingComponentStyleControl",
             @"ICPagingComponentStyleControl"];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    ICPageViewController *page = [[ICPageViewController alloc] init];
    [self.navigationController pushViewController:page animated:YES];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    cell.textLabel.text = self.titles[indexPath.row];
    return cell;
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.titles.count;
}


@end
