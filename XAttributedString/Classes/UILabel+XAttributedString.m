//
//  UILabel+XAttributedString.m
//  XAttributedString
//
//  Created by Leo on 2018/12/27.
//

#import "UILabel+XAttributedString.h"
#import <objc/runtime.h>

static const char *XAttributedStringTapBlockKey = "XAttributedStringTapBlockKey";
static const char *XAttributedStringTapRangeKey = "XAttributedStringTapRangeKey";
static const char *XAttributedStringDefaultFontKey = "XAttributedStringDefaultFontKey";

@implementation UILabel (XAttributedString)

- (void)x_addTapEvent:(XAttributedStringTapBlock)tapBlock {
    [self x_addTapEvent:tapBlock range:NSMakeRange(0, self.attributedText.length)];
}

- (void)x_addTapEvent:(XAttributedStringTapBlock)tapBlock range:(NSRange)range {
    if (self.attributedText == nil) return;
    if (!tapBlock) return;
    
    // range
    if ((NSMaxRange(range) > [self.attributedText length])) {
        range = NSMakeRange(0, self.attributedText.length);
    }
    
    // gesture
    self.userInteractionEnabled = YES;
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(x_tapAction:)];
    [self addGestureRecognizer:tapGesture];
    
    // retain block
    objc_setAssociatedObject(self, &XAttributedStringTapBlockKey, tapBlock, OBJC_ASSOCIATION_COPY_NONATOMIC);
    
    // retain range
    objc_setAssociatedObject(self, &XAttributedStringTapRangeKey, NSStringFromRange(range), OBJC_ASSOCIATION_COPY_NONATOMIC);
}

#pragma mark - event
- (void)x_tapAction:(UITapGestureRecognizer *)recognizer {
    
    // location
    CGPoint location = [recognizer locationInView:self];
//    NSLog(@"location.x = %f, location.y = %f", location.x, location.y);
    
    // range
    NSRange range = NSRangeFromString(objc_getAssociatedObject(self, &XAttributedStringTapRangeKey));
//    NSLog(@"range.location = %ld, range.length = %ld", range.location, range.length);
    
    NSTextStorage *textStorage = [[NSTextStorage alloc] init];
    NSTextContainer *textContainer = [[NSTextContainer alloc] init];
    NSLayoutManager *layoutManager = [[NSLayoutManager alloc] init];
    [textStorage addLayoutManager:layoutManager];
    [layoutManager addTextContainer:textContainer];
    
    // text container
    textContainer.size = self.bounds.size;
    textContainer.maximumNumberOfLines = self.numberOfLines;
    textContainer.lineBreakMode = self.lineBreakMode;
    textContainer.lineFragmentPadding = 0;
    
    // attrbuted text
    NSMutableAttributedString *mAttrStr = [[NSMutableAttributedString alloc] initWithAttributedString:self.attributedText];
    // ⭐️ 计算位置最大的问题是字体，如果某range没设置字体，默认系统显示默认设置的大小
    NSFont *font = objc_getAssociatedObject(self, &XAttributedStringDefaultFontKey) ?: self.font;
    [mAttrStr enumerateAttribute:NSFontAttributeName inRange:NSMakeRange(0, self.attributedText.length) options:0 usingBlock:^(id  _Nullable value, NSRange range, BOOL * _Nonnull stop) {
        if (value == nil) {
            [mAttrStr addAttribute:NSFontAttributeName value:font range:range];
        }
    }];
    [textStorage setAttributedString:mAttrStr];
    
    /**
     1. text.size 小于或等于 self.bounds.size.
     2. 触摸点(location.x <= self.bounds.size.width) && (location.y <= self.bounds.size.height)
     3. 计算下标的方法：- [NSLayoutManager glyphIndexForPoint:inTextContainer:]，使用的point是根据textSize来定的
     */
    CGSize textSize = [layoutManager usedRectForTextContainer:textContainer].size;
//    NSLog(@"selfSize.width = %f, selfSize.height = %f", self.bounds.size.width, self.bounds.size.height);
//    NSLog(@"textSize.width = %f, textSize.height = %f", textSize.width, textSize.height);
    // 按比例缩放位置
    location.x *= (textSize.width / self.bounds.size.width);
    location.y *= (textSize.height / self.bounds.size.height);
    
    NSUInteger glyphIndex = [layoutManager glyphIndexForPoint:location inTextContainer:textContainer];
    NSAttributedString *attributedSubstring = [self.attributedText attributedSubstringFromRange:NSMakeRange(glyphIndex, 1)];
    
    // block
    XAttributedStringTapBlock tapBlock = objc_getAssociatedObject(self, &XAttributedStringTapBlockKey);
    if (tapBlock && NSLocationInRange(glyphIndex, range)) {
        tapBlock(glyphIndex, attributedSubstring);
    }
}

#pragma mark - default font
- (void)x_setDefaultFont:(UIFont *)font {
    if (font) {
        objc_setAssociatedObject(self, &XAttributedStringDefaultFontKey, font, OBJC_ASSOCIATION_COPY_NONATOMIC);
    }
}

@end
