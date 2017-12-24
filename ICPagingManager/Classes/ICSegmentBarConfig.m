//
//  ICSegmentBarConfig.m
//  ICPagerComponent
//
//  Created by mac on 2017/5/1.
//  Copyright © 2017年 iCorki. All rights reserved.
//

#import "ICSegmentBarConfig.h"

@interface ICSegmentBarConfig()
@end

@implementation ICSegmentBarConfig

+ (instancetype)defultCongfig {
    
    ICSegmentBarConfig *config = [ICSegmentBarConfig new];
    config.normalColor = [UIColor blackColor];
    config.selectColor = [UIColor redColor];
    config.indicatorColor = [UIColor redColor];
    config.backgroundColor = [UIColor whiteColor];
    config.titleFont = 15;
    
    return config;
}

- (ICSegmentBarConfig *(^)(UIColor *))nor_color {
    
    return ^ICSegmentBarConfig * (UIColor *color) {
        
        self.normalColor = color;
        return self;
    };
}

- (ICSegmentBarConfig *(^)(UIColor *))sel_color {
    
    return ^ICSegmentBarConfig * (UIColor *color) {
        
        self.selectColor = color;
        return self;
    };
}

- (ICSegmentBarConfig *(^)(UIColor *))line_color {
    
    return ^ICSegmentBarConfig * (UIColor *color) {
        
        self.indicatorColor = color;
        return self;
    };
}

- (ICSegmentBarConfig *(^)(UIColor *))bg_color {
    
    return ^ICSegmentBarConfig * (UIColor *color) {
        
        self.backgroundColor = color;
        return self;
    };
}

- (ICSegmentBarConfig *(^)(CGFloat))tt_font {
    
    return ^ICSegmentBarConfig * (CGFloat font) {
        
        self.titleFont = font;
        return self;
    };
}
@end
