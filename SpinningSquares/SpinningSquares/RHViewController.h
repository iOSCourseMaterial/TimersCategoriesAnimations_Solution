//
//  RHViewController.h
//  SpinningSquares
//
//  Created by Jimmy Theis on 3/26/12.
//  Copyright (c) 2012 Rose-Hulman Institute of Technology. All rights reserved.
//

#import <UIKit/UIKit.h>

#define kTimerPeriod 1.0
#define kNumViewsPerRow 6

@interface RHViewController : UIViewController {
    @private 
    NSInteger _numViewsInRow;
}

- (void)timerEvent:(NSTimer *)timer;

@end
