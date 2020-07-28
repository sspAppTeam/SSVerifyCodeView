//
//  CodeTextField.h
//  FBSnapshotTestCase
//
//  Created by ssp on 2020/3/12.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface CodeTextField : UITextField
@property (nonatomic,copy) void(^delectBlock)(void);
@end

NS_ASSUME_NONNULL_END
