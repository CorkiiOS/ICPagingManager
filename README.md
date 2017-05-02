# CKPagerComponent

[![CI Status](http://img.shields.io/travis/corkiios/CKPagerComponent.svg?style=flat)](https://travis-ci.org/corkiios/CKPagerComponent)
[![Version](https://img.shields.io/cocoapods/v/CKPagerComponent.svg?style=flat)](http://cocoapods.org/pods/CKPagerComponent)
[![License](https://img.shields.io/cocoapods/l/CKPagerComponent.svg?style=flat)](http://cocoapods.org/pods/CKPagerComponent)
[![Platform](https://img.shields.io/cocoapods/p/CKPagerComponent.svg?style=flat)](http://cocoapods.org/pods/CKPagerComponent)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.
## Using
* 首先导入CKPagingControllerComponent
* 新建控制器继承CKPagingControllerComponent
* 需要实现API
* 子控制器数组

```
- (NSArray<UIViewController *> *)pagingControllerComponentChildViewControllers {

return @[[CKTestVC1 new],
[CKTestVC2 new],
[CKTestVC3 new],
[CKTestVC3 new],
[CKTestVC3 new],
[CKTestVC3 new],
[CKTestVC3 new],
[CKTestVC3 new],
[CKTestVC3 new]];
}
```
* 选项卡标题数组

```
- (NSArray<NSString *> *)pagingControllerComponentSegmentTitles {

return @[@"热门",@"精华",@"你好",@"热门",@"精华",@"你好",@"热门",@"精华",@"你好"];
}
```
* 选项卡位置frame

```
- (CGRect)pagingControllerComponentSegmentFrame {

return CGRectMake(0, 64, self.view.bounds.size.width, 35);
}

```
* 子控制器view高度


```
- (CGFloat)pagingControllerComponentContainerViewHeight {

return self.view.bounds.size.height - 35 - 64;
}
```
## Requirements

## Installation

CKPagerComponent is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "CKPagerComponent"
```

## Author

corkiios, 675053587@qq.com

## License

CKPagerComponent is available under the MIT license. See the LICENSE file for more info.


