//
//  VAMainViewController.m
//  VoiceAnimals
//
//  Created by Than Dang on 5/27/15.
//  Copyright (c) 2015 Than Dang. All rights reserved.
//

#import "VAMainViewController.h"
#import <iAd/iAd.h>
#import "FancyTabBar.h"
#import "UIView+Screenshot.h"
#import "UIImage+ImageEffects.h"


@interface VAMainViewController () <ADBannerViewDelegate, FancyTabBarDelegate> {
    UIView *_viewInfo;
    ADBannerView    *_banner;
    BOOL            _bannerVisible;
    
    FancyTabBar *_fancyTabBar;
}

@property (nonatomic,strong) UIImageView *backgroundView;

@end

@implementation VAMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) loadView {
    [super loadView];
    
    _fancyTabBar = [[FancyTabBar alloc]initWithFrame:self.view.bounds];
    [_fancyTabBar setUpChoices:self choices:@[@"New", @"Camera"] withMainButtonImage:[UIImage imageNamed:@"main_button"]];
    _fancyTabBar.delegate = self;
    [self.view addSubview:_fancyTabBar];
}

- (void) viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    _banner = [[ADBannerView alloc] initWithFrame:CGRectMake(0.0, self.view.frame.size.height, self.view.frame.size.width, 50.0)];
    [_banner setDelegate:self];
}


#pragma mark - FancyTabBarDelegate
- (void) didCollapse{
    [UIView animateWithDuration:0.3 animations:^{
        _backgroundView.alpha = 0;
    } completion:^(BOOL finished) {
        if(finished) {
            [_backgroundView removeFromSuperview];
            _backgroundView = nil;
        }
    }];
}


- (void) didExpand{
    if(!_backgroundView){
        _backgroundView = [[UIImageView alloc]initWithFrame:self.view.bounds];
        _backgroundView.alpha = 0;
        [self.view addSubview:_backgroundView];
    }
    
    [UIView animateWithDuration:0.3 animations:^{
        _backgroundView.alpha = 1;
    } completion:^(BOOL finished) {
    }];
    
    [self.view bringSubviewToFront:_fancyTabBar];
    UIImage *backgroundImage = [self.view convertViewToImage];
    UIColor *tintColor = [UIColor colorWithWhite:1.0 alpha:0.5];
    UIImage *image = [backgroundImage applyBlurWithRadius:10 tintColor:tintColor saturationDeltaFactor:1.8 maskImage:nil];
    _backgroundView.image = image;
}

- (void)optionsButton:(UIButton*)optionButton didSelectItem:(int)index{
    if (index == 1) {

    } else if (index == 2) {
        UIAlertView *alr = [[UIAlertView alloc] initWithTitle:@"Sorry" message:@"This feature are currently develop. \nComming soon" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alr show];
    }
}

#pragma mark - ADBanner Delegate
- (void) bannerViewDidLoadAd:(ADBannerView *)banner {
    if (!_bannerVisible) {
        //If banner isn't part of view hierachy, add it
        if (_banner.superview == nil) {
            [self.view addSubview:_banner];
        }
        [UIView beginAnimations:@"animateAdBannerOn" context:NULL];
        banner.frame = CGRectOffset(banner.frame, 0, -banner.frame.size.height);
        [UIView commitAnimations];
        _bannerVisible = YES;
    }
}

- (void) bannerView:(ADBannerView *)banner didFailToReceiveAdWithError:(NSError *)error {
    if (_bannerVisible) {
        [UIView beginAnimations:@"animateAdBannerOff" context:NULL];
        banner.frame = CGRectOffset(banner.frame, 0, banner.frame.size.height);
        [UIView commitAnimations];
        _bannerVisible = NO;
    }
}



@end
