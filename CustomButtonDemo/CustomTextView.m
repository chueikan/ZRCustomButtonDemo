//
//  CustomTextView.m
//  Mode
//
//  Created by van7ish on 16/1/12.
//  Copyright © 2016年 van7ish. All rights reserved.
//

#import "CustomTextView.h"
#define ScreenSize [UIScreen mainScreen].bounds.size

//在这里改变textView的高度
#define kTextViewHieght self.frame.size.height

@implementation CustomTextView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self createTextView];
    }
    return self;
}

- (void)createTextView{
    self.frame = CGRectMake(0, ScreenSize.height + kTextViewHieght, ScreenSize.width, kTextViewHieght);
    self.backgroundColor = [UIColor colorWithWhite:0.7 alpha:0.5];
    
    
    _confirmBtn = [[UIButton alloc] initWithFrame:CGRectMake(self.frame.size.width - 60, self.frame.size.height - 40 , 56, 36)];
    [_confirmBtn setTitle:@"确认" forState:UIControlStateNormal];
    [_confirmBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    _confirmBtn.backgroundColor = [UIColor orangeColor];
    _confirmBtn.layer.cornerRadius = 4;
    _confirmBtn.titleLabel.font = [UIFont systemFontOfSize:16];
    [_confirmBtn addTarget:self action:@selector(pressBtn:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:_confirmBtn];
    
    
    
    _textView = [[UITextView alloc] initWithFrame:CGRectMake(3, 3, ScreenSize.width - 6, self.frame.size.height - 6)];
    _textView.layer.cornerRadius = 6;
    _textView.font = [UIFont systemFontOfSize:16];
    [self addSubview:_textView];
    

    //监听键盘出现
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyBoardShow:) name:UIKeyboardWillShowNotification object:nil];
    
    //监听键盘隐藏
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyBoardHide:) name:UIKeyboardDidHideNotification object:nil];

}

/**
 *  确认按钮的点击事件
 */
- (void)pressBtn:(UIButton *)button{
    NSLog(@"确认");
    if (_delegate && [_delegate respondsToSelector:@selector(inputText:)]) {
        [_delegate inputText:_textView];
        [_textView resignFirstResponder];
        self.frame = CGRectMake(0, ScreenSize.height + kTextViewHieght, ScreenSize.width, kTextViewHieght);
    }
}

/**
 *  键盘出现的通知方法
 *
 *  @param notify <#notify description#>
 */
- (void)keyBoardShow:(NSNotification *)notify{
    NSDictionary* info = [notify userInfo];
    //kbSize为键盘尺寸(width, height)
    CGSize kbSize = [[info objectForKey:UIKeyboardFrameEndUserInfoKey] CGRectValue].size;//得到键盘的高度
    self.frame = CGRectMake(0, ScreenSize.height - kbSize.height - self.frame.size.height, ScreenSize.width, self.frame.size.height);
    
    _textView.frame = CGRectMake(_textView.frame.origin.x, _textView.frame.origin.y, _textView.frame.size.width - 60, _textView.frame.size.height);
    
    
    
}

/**
 *  键盘隐藏的通知方法
 *
 *  @param notify <#notify description#>
 */
- (void)keyBoardHide:(NSNotification *)notify{
    _textView.frame = CGRectMake(3, 3, ScreenSize.width - 6, self.frame.size.height - 6);
}
@end
