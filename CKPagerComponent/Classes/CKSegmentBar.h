//
//  CKSegmentBar.h
//  CKPagerComponent
//
//  Created by mac on 2017/5/1.
//  Copyright © 2017年 corkiios. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CKSegmentBarConfig.h"

@class CKSegmentBar;
@protocol CKSegmentBarDelegate <NSObject>

- (void)segmentBar:(CKSegmentBar *)segmentBar didSelectIndex:(NSInteger)index fromIndex:(NSInteger)formIndex;

@end

@interface CKSegmentBar : UIView


@property (nonatomic, weak) id <CKSegmentBarDelegate> delegate;
@property (nonatomic, strong) NSArray <NSString *>*items;
@property (nonatomic, assign) NSInteger selectedIndex;

+ (instancetype)segmentBarWithFrame:(CGRect)frame;
- (void)updateWithConfig:(void(^)(CKSegmentBarConfig *config))block;
- (void)setTitleWithProgress:(CGFloat)progress
                 sourceIndex:(NSInteger)sourceIndex
                 targetIndex:(NSInteger)targetIndex;
@end
