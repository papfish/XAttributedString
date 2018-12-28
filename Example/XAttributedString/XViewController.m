//
//  XViewController.m
//  XAttributedString
//
//  Created by Leo on 04/16/2018.
//  Copyright (c) 2018 Leo. All rights reserved.
//

#import "XViewController.h"
#import "XAttributedString-umbrella.h"

@interface XViewController ()

@property (weak, nonatomic) IBOutlet UILabel *atrLab;
@property (weak, nonatomic) IBOutlet UILabel *atrTapLab;

@end

@implementation XViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
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
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
