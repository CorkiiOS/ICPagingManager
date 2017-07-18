# CKPagerComponent

[![CI Status](http://img.shields.io/travis/corkiios/CKPagerComponent.svg?style=flat)](https://travis-ci.org/corkiios/CKPagerComponent)
[![Version](https://img.shields.io/cocoapods/v/CKPagerComponent.svg?style=flat)](http://cocoapods.org/pods/CKPagerComponent)
[![License](https://img.shields.io/cocoapods/l/CKPagerComponent.svg?style=flat)](http://cocoapods.org/pods/CKPagerComponent)
[![Platform](https://img.shields.io/cocoapods/p/CKPagerComponent.svg?style=flat)](http://cocoapods.org/pods/CKPagerComponent)
##Show
![](https://github.com/corkiios/CKPagerComponent/page.gif)
##Describe
比较常用的选项卡多页面管理器，低耦合，不需要继承，使用CKPagingManager实例进行管理。
## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

* #import "CKPagingManager.h"
* 实例化（强引用）

```
 manager = [CKPagingManager manager];
 manager.delegate = self;
    
```

* 实现委托<IPagingManager>

* 选项卡风格



```
//后续有时间扩展
typedef NS_ENUM(NSInteger , CKPagingComponentBarStyle) {
    
    CKPagingComponentStyleNormal,//普通
    CKPagingComponentStyleControl,//系统的pagecontrol
};

- (CKPagingComponentBarStyle)style {
    
    return CKPagingComponentStyleControl;
}

```
* 控制器集合


```
/**
 
 控制器集合
 @return 控制器集合
 */
- (NSArray<UIViewController *> *)pagingControllerComponentChildViewControllers {
    
    return @[[CKTestVC1 new],
             [CKTestVC2 new],
             [CKTestVC1 new],
             [CKTestVC2 new],
             [CKTestVC1 new],
             [CKTestVC2 new],
             [CKTestVC2 new],
             [CKTestVC1 new],
             [CKTestVC2 new]
             ];
}

```
* 选项卡标题集合


```
- (NSArray<NSString *> *)pagingControllerComponentSegmentTitles {
    
    return @[@"热门",@"精华",
             @"热门",@"精华",
             @"热门",@"精华",@"精华",
             @"热门",@"精华"];
}
```
* 选项卡位置


```
- (CGRect)pagingControllerComponentSegmentFrame {
    
    return CGRectMake(0, 64, self.view.bounds.size.width, 44);
}
```
* 控制器view高度


```
- (CGFloat)pagingControllerComponentContainerViewHeight {
    
    return self.view.bounds.size.height - 64;
}

```

* 选项卡配置


```
 [manager loadPagingWithConfig:^(CKSegmentBarConfig *config) {
			//标题普通颜色
        config.nor_color([UIColor darkGrayColor]);
        //标题选中颜色
        config.sel_color([UIColor orangeColor]);
        //下划线颜色
        config.line_color([UIColor orangeColor]);
        //选项卡背景颜色
        config.backgroundColor = [UIColor clearColor];
    }];
    
```
## Installation

CKPagerComponent is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "CKPagerComponent"
```

## Author

corki, 675053587@qq.com

## License

CKPagerComponent is available under the MIT license. See the LICENSE file for more info.


