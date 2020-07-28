//
//  CodeTextField.m
//  FBSnapshotTestCase
//
//  Created by ssp on 2020/3/12.
//

#import "CodeTextField.h"

@implementation CodeTextField

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
-(void)deleteBackward{
    [super deleteBackward];
    if (self.delectBlock) {
        self.delectBlock();
    }
    
}


@end
