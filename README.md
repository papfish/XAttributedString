# XAttributedString

[![CI Status](http://img.shields.io/travis/xuliang/XAttributedString.svg?style=flat)](https://travis-ci.org/xuliang/XAttributedString)
[![Version](https://img.shields.io/cocoapods/v/XAttributedString.svg?style=flat)](http://cocoapods.org/pods/XAttributedString)
[![License](https://img.shields.io/cocoapods/l/XAttributedString.svg?style=flat)](http://cocoapods.org/pods/XAttributedString)
[![Platform](https://img.shields.io/cocoapods/p/XAttributedString.svg?style=flat)](http://cocoapods.org/pods/XAttributedString)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

## Installation

XAttributedString is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'XAttributedString'
```
## Usage

```
// 设置属性字符
NSString *text = @"测试属性字符";
NSMutableAttributedString *mAtrStr = [[NSMutableAttributedString alloc] initWithString:text];
[mAtrStr x_addAttributeTextColor:[UIColor redColor] range:NSMakeRange(2, 2)];
[mAtrStr x_addAttributeFont:[UIFont systemFontOfSize:12] range:NSMakeRange(0, 2)];
[mAtrStr x_addAttributeUnderlineStyle:NSUnderlineStyleSingle color:[UIColor blackColor] range:NSMakeRange(4, 2)];
[self.atrLab setAttributedText:mAtrStr];

// 设置属性字符
NSString *text2 = @"测试可点击字符";
NSMutableAttributedString *mAtrStr2 = [[NSMutableAttributedString alloc] initWithString:text2];
// 若点击位置不准确，可能通过以下方案解决，详情查看接口说明
[self.atrTapLab x_setDefaultFont:self.atrTapLab.font];
[mAtrStr2 x_addAttributeTextColor:[UIColor redColor] range:NSMakeRange(2, 3)];
[mAtrStr2 x_addAttributeFont:[UIFont systemFontOfSize:40] range:NSMakeRange(0, 1)];
[self.atrTapLab setAttributedText:mAtrStr2];

// 设置可点击区域
[self.atrTapLab x_addTapEvent:^(NSUInteger index, NSAttributedString * _Nullable attrStr) {
    NSLog(@"====== index: %ld, str: %@", index, attrStr);
} range:NSMakeRange(2, 3)];
```

## Author

xuliang, liang.xv@qq.com

## License

XAttributedString is available under the MIT license. See the LICENSE file for more info.
