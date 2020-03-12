//
//  CodeTextField+DeleteWord.m
//  FBSnapshotTestCase
//
//  Created by ssp on 2020/3/12.
//

#import "CodeTextField+DeleteWord.h"

#import <objc/runtime.h>
NSString * const TextFieldDidDeleteBackwardNotification = @"TextFieldDidDeleteBackwardNotification";
@implementation CodeTextField (DeleteWord)
+ (void)load {
    [super load];
    if ([self isKindOfClass:[CodeTextField class]]) {
        Method method1 = class_getInstanceMethod([self class], NSSelectorFromString(@"deleteBackward"));
           Method method2 = class_getInstanceMethod([self class], @selector(textField_deleteBackward));
           method_exchangeImplementations(method1, method2);
    }
   
}

- (void)textField_deleteBackward {
    [[NSNotificationCenter defaultCenter] postNotificationName:TextFieldDidDeleteBackwardNotification object:nil];
}

@end
