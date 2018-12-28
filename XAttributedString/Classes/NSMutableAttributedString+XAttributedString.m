//
//  NSMutableAttributedString+XAttributedString.m
//  XAttributedString
//
//  Created by Leo on 04/16/2018.
//  Copyright (c) 2018 Leo. All rights reserved.
//

#import "NSMutableAttributedString+XAttributedString.h"

#define IN_RANGE(range) (NSMaxRange(range) <= [self length])

@implementation NSMutableAttributedString (XAttributedString)

#pragma mark - 文本颜色属性
- (void)x_addAttributeTextColor:(UIColor *)color
{
    [self x_addAttributeTextColor:color range:NSMakeRange(0, [self length])];
}

- (void)x_addAttributeTextColor:(UIColor *)color
                          range:(NSRange)range
{
    if (color && IN_RANGE(range)) {
        
        [self removeAttribute:NSForegroundColorAttributeName range:range];
        
        [self addAttribute:NSForegroundColorAttributeName value:color range:range];
    }
}

#pragma mark - 文本背景颜色
- (void)x_addAttributeBackgroundColor:(UIColor *)color
{
    [self x_addAttributeBackgroundColor:color range:NSMakeRange(0, [self length])];
}

- (void)x_addAttributeBackgroundColor:(UIColor *)color
                                range:(NSRange)range
{
    if (color && IN_RANGE(range)) {
        
        [self removeAttribute:NSBackgroundColorAttributeName range:range];
        
        [self addAttribute:NSBackgroundColorAttributeName value:color range:range];
    }
}

#pragma mark - 文本字体属性
- (void)x_addAttributeFont:(UIFont *)font
{
    [self x_addAttributeFont:font range:NSMakeRange(0, [self length])];
}

- (void)x_addAttributeFont:(UIFont *)font
                     range:(NSRange)range
{
    if (font && IN_RANGE(range)) {
        
        [self removeAttribute:NSFontAttributeName range:range];
        
        [self addAttribute:NSFontAttributeName value:font range:range];
    }
}

#pragma mark - 文本字符间隔属性
- (void)x_addAttributeCharacterSpacing:(NSInteger)spacing
{
    [self x_addAttributeCharacterSpacing:spacing range:NSMakeRange(0, self.length)];
}

- (void)x_addAttributeCharacterSpacing:(NSInteger)spacing
                                 range:(NSRange)range
{
    if (IN_RANGE(range)) {
        
        [self removeAttribute:NSKernAttributeName range:range];
        
        [self addAttribute:NSKernAttributeName value:@(spacing) range:range];
    }
}

#pragma mark - 文本下划线属性
- (void)x_addAttributeUnderlineStyle:(NSUnderlineStyle)style
                               color:(UIColor *)lineColor
{
    [self x_addAttributeUnderlineStyle:style color:lineColor range:NSMakeRange(0, [self length])];
}

- (void)x_addAttributeUnderlineStyle:(NSUnderlineStyle)style
                               color:(UIColor *)lineColor
                               range:(NSRange)range
{
    if (IN_RANGE(range)) {
        
        [self removeAttribute:NSUnderlineStyleAttributeName range:range];
        
        [self addAttribute:NSUnderlineStyleAttributeName value:@(style) range:range];
        
        if (lineColor) {
            
            [self removeAttribute:NSUnderlineColorAttributeName range:range];
            
            [self addAttribute:NSUnderlineColorAttributeName value:lineColor range:range];
        }
    }
}

#pragma mark - 文本删除效果
- (void)x_addAttributeStrikethroughlineStyle:(NSUnderlineStyle)style
                                       color:(UIColor *)lineColor
{
    [self x_addAttributeStrikethroughlineStyle:style color:lineColor range:NSMakeRange(0, [self length])];
}

- (void)x_addAttributeStrikethroughlineStyle:(NSUnderlineStyle)style
                                       color:(UIColor *)lineColor
                                       range:(NSRange)range
{
    if (IN_RANGE(range)) {
        
        [self removeAttribute:NSStrikethroughStyleAttributeName range:range];
        
        [self addAttribute:NSStrikethroughStyleAttributeName value:@(style) range:range];
        
        // iOS 10.3 无效的解决办法
        [self removeAttribute:NSBaselineOffsetAttributeName range:range];
        [self addAttribute:NSBaselineOffsetAttributeName value:@(0) range:range];
        
        if (lineColor) {
            
            [self removeAttribute:NSStrikethroughColorAttributeName range:range];
            
            [self addAttribute:NSStrikethroughColorAttributeName value:lineColor range:range];
        }
    }
}

#pragma mark - 文本空心字及颜色

- (void)x_addAttributeStrokeWidth:(NSInteger)strokeWidth
                      strokeColor:(UIColor *)strokeColor
{
    [self x_addAttributeStrokeWidth:strokeWidth strokeColor:strokeColor range:NSMakeRange(0, self.length)];
}

- (void)x_addAttributeStrokeWidth:(NSInteger)strokeWidth
                      strokeColor:(UIColor *)strokeColor
                            range:(NSRange)range
{
    if (IN_RANGE(range)) {
        
        if (strokeWidth > 0) {
            
            [self removeAttribute:NSStrokeWidthAttributeName range:range];
            
            [self addAttribute:NSStrokeWidthAttributeName value:@(strokeWidth) range:range];
        }
        
        if (strokeColor) {
            
            [self removeAttribute:NSStrokeColorAttributeName range:range];
            
            [self addAttribute:NSStrokeColorAttributeName value:strokeColor range:range];
        }
    }
}

#pragma mark - 文本段落样式属性
- (void)x_addAttributeAlignmentStyle:(NSTextAlignment)textAlignment
                      lineSpaceStyle:(CGFloat)linesSpacing
                 paragraphSpaceStyle:(CGFloat)paragraphSpacing
                      lineBreakStyle:(NSLineBreakMode)lineBreakMode
{
    [self x_addAttributeAlignmentStyle:textAlignment lineSpaceStyle:linesSpacing paragraphSpaceStyle:paragraphSpacing lineBreakStyle:lineBreakMode range:NSMakeRange(0, self.length)];
}

- (void)x_addAttributeAlignmentStyle:(NSTextAlignment)textAlignment
                      lineSpaceStyle:(CGFloat)linesSpacing
                 paragraphSpaceStyle:(CGFloat)paragraphSpacing
                      lineBreakStyle:(NSLineBreakMode)lineBreakMode
                               range:(NSRange)range
{
    if (IN_RANGE(range)) {
        
        [self removeAttribute:NSParagraphStyleAttributeName range:range];
        
        NSMutableParagraphStyle *style = [[NSMutableParagraphStyle alloc] init];
        style.alignment = textAlignment;
        style.lineSpacing = linesSpacing;
        style.paragraphSpacing = paragraphSpacing;
        style.lineBreakMode = lineBreakMode;
        
        [self addAttribute:NSParagraphStyleAttributeName value:style range:range];
    }
}

@end
