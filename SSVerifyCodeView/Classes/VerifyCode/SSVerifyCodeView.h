//
//  SSVerifyCodeView.h
//  FBSnapshotTestCase
//
//  Created by ssp on 2020/3/9.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface SSVerifyCodeView : UIView
/**
 设置好属性后调用初始化密码框方法
 */
- (void)initCodeView;

/**
 清除输入密码
 */
- (void)clearCode;

/**
 默认yes
 */
@property (nonatomic,assign) BOOL isSecure;
/**
默认 6个密码
*/
@property (nonatomic,assign) int codeNumber;

/**
 输入完成后的回调
 */
@property (nonatomic,copy) void (^codeInputCompeletBlock) (NSString *codeString);

@end

NS_ASSUME_NONNULL_END
