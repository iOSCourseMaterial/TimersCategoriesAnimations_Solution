//
//  UIColor+RandomColor.m
//  SpinningSquares
//
//  Created by Jimmy Theis on 3/26/12.
//  Copyright (c) 2012 Rose-Hulman Institute of Technology. All rights reserved.
//

#import "UIColor+RandomColor.h"

@implementation UIColor (RandomColor)

+ (UIColor *)randomColor {
    static BOOL isSeeded = NO;
    
    if (isSeeded == NO) {
        srand(time(NULL));
        isSeeded = YES;
    }
    
    return [UIColor colorWithRed:(CGFloat) random() / RAND_MAX
                           green:(CGFloat) random() / RAND_MAX
                            blue:(CGFloat) random() / RAND_MAX
                           alpha:1];
}

@end
