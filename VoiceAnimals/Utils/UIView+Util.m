//
//  UIView+Util.m
//  AlphaOmega
//
//  Created by Dang Thanh Than on 7/2/14.
//  Copyright (c) 2014 Apide Inc. All rights reserved.
//

#import "UIView+Util.h"

@implementation UIView (Util)

+ (id) loadView:(Class)class FromNib:(NSString *)nibName {
    NSArray* nibViews =  [[NSBundle mainBundle] loadNibNamed:nibName owner:self options:nil];
    for( id obj in nibViews ) {
        if( [obj isMemberOfClass:class] ) {
            return obj;
        }
    }
    
    for( id obj in nibViews ) {
        if( [obj isKindOfClass:class] ) {
            return obj;
        }
    }
    return nil;
}

- (void)showAlertView:(NSString *)title andMessage:(NSString *)message {
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:title
                                                    message:message
                                                   delegate:nil
                                          cancelButtonTitle:@"OK"
                                          otherButtonTitles:nil];
    [alert show];
}

- (void)showAlertView:(NSString *)title andMessage:(NSString *)message delegate:(id)delegate {
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:title
                                                    message:message
                                                   delegate:delegate
                                          cancelButtonTitle:@"OK"
                                          otherButtonTitles:nil];
    [alert show];
}

- (void)showWaitingView {

    
}
- (void)hideWaitingView {

}

+ (NSArray*)createMenuBarButtonItemWithTarget:(id)target action:(SEL)action {
    UIView *customView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 50.0, 44.0)];
    [customView setBackgroundColor:[UIColor clearColor]];
    [customView setUserInteractionEnabled:NO];
    
    UIButton *menuButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [menuButton setBackgroundColor:[UIColor clearColor]];
    [menuButton setExclusiveTouch:YES];
    [menuButton setFrame:CGRectMake(0, 0, customView.frame.size.width, customView.frame.size.height)];
    [menuButton addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    
    float imageWidth = 27.0;
    float imageHeight = 26.0;
    UIImageView *backgroundImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"btn-menu.png"]];
    [backgroundImage setFrame:CGRectMake((customView.frame.size.width - imageWidth) / 2 ,
                                         (customView.frame.size.height - imageHeight) / 2,
                                         imageWidth, imageHeight)];
    [backgroundImage setBackgroundColor:[UIColor clearColor]];
    [backgroundImage setUserInteractionEnabled:NO];
    [customView addSubview:backgroundImage];
    [customView addSubview:menuButton];
    
    UIBarButtonItem *menuBarButton = [[UIBarButtonItem alloc] initWithCustomView:customView];
    [menuBarButton setWidth:customView.frame.size.width];
    UIBarButtonItem *negativeSpacer = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
    
    [negativeSpacer setWidth:-15.0];
    return [NSArray arrayWithObjects:negativeSpacer,menuBarButton,nil];
}

+ (NSArray*)createBackBarButtonItemWithTarget:(id)target action:(SEL)action {
    UIView *customView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 50.0, 44.0)];
    [customView setBackgroundColor:[UIColor clearColor]];
    
    
    UIButton *menuButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [menuButton setBackgroundColor:[UIColor clearColor]];
    [menuButton setFrame:customView.frame];
    [menuButton setExclusiveTouch:YES];
    [menuButton addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    
    float imageWidth = 13.0;
    float imageHeight = 20.0;
    UIImageView *backgroundImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"btn-back.png"]];
    [backgroundImage setFrame:CGRectMake((customView.frame.size.width - imageWidth) / 2,
                                         (customView.frame.size.height - imageHeight) / 2,
                                         imageWidth, imageHeight)];
    [backgroundImage setBackgroundColor:[UIColor clearColor]];
    
    [customView addSubview:backgroundImage];
    [customView addSubview:menuButton];
    
    UIBarButtonItem *negativeSpacer = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
    [negativeSpacer setWidth:-25.0];
       
    UIBarButtonItem *menuBarButton = [[UIBarButtonItem alloc] initWithCustomView:customView];
    [menuBarButton setWidth:customView.frame.size.width];
    
    return [NSArray arrayWithObjects:negativeSpacer, menuBarButton, nil];
}

+ (NSArray*)createSearchBarButtonItemWithTarget:(id)target action:(SEL)action {
    UIView *customView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 50.0, 44.0)];
    [customView setBackgroundColor:[UIColor clearColor]];
    
    
    UIButton *menuButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [menuButton setBackgroundColor:[UIColor clearColor]];
    [menuButton setFrame:customView.frame];
    [menuButton addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    
    float imageWidth = 31.0;
    float imageHeight = 21.0;
    UIImageView *backgroundImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"icon-serchback.png"]];
    [backgroundImage setFrame:CGRectMake((customView.frame.size.width - imageWidth) / 2,
                                         (customView.frame.size.height - imageHeight) / 2,
                                         imageWidth, imageHeight)];
    [backgroundImage setBackgroundColor:[UIColor clearColor]];
    
    [customView addSubview:backgroundImage];
    [customView addSubview:menuButton];
    
    UIBarButtonItem *negativeSpacer = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
    [negativeSpacer setWidth:-15.0];
   
    
    UIBarButtonItem *menuBarButton = [[UIBarButtonItem alloc] initWithCustomView:customView];
    [menuBarButton setWidth:customView.frame.size.width];
    
    return [NSArray arrayWithObjects:negativeSpacer, menuBarButton, nil];
}
@end
