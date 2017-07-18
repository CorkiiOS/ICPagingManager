//
//  CKSegmentBarConfig.h
//  CKPagerComponent
//
//  Created by mac on 2017/5/1.
//  Copyright © 2017年 corkiios. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CKSegmentBarConfig : NSObject
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
- (CKSegmentBarConfig *(^)(UIColor *color))nor_color;
- (CKSegmentBarConfig *(^)(UIColor *color))sel_color;
- (CKSegmentBarConfig *(^)(UIColor *color))line_color;
- (CKSegmentBarConfig *(^)(UIColor *))bg_color;
- (CKSegmentBarConfig *(^)(CGFloat font))tt_font;

@end
