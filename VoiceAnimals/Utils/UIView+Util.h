//
//  UIView+Util.h
//  AlphaOmega
//
//  Created by Dang Thanh Than on 7/2/14.
//  Copyright (c) 2014 Apide Inc. All rights reserved.
//



@interface UIView (Util)

+ (id) loadView:(Class) class FromNib:(NSString *) nibName;

- (void)showAlertView:(NSString *)title andMessage:(NSString *)message;
- (void)showAlertView:(NSString *)title andMessage:(NSString *)message delegate:(id)delegate;

- (void)showWaitingView;
- (void)hideWaitingView;


+ (NSArray*)createMenuBarButtonItemWithTarget:(id)target action:(SEL)action;
+ (NSArray*)createBackBarButtonItemWithTarget:(id)target action:(SEL)action;
+ (NSArray*)createSearchBarButtonItemWithTarget:(id)target action:(SEL)action;

@end
