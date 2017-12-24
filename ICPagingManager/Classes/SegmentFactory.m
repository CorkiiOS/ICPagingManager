//
//  SegmentFactory.m
//  Pods
//
//  Created by 三米 on 2017/6/7.
//
//

#import "SegmentFactory.h"
#import "ICSegmentBar.h"
#import "SegmentControl.h"
#import "ICSystemSegmentedControl.h"
@interface SegmentFactory()
@property (nonatomic, assign) ICPagingComponentBarStyle style;
@end

@implementation SegmentFactory
- (instancetype)initWithStyle:(ICPagingComponentBarStyle)style
{
    self = [super init];
    if (self)
    {
        _style = style;
    }
    return self;
}

- (UIView<ISegmentBar>*)manufacturingWithFrame:(CGRect)frame
                                         items:(NSArray *)items
                                      delegate:(id<ICPagingManagerProtocol>)delegate manager:(ICPagingManager *)manager
{
    UIView<ISegmentBar> *bar = nil;
    UIViewController *vc = (UIViewController *)delegate;
    switch (self.style) {
        case ICPagingComponentStyleNormal:
        {
            bar = [ICSegmentBar segmentBarWithFrame:frame];
            [vc.view addSubview:bar];

        }
            break;
            
        case ICPagingComponentStyleControl:
        {
            bar = [[SegmentControl alloc] initWithFrame:frame];
            [vc.view addSubview:bar];
        }
            break;
            
        case ICPagingComponentStyleNavSegment:
        {
            ICSystemSegmentedControl *segBar = [[ICSystemSegmentedControl alloc] initWithItems:items];
            segBar.frame = CGRectMake(0, 7, 150, 30);
            segBar.selectedSegmentIndex = 0;
            segBar.tintColor = [UIColor colorWithRed:250/255.0 green:79/255.0 blue:71/255.0 alpha:1.0];
            [vc.navigationItem setTitleView:bar];

            bar = segBar;
        }
            break;
            
        case ICPagingComponentStyleCustomSuperView:
        {
            CGFloat statusBarH = [UIApplication sharedApplication].statusBarFrame.size.height;
            CGFloat w = [UIScreen mainScreen].bounds.size.width;
            ICSystemSegmentedControl *segBar = [[ICSystemSegmentedControl alloc] initWithItems:items];
            segBar.frame = CGRectMake(w / 2 - 75, statusBarH + 7, 150, 30);
            segBar.selectedSegmentIndex = 0;
            segBar.tintColor = [UIColor whiteColor];
            [[delegate superViewForSegmentBar] addSubview:bar];
            
            bar = segBar;
        }
            break;
            
        default:
            break;
    }
    [bar setDelegate:manager];
    [bar setItems:items];
    return bar;
}

@end
