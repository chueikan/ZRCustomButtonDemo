//
//  CustomTextView.h
//  Mode
//
//  Created by van7ish on 16/1/12.
//  Copyright © 2016年 van7ish. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol KeyBoardViewDelegate <NSObject>

@optional

- (void)inputText:(UITextView *)textView;

@end
@interface CustomTextView : UIView
@property (nonatomic, strong) UITextView * textView;
@property (nonatomic, strong) UIButton * confirmBtn;

@property(nonatomic, assign) id <KeyBoardViewDelegate> delegate;

@end
