//
//  CKSegmentBarConfig.h
//  CKPagerComponent
//
//  Created by mac on 2017/5/1.
//  Copyright © 2017年 corkiios. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CKSegmentBarConfig : NSObject

@property (nonatomic, strong) UIColor *normalColor;
@property (nonatomic, strong) UIColor *selectColor;
@property (nonatomic, strong) UIColor *indicatorColor;
@property (nonatomic, strong) UIColor *backgroundColor;

@property (nonatomic, assign) CGFloat titleFont;

+ (instancetype)defultCongfig;

- (CKSegmentBarConfig *(^)(UIColor *color))nor_color;
- (CKSegmentBarConfig *(^)(UIColor *color))sel_color;
- (CKSegmentBarConfig *(^)(UIColor *color))line_color;
- (CKSegmentBarConfig *(^)(UIColor *))bg_color;
- (CKSegmentBarConfig *(^)(CGFloat font))tt_font;

@end
