#ifdef __OBJC__
#import <UIKit/UIKit.h>
#else
#ifndef FOUNDATION_EXPORT
#if defined(__cplusplus)
#define FOUNDATION_EXPORT extern "C"
#else
#define FOUNDATION_EXPORT extern
#endif
#endif
#endif

#import "NSMutableAttributedString+XAttributedString.h"
#import "UILabel+XAttributedString.h"

FOUNDATION_EXPORT double XAttributedStringVersionNumber;
FOUNDATION_EXPORT const unsigned char XAttributedStringVersionString[];

