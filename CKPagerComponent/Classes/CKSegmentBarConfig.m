//
//  CKSegmentBarConfig.m
//  CKPagerComponent
//
//  Created by mac on 2017/5/1.
//  Copyright © 2017年 corkiios. All rights reserved.
//

#import "CKSegmentBarConfig.h"

@interface CKSegmentBarConfig()
@end

@implementation CKSegmentBarConfig

+ (instancetype)defultCongfig {
    
    CKSegmentBarConfig *config = [CKSegmentBarConfig new];
    config.normalColor = [UIColor blackColor];
    config.selectColor = [UIColor redColor];
    config.indicatorColor = [UIColor redColor];
    config.backgroundColor = [UIColor whiteColor];
    config.titleFont = 15;
    
    return config;
}

- (CKSegmentBarConfig *(^)(UIColor *))nor_color {
    
    return ^CKSegmentBarConfig * (UIColor *color) {
        
        self.normalColor = color;
        return self;
    };
}

- (CKSegmentBarConfig *(^)(UIColor *))sel_color {
    
    return ^CKSegmentBarConfig * (UIColor *color) {
        
        self.selectColor = color;
        return self;
    };
}

- (CKSegmentBarConfig *(^)(UIColor *))line_color {
    
    return ^CKSegmentBarConfig * (UIColor *color) {
        
        self.indicatorColor = color;
        return self;
    };
}

- (CKSegmentBarConfig *(^)(UIColor *))bg_color {
    
    return ^CKSegmentBarConfig * (UIColor *color) {
        
        self.backgroundColor = color;
        return self;
    };
}

- (CKSegmentBarConfig *(^)(CGFloat))tt_font {
    
    return ^CKSegmentBarConfig * (CGFloat font) {
        
        self.titleFont = font;
        return self;
    };
}
@end
