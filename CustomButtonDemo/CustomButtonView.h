//
//  CustomButtonView.h
//  CustomButtonDemo
//
//  Created by van7ish on 16/1/12.
//  Copyright © 2016年 van7ish. All rights reserved.
//

#import <UIKit/UIKit.h>
@interface CustomButtonView : UIView

#define ScreenSize [UIScreen mainScreen].bounds.size

@property (nonatomic, strong) UIButton * bigButton;
@property (nonatomic, strong) UIButton * leftButton;
@property (nonatomic, strong) UIButton * rightButton;
@property (nonatomic, assign) BOOL isEditing;
@property (nonatomic, assign) BOOL isTel;

@property (nonatomic, copy) NSMutableString * skipToThisURL;//电话号码or网页链接

/**
 *  生成三个按钮
 *
 *  @param title             大按钮的标题
 *  @param isEditing         大按钮是否处于可编辑状态
 *  @param isTel             大按钮点击之后是否拨打电话(YES:拨打电话/NO:跳转网页)
 *  @param bgColor           大按钮背景色
 *  @param titleColor        大按钮标题颜色
 *  @param size              大按钮字体大小
 *  @param leftTitle         左小按钮标题
 *  @param size              左小按钮字体大小
 *  @param leftBgColor       左小按钮背景色
 *  @param rightTitle        右小按钮标题
 *  @param size              右小按钮字体大小
 *  @param RightBgColor      右小按钮背景色
 */
- (void)makeButtonsWithTitle:(NSString *)title
                andIsEditing:(BOOL)isEditing
                    andIsTel:(BOOL)isTel
          andBackgroundColor:(UIColor *)bgColor
               andTitleColor:(UIColor *)titleColor
                 andFontSize:(CGFloat)bigButtonTitleSize
          andLeftButtonTitle:(NSString *)leftTitle
       andleftButtonFontSize:(CGFloat)leftButtonTitleSize
andLeftButtonBackgroundColor:(UIColor *)leftBgColor
         andRightButtonTitle:(NSString *)rightTitle
      andRightButtonFontSize:(CGFloat)rightButtonTitleSize
andRightButtonBackgroundColor:(UIColor *)RightBgColor;


- (void)bigButtonClicked;
- (void)smallButtonsHided;
@end
