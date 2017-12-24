//
//  ICSegmentBarConfig.h
//  ICPagerComponent
//
//  Created by mac on 2017/5/1.
//  Copyright © 2017年 iCorki. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ICSegmentBarConfig : NSObject
//标题普通颜色 //control 普通颜色
@property (nonatomic, strong) UIColor *normalColor;
//标题选中 //control 选中颜色
@property (nonatomic, strong) UIColor *selectColor;
//下划线颜色 //control 标题颜色
@property (nonatomic, strong) UIColor *indicatorColor;
//背景颜色
@property (nonatomic, strong) UIColor *backgroundColor;
//标题字号 //control 选中颜色
@property (nonatomic, assign) CGFloat titleFont;
//默认配置
+ (instancetype)defultCongfig;
//链式编程体验
- (ICSegmentBarConfig *(^)(UIColor *color))nor_color;
- (ICSegmentBarConfig *(^)(UIColor *color))sel_color;
- (ICSegmentBarConfig *(^)(UIColor *color))line_color;
- (ICSegmentBarConfig *(^)(UIColor *))bg_color;
- (ICSegmentBarConfig *(^)(CGFloat font))tt_font;

@end
