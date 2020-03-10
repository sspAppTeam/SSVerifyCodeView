//
//  UITextField+DeleteWord.m
//  FBSnapshotTestCase
//
//  Created by ssp on 2020/3/9.
//

#import "UITextField+DeleteWord.h"

#import <objc/runtime.h>
NSString * const TextFieldDidDeleteBackwardNotification = @"TextFieldDidDeleteBackwardNotification";
@implementation UITextField (DeleteWord)
+ (void)load {
    Method method1 = class_getInstanceMethod([self class], NSSelectorFromString(@"deleteBackward"));
    Method method2 = class_getInstanceMethod([self class], @selector(textField_deleteBackward));
    method_exchangeImplementations(method1, method2);
}

- (void)textField_deleteBackward {
    [[NSNotificationCenter defaultCenter] postNotificationName:TextFieldDidDeleteBackwardNotification object:nil];
}
@end
