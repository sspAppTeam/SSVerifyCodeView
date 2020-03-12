//
//  SSVerifyCodeView.m
//  FBSnapshotTestCase
//
//  Created by ssp on 2020/3/9.
//

#import "SSVerifyCodeView.h"
#import "CodeTextField+DeleteWord.h"
#import "CodeTextField.h"
#import <Masonry/Masonry.h>
#define MARGIN 10

@interface SSVerifyCodeView ()
@property (nonatomic,strong) UIView *bgView;
@property (nonatomic,strong) CodeTextField *textField;
@property (nonatomic,strong) NSMutableArray <UILabel *>*labelArray;
@property (nonatomic,copy) NSString *codeString;
@end
@implementation SSVerifyCodeView
- (instancetype)init
{
    self = [super init];
    if (self) {
        self.labelArray = [NSMutableArray array];
        self.isSecure=YES;
        self.isSegmentation=YES;
        [self initCodeView];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(deleteBackward) name:TextFieldDidDeleteBackwardNotification object:nil];
    }
    return self;
}
- (void)initCodeView {
    if (self.isSegmentation) {
         [self initSegmentUI];
    }else{
        [self initUI];
    }
    
   
     
}
-(void)setCodeNumber:(int)codeNumber{
    _codeNumber=codeNumber;
    [self initCodeView];
}
- (void)initSegmentUI {
    if (self.bgView) {
        [self.bgView removeFromSuperview];
        self.bgView=nil;
    }
   
    [self addSubview:self.bgView];
    
    [self.bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.equalTo(self);
        make.left.equalTo(self).offset(MARGIN);
        make.right.equalTo(self).offset(-MARGIN);
    }];
        int count = self.codeNumber ? self.codeNumber :6;
    CGFloat width = ([UIScreen mainScreen].bounds.size.width - 2 * MARGIN-MARGIN *(count-1)) / count;
    width=40;
    for (int i = 0; i < count; i ++) {
        
        UILabel *label = [[UILabel alloc] init];
        label.textColor = [UIColor blackColor];
        label.font = [UIFont systemFontOfSize:20];
        label.textAlignment = NSTextAlignmentCenter;
        label.backgroundColor=[UIColor whiteColor];
        label.text = nil;
        
               label.layer.masksToBounds = YES;
               label.layer.borderColor = [UIColor colorWithRed:226/255.0 green:226/255.0 blue:226/255.0 alpha:1].CGColor;//边框颜色
               label.layer.borderWidth = 1.5;//边框宽度
        [_bgView addSubview:label];
        
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.bottom.equalTo(self);
            make.left.equalTo(self).offset(i * (width +MARGIN)+MARGIN);
            make.width.mas_equalTo(@(width));
        }];
        label.tag = i;
        [self.labelArray addObject:label];
    }

    
    _textField = [[CodeTextField alloc] init];
    _textField.borderStyle=UITextBorderStyleNone;
    [self addSubview:_textField];
//    _textField.backgroundColor=[UIColor greenColor];
    
    [_textField becomeFirstResponder];
    _textField.keyboardType = UIKeyboardTypeNumberPad;
    [_textField addTarget:self action:@selector(textDidChanged:) forControlEvents:(UIControlEventEditingChanged)];
}
- (void)initUI {
    if (self.bgView) {
        [self.bgView removeFromSuperview];
        self.bgView=nil;
    }
   
    [self addSubview:self.bgView];
     self.bgView.layer.borderColor = [[UIColor blackColor] colorWithAlphaComponent:0.3].CGColor;
     self.bgView.layer.borderWidth = 1;
     self.bgView.backgroundColor = [UIColor whiteColor];
    
    [self.bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.equalTo(self);
        make.left.equalTo(self).offset(MARGIN);
        make.right.equalTo(self).offset(-MARGIN);
        
    }];
        int count = self.codeNumber ? self.codeNumber :6;
    CGFloat width = ([UIScreen mainScreen].bounds.size.width - 2 * MARGIN) / count;

    for (int i = 0; i < count; i ++) {
        UILabel *label = [[UILabel alloc] init];
        label.textColor = [UIColor blackColor];
        label.font = [UIFont systemFontOfSize:20];
        label.textAlignment = NSTextAlignmentCenter;
        label.text = nil;
        [_bgView addSubview:label];
        
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.bottom.equalTo(self);
            make.left.equalTo(self).offset(i * width + MARGIN);
            make.width.mas_equalTo(@(width));
        }];
        label.tag = i;
        [self.labelArray addObject:label];
    }

    
    for (int i = 0; i < count-1; i ++) {
        
        UIView *line = [[UIView alloc] init];
        line.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.3];
        [_bgView addSubview:line];
        
        [line mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.bottom.equalTo(self);
            make.left.equalTo(self).offset((i + 1) * width - 0.5 + MARGIN);
            make.width.mas_equalTo(@(1));
        }];
    }
    
    _textField = [[CodeTextField alloc] init];
    [self addSubview:_textField];
    
    [_textField becomeFirstResponder];
    _textField.keyboardType = UIKeyboardTypeNumberPad;
    [_textField addTarget:self action:@selector(textDidChanged:) forControlEvents:(UIControlEventEditingChanged)];
}

- (void)textDidChanged:(UITextField *)textField {
     int count = self.codeNumber ? self.codeNumber :6;
    if (textField.text.length >=count ) {
        
        for (int i = 0; i < self.labelArray.count; i ++) {
            UILabel *label = self.labelArray[i];
            label.text = [textField.text substringFromIndex:i + 1];
            if (self.isSecure) {
                label.text = @"●";
            }
        }
        if (textField.text.length == count) {
            _codeString = textField.text;
        }else {
            _codeString = [textField.text substringToIndex:count];
        }
        
    }else {
        for (int i = 0; i < self.labelArray.count; i ++) {
            UILabel *label = self.labelArray[i];
            
            if (label.text == nil) {
                label.text = textField.text;
                if (self.isSecure) {
                    label.text = @"●";
                }
                break;
            }
        }
    }

    
    if (_codeString.length < count) {
        if (_codeString == nil) {
            _codeString = textField.text;
        }else {
            _codeString = [_codeString stringByAppendingString:textField.text];
        }
    }

    textField.text = nil;
    
    if (_codeString.length == count && _codeString != nil) {
//        回调
        if (_codeInputCompeletBlock) {
            _codeInputCompeletBlock (_codeString);
        }
    }
    
    NSLog(@"==textDidChanged=%@",_codeString);
}


- (void)deleteBackward {
    
    for (int i = (int)self.labelArray.count - 1; i >= 0; i --) {
        UILabel *label = self.labelArray[i];
        
        if (label.text != nil) {
            label.text = nil;
            if (_codeString != nil) {
                _codeString = [_codeString substringToIndex:i];
                if (i == 0) {
                    _codeString = nil;
                }
            }
            break;
        }
    }
    NSLog(@"%@",_codeString);
}

- (void)clearCode {
    for (UILabel *label in self.labelArray) {
        label.text = nil;
    }
    _codeString = nil;
    _textField.text = nil;
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}
#pragma mark - lazy
-(UIView *)bgView{
    if (!_bgView) {
        _bgView=[[UIView alloc] init];
//          _bgView.layer.borderColor = [[UIColor blackColor] colorWithAlphaComponent:0.3].CGColor;
//          _bgView.layer.borderWidth = 1;
//          _bgView.backgroundColor = [UIColor whiteColor];
        
    }
    return _bgView;
}
-(UITextField*)textField{
    if (!_textField) {
        _textField=[[CodeTextField alloc] init];
    }
    return _textField;
}
@end
