//
//  MQFloatButton.h
//  MQFloatButtonDemo
//
//  Created by 120v on 2018/4/10.
//  Copyright © 2018年 MQ. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, MQAssistiveTouchType)
{
    MQAssistiveTouchTypeNone = 0,         //没可以随便移动
    MQAssistiveTouchTypeVerticalScroll,   //只能垂直移动
    MQAssistiveTouchTypeHorizontalScroll, //只能竖直移动
};


@interface MQFloatButton : UIButton

///简单创建一个普通按钮
+ (instancetype)mn_touchWithFrame:(CGRect)frame;


/**
 创建一个可拖动按钮
 
 @param type 滑动类型
 @param frame 按钮的frame
 @param title 按钮的标题内容
 @param titleColor 按钮的标题颜色
 @param titleFont 按钮的标题文字大小
 @param backgroundColor 按钮的背景色
 @param backgroundImage 按钮的背景图片
 @return 可拖动按钮
 */
+ (instancetype)mn_touchWithType:(MQAssistiveTouchType)type
                           Frame:(CGRect)frame
                           title:(NSString *)title
                      titleColor:(UIColor *)titleColor
                       titleFont:(UIFont *)titleFont
                 backgroundColor:(UIColor *)backgroundColor
                 backgroundImage:(UIImage *)backgroundImage;



@end
