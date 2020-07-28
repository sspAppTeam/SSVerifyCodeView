//
//  SSViewController.m
//  SSVerifyCodeView
//
//  Created by SSPSource on 03/09/2020.
//  Copyright (c) 2020 SSPSource. All rights reserved.
//

#import "SSViewController.h"
#import <SSVerifyCodeView/SSVerifyCodeView.h>
#import <Masonry/Masonry.h>

@interface SSViewController ()

@end

@implementation SSViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	SSVerifyCodeView *view = [[SSVerifyCodeView alloc] init];
    CGFloat width = ([UIScreen mainScreen].bounds.size.width - 2 * 20-20 *(6-1)) / 6;
    [self.view addSubview:view];
    int widthdd=self.view.bounds.size.width-80;
    [view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).offset(200);
        make.left.mas_equalTo(self.view).offset(40);
         make.right.mas_equalTo(self.view).offset(-40);
        make.height.mas_equalTo(width);
    }];
    [self.view setNeedsLayout];
    [self.view layoutIfNeeded];
    
//    view.isSecure=NO;
//    view.isNumber=10;
    __weak SSVerifyCodeView *weakView = view;
    view.codeInputCompeletBlock = ^(NSString * _Nonnull codeString) {
        NSLog(@"打印=%@",codeString);
    };
          
//          [view initCodeView];
}
//涉及到
-(void)viewWillAppear:(BOOL)animated
{
// [IQKeyboardManager sharedManager].shouldResignOnTouchOutside = NO;
//     [IQKeyboardManager sharedManager].enable = NO;
//    [IQKeyboardManager sharedManager].enableAutoToolbar = NO;
}

-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:YES];
//    [IQKeyboardManager sharedManager].shouldResignOnTouchOutside = YES;
//    [IQKeyboardManager sharedManager].enable = YES;
//    [IQKeyboardManager sharedManager].enableAutoToolbar = YES;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
