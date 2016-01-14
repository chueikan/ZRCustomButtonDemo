//
//  ViewController.m
//  CustomButtonDemo
//
//  Created by van7ish on 16/1/12.
//  Copyright © 2016年 van7ish. All rights reserved.
//

#import "ViewController.h"
#import "CustomButtonView.h"
#import "CustomTextView.h"

@interface ViewController () <KeyBoardViewDelegate>
@property (nonatomic, strong) UIButton * button;
@property (nonatomic, strong) CustomButtonView * customBtnView;
@property (nonatomic, strong) CustomTextView * customTextView;
@property (nonatomic, copy) NSString * buttonUrl;
@property (nonatomic, assign) BOOL mark;
@property (nonatomic, strong) UIWebView * webView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //自定义“三个按钮控件”
    _customBtnView = [[CustomButtonView alloc] initWithFrame:CGRectMake(self.view.frame.size.width / 2 - 100, 280, 200, 90)];
    [_customBtnView makeButtonsWithTitle:@"开启美食之旅"
                            andIsEditing:YES //大按钮是否处于编辑状态
                                andIsTel:NO //非编辑状态下的大按钮 点击事件是否是拨打电话(YES:拨打电话/NO:跳转网页)
                      andBackgroundColor:[UIColor orangeColor] andTitleColor:[UIColor whiteColor]
                             andFontSize:18
                      andLeftButtonTitle:@"按钮文字"
                   andleftButtonFontSize:16
            andLeftButtonBackgroundColor:[UIColor grayColor]           andRightButtonTitle:@"按钮链接"
                  andRightButtonFontSize:16
           andRightButtonBackgroundColor:[UIColor grayColor]];
    [self.view addSubview:_customBtnView];
    //如果isEditing == NO, 就为大按钮添加一个点击事件(用来跳转网页或拨打电话)
    if (!_customBtnView.isEditing) {
        [_customBtnView.bigButton addTarget:self action:@selector(skipToAnUrl) forControlEvents:UIControlEventTouchUpInside];
        
    }else {//如果isEditing == YES, 就为customButtonView添加一个自定义的输入框
        [_customBtnView.leftButton addTarget:self action:@selector(smallBtnEdit:) forControlEvents:UIControlEventTouchUpInside];
        [_customBtnView.rightButton addTarget:self action:@selector(smallBtnEdit:) forControlEvents:UIControlEventTouchUpInside];
        
        //自定义TextView控件
        _customTextView = [[CustomTextView alloc] initWithFrame:CGRectMake(0, 0, 0, 44)];
        [self.view addSubview:_customTextView];
        _customTextView.delegate = self;
        

    }
    _buttonUrl = @"http://";//在这里填充从服务器请求到的真实数据(一个网页链接或一个手机号码)

}
#pragma mark - 大按钮的点击事件(只有在isEditing == NO的时候才会执行)
- (void)skipToAnUrl{
    if (_customBtnView.isTel) {//拨打电话
        NSMutableString * str=[[NSMutableString alloc] initWithFormat:@"telprompt://%@",_buttonUrl];
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:str]];
        NSLog(@"拨打电话:%@", _buttonUrl);
    }else{//跳转网页
        _webView = [[UIWebView alloc]initWithFrame:self.view.bounds];
//        _webView.delegate = self;
        _webView.scalesPageToFit = YES;//自动对页面进行缩放以适应屏幕
        
        NSURL *url = [NSURL URLWithString:_buttonUrl];
        NSURLRequest *request = [[NSURLRequest alloc]initWithURL:url];
        [_webView loadRequest:request];
        [self.view addSubview:_webView];
        NSLog(@"跳转到:%@", _buttonUrl);
    }
    
}
#pragma mark - 小按钮的点击事件(只有在isEditing == YES 的时候才会执行)
- (void)smallBtnEdit:(UIButton *)button{
    NSLog(@"textView出现");
    if ([button isEqual:_customBtnView.leftButton]) {
        _customTextView.textView.text = _customBtnView.bigButton.titleLabel.text;
        _mark = YES;
    }else{
        if ([_buttonUrl isEqualToString:@""]) {
            _customTextView.textView.text = @"http://";
        }else {
            _customTextView.textView.text = _buttonUrl;
        }
        _mark = NO;
    }
    if (![_customTextView.textView isFirstResponder]) {
        _customTextView.center = CGPointMake(self.view.frame.size.width / 2, self.view.frame.size.height - _customTextView.frame.size.height / 2);
    }
}
#pragma mark - KeyBoradViewDelegate Method
- (void)inputText:(UITextView *)textView{
    if (_mark) {
        [_customBtnView.bigButton setTitle:textView.text forState:UIControlStateNormal];
    }else {
        _buttonUrl = textView.text;
    }
    NSLog(@"输入文字：%@", _customTextView.textView.text);

}
#pragma mark
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    if (![_customTextView.textView isFirstResponder]) {
        [_customBtnView smallButtonsHided];
        _customTextView.frame = CGRectMake(0, ScreenSize.height + 44, ScreenSize.width, 44);
    }

}
@end
