//
//  CustomButtonView.m
//  CustomButtonDemo
//
//  Created by van7ish on 16/1/12.
//  Copyright © 2016年 van7ish. All rights reserved.
//

#import "CustomButtonView.h"

//self
#define selfWidth self.frame.size.width //160
#define selfHeight self.frame.size.height //80
#define selfX self.frame.origin.x // 居中于屏幕
#define selfY self.frame.origin.y // 280

//margin
#define bigLeftMargin 5
#define bigRightMargin 5
#define bigTopMargin 3
#define bigBottomMargin 3
#define smallLeftMargin 8
#define smallRightMargin 8
#define smallTopMargin 5
#define smallBottomMargin 3

//bigButton
#define bigX bigLeftMargin
#define bigY selfHeight / 2 + bigTopMargin
#define bigWidth selfWidth - bigLeftMargin - bigRightMargin
#define bigHeight selfHeight / 2 - bigTopMargin - bigBottomMargin

//leftSmallButton
#define leftSmallX smallLeftMargin
#define leftSmallY  smallTopMargin
#define leftSmallWidth selfWidth / 2 - smallLeftMargin - 0.5
#define leftSmallHeight selfHeight / 2 - smallTopMargin - smallBottomMargin

//rightSmallButton
#define rightSmallX selfWidth / 2 + 0.5
#define rightSmallY smallTopMargin
#define rightSmallWidth selfWidth / 2 - smallLeftMargin - 0.5
#define rightSmallHeight selfHeight / 2 - smallTopMargin - smallBottomMargin

@implementation CustomButtonView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.frame = frame;
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}
/**
 *  方法描述，见.h文件
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
andRightButtonBackgroundColor:(UIColor *)RightBgColor
{
    if (isEditing) {//大按钮处于可编辑状态
        //⬇️附带的左右两个按钮⬇️
        //左小按钮
        _leftButton = [[UIButton alloc] init];
        [_leftButton setTitle:leftTitle forState:UIControlStateNormal];
        _leftButton.backgroundColor = [UIColor grayColor];
        _leftButton.titleLabel.font = [UIFont systemFontOfSize:leftButtonTitleSize];
        _rightButton.backgroundColor = leftBgColor;
        _leftButton.layer.cornerRadius = 4;
        //    [_leftButton addTarget:self action:@selector(smallButtonEdit:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_leftButton];
        
        //右小按钮
        _rightButton = [[UIButton alloc] init];
        [_rightButton setTitle:rightTitle forState:UIControlStateNormal];
        _rightButton.titleLabel.font = [UIFont systemFontOfSize:rightButtonTitleSize];
        _rightButton.backgroundColor = RightBgColor;
        _rightButton.layer.cornerRadius = 4;
        //    [_rightButton addTarget:self action:@selector(smallButtonEdit:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_rightButton];
        
        
        //初始状态，两个小按钮不显示
        [self smallButtonsHided];
        
        
    }

    
    //大按钮
    _bigButton = [[UIButton alloc] initWithFrame:CGRectMake(bigX, bigY, bigWidth, bigHeight)];
    [_bigButton setTitle:title forState:UIControlStateNormal];
    _bigButton.backgroundColor = bgColor;
    [_bigButton setTitleColor:titleColor forState:UIControlStateNormal];
    _bigButton.titleLabel.font = [UIFont systemFontOfSize:bigButtonTitleSize];
    _bigButton.layer.cornerRadius = 4;
    [_bigButton addTarget:self action:@selector(bigButtonClicked) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:_bigButton];
    
    
    

    
    
    _isEditing = isEditing;
    _isTel = isTel;
    
}
/**
 *  大按钮被点击
 */
- (void)bigButtonClicked{
    if (_isEditing) {//可编辑状态
        [self smallButtonsShowed];
    }
        
    
    
}
/**
 *  显示两个小按钮
 */
- (void)smallButtonsShowed{
    _leftButton.frame = CGRectMake(leftSmallX, leftSmallY, leftSmallWidth, leftSmallHeight);
    _rightButton.frame = CGRectMake(rightSmallX, rightSmallY, leftSmallWidth, leftSmallHeight);
}
/**
 *  隐藏两个小按钮
 */
- (void)smallButtonsHided{
    _leftButton.center = CGPointMake(_bigButton.center.x, _bigButton.center.y);
    _rightButton.center = CGPointMake(_bigButton.center.x, _bigButton.center.y);
}




@end
