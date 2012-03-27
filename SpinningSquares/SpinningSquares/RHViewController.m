//
//  RHViewController.m
//  SpinningSquares
//
//  Created by Jimmy Theis on 3/26/12.
//  Copyright (c) 2012 Rose-Hulman Institute of Technology. All rights reserved.
//

#import "RHViewController.h"
#import "UIColor+RandomColor.h"

@implementation RHViewController

#pragma mark - View lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    _numViewsInRow = -1;
    [NSTimer scheduledTimerWithTimeInterval:kTimerPeriod
                                     target:self
                                   selector:@selector(timerEvent:)
                                   userInfo:nil
                                    repeats:YES];
}

- (void)timerEvent:(NSTimer *)timer {
    // Add a view at a certain location with a certain size
    CGFloat baseLength = self.view.bounds.size.width / kNumViewsPerRow;
    
    [UIView animateWithDuration:kTimerPeriod
                          delay:0.0
                        options:UIViewAnimationOptionBeginFromCurrentState | UIViewAnimationCurveLinear
                     animations:^ {
                         if (++ _numViewsInRow >= kNumViewsPerRow) {
                             _numViewsInRow = 0;
                             
                             for (UIView *view in self.view.subviews) {
                                 CGPoint newCenter = view.center;
                                 newCenter.y = view.center.y + baseLength;
                                 view.center = newCenter;
                                 
                                 view.transform = CGAffineTransformScale(view.transform, 1.2, 1.2);
                                 view.backgroundColor = [UIColor randomColor];
                             }
                         }
                         
                         CGFloat nextXCenter = baseLength / 2 + baseLength * _numViewsInRow;
                         CGFloat nextYCenter = baseLength;
                         CGFloat nextEdgeLength = (CGFloat) (kNumViewsPerRow - _numViewsInRow) / kNumViewsPerRow * baseLength;
                         
                         UIView *nextView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, nextEdgeLength, nextEdgeLength)];
                         nextView.center = CGPointMake(nextXCenter, nextYCenter);
                         nextView.backgroundColor = [UIColor randomColor];
                         
                         [self.view addSubview:nextView];
                         
                         // Rotate all views
                         for (UIView *view in self.view.subviews) {
                             view.transform = CGAffineTransformRotate(view.transform, 1.0 / kNumViewsPerRow * 2.0 * M_PI);
                         }
                     }
                     completion:^(BOOL finished) {
                         
                     }];
}

@end
