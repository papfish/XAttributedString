//
//  UILabel+XAttributedString.h
//  XAttributedString
//
//  Created by Leo on 2018/12/27.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef void(^XAttributedStringTapBlock)(NSUInteger index, NSAttributedString *_Nullable attrStr);

@interface UILabel (XAttributedString)

/**
 添加点击事件

 @param tapBlock 回调
 */
- (void)x_addTapEvent:(XAttributedStringTapBlock)tapBlock;

/**
 添加点击事件

 @param tapBlock 回调
 @param range 事件触发的字符范围，默认全部
 */
- (void)x_addTapEvent:(XAttributedStringTapBlock)tapBlock range:(NSRange)range;


/**
 设置字体，即label.font
 ⭐️ 解决问题：字体原因导致点击位置计算不准确
 何时使用：当设置第一个字符的属性字体大小后(不设置第一个字符不会出现问题)
 此时通过self.font获取的字体变成了第一个字符的字体，若第一个字符字体，和默认字体不一样，这样会导致self.font获取错误，计算错误。
 
 [self.atrLab x_setDefaultFont:self.atrLab.font];
 // 必须在这个"设置第一个字符的属性字体"之前，记录default font，不然默认字体就变了~
 [mAtrStr x_addAttributeFont:[UIFont systemFontOfSize:40] range:NSMakeRange(0, 1)];
 // 此时self.atrLab.font已经变成了[UIFont systemFontOfSize:40]
 
 @param font 默认字体
 */
- (void)x_setDefaultFont:(UIFont *)font;

@end

NS_ASSUME_NONNULL_END
