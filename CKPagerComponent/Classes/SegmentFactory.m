//
//  SegmentFactory.m
//  Pods
//
//  Created by 三米 on 2017/6/7.
//
//

#import "SegmentFactory.h"
#import "CKSegmentBar.h"
#import "SegmentControl.h"
@interface SegmentFactory()

@end

@implementation SegmentFactory

- (UIView<ISegmentBar>*)manufacturingWithFrame:(CGRect)frame
                                    style:(CKPagingComponentBarStyle)style {
    UIView<ISegmentBar> *bar = nil;
    if (style == CKPagingComponentStyleNormal) {
        bar = [CKSegmentBar segmentBarWithFrame:frame];
    }else{
        bar = [[SegmentControl alloc] initWithFrame:frame];
    }
    
    return bar;
}

@end
