//
//  UIView+Animation.h
//  EMKiller
//
//  Created by Than Dang on 4/28/15.
//  Copyright (c) 2015 Than Dang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Animation)
- (void) moveTo:(CGPoint)destination duration:(float)secs option:(UIViewAnimationOptions)option;
- (void) downUnder:(float)secs option:(UIViewAnimationOptions)option;
- (void) addSubviewWithZoomInAnimation:(UIView*)view duration:(float)secs option:(UIViewAnimationOptions)option;
- (void) removeWithZoomOutAnimation:(float)secs option:(UIViewAnimationOptions)option;
- (void) addSubviewWithFadeAnimation:(UIView*)view duration:(float)secs option:(UIViewAnimationOptions)option;
- (void) removeWithSinkAnimation:(int)steps;
- (void) removeWithSinkAnimationRotateTimer:(NSTimer*) timer;
@end
