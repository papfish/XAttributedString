//
//  NSMutableAttributedString+XL.h
//  XAttributedString
//
//  Created by xuliang on 2017/7/28.
//  Copyright © 2017年 leo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreText/CoreText.h>
#import <UIKit/UIKit.h>

@interface NSMutableAttributedString (XL)

/**
 *  添加文本颜色属性
 *
 *  @param color 文本颜色
 */
- (void)x_addAttributeTextColor:(UIColor*)color;

- (void)x_addAttributeTextColor:(UIColor*)color
                          range:(NSRange)range;

/**
 *  添加文本字体属性
 *
 *  @param font 字体
 */
- (void)x_addAttributeFont:(UIFont *)font;

- (void)x_addAttributeFont:(UIFont *)font
                     range:(NSRange)range;

/**
 *  添加文本字符间隔
 *
 *  @param spacing 字符间隔
 */
- (void)x_addAttributeCharacterSpacing:(NSInteger)spacing;

- (void)x_addAttributeCharacterSpacing:(NSInteger)spacing
                                 range:(NSRange)range;

/**
 *  添加下划线
 *
 *  @param style    下划线 （单 双 无 点 线）
 *  @param lineColor    线的颜色（默认和字体颜色一样）
 */
- (void)x_addAttributeUnderlineStyle:(NSUnderlineStyle)style
                               color:(UIColor *)lineColor;

- (void)x_addAttributeUnderlineStyle:(NSUnderlineStyle)style
                               color:(UIColor *)lineColor
                               range:(NSRange)range;

/**
 *  添加删除线
 *
 *  @param style        删除线 （单 双 无 点 线）
 *  @param lineColor    线的颜色（默认和字体颜色一样）
 */
- (void)x_addAttributeStrikethroughlineStyle:(NSUnderlineStyle)style
                                       color:(UIColor *)lineColor;

- (void)x_addAttributeStrikethroughlineStyle:(NSUnderlineStyle)style
                                       color:(UIColor *)lineColor
                                       range:(NSRange)range;

/**
 *  添加空心字
 *
 *  @param strokeWidth 空心字边框宽
 *  @param strokeColor 空心字边框颜色
 */
- (void)x_addAttributeStrokeWidth:(NSInteger)strokeWidth
                      strokeColor:(UIColor *)strokeColor;

- (void)x_addAttributeStrokeWidth:(NSInteger)strokeWidth
                      strokeColor:(UIColor *)strokeColor
                            range:(NSRange)range;

/**
 *  添加文本段落样式
 *
 *  @param textAlignment    文本对齐样式
 *  @param linesSpacing     文本行间距
 *  @param paragraphSpacing 段落间距
 *  @param lineBreakMode    文本换行样式
 */
- (void)x_addAttributeAlignmentStyle:(NSTextAlignment)textAlignment
                      lineSpaceStyle:(CGFloat)linesSpacing
                 paragraphSpaceStyle:(CGFloat)paragraphSpacing
                      lineBreakStyle:(NSLineBreakMode)lineBreakMode;

- (void)x_addAttributeAlignmentStyle:(NSTextAlignment)textAlignment
                      lineSpaceStyle:(CGFloat)linesSpacing
                 paragraphSpaceStyle:(CGFloat)paragraphSpacing
                      lineBreakStyle:(NSLineBreakMode)lineBreakMode
                               range:(NSRange)range;

@end
