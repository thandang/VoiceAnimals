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
#import "EMAudioController.h"
#import "BFPaperButton.h"
#import "FAKFontAwesome.h"



@interface VAMainViewController () <ADBannerViewDelegate, FancyTabBarDelegate> {
    UIView *_viewInfo;
    ADBannerView    *_banner;
    BOOL            _bannerVisible;
    
    FancyTabBar *_fancyTabBar;
    
    __weak UIImageView *_backgroundImageView;
    
    __weak UILabel *_lblStop;
    __weak BFPaperButton   *_btnStop;
    BOOL    _isPlaying;
}

@property (nonatomic, strong) UIImageView *backgroundView;

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
    CGRect mainFrame = [VAUtils getMainScreenBounds];
//    self.view = [[UIView alloc] initWithFrame:mainFrame];
    [self.navigationController setNavigationBarHidden:YES];
    
    if (!_backgroundImageView) {
        UIImageView *img = [[UIImageView alloc] initWithFrame:CGRectMake(0.0, 0.0, mainFrame.size.width, mainFrame.size.height)];
        //TODO setup image scale
        img.contentMode = UIViewContentModeScaleAspectFit;
        [self.view addSubview:img];
        _backgroundImageView = img;
    }
    [_backgroundImageView setImage:[UIImage imageNamed:@"tieng_bo_keu"]];
    [self.view bringSubviewToFront:_backgroundImageView];
    
    if (!_lblStop) {
        UILabel *lbl = [[UILabel alloc] initWithFrame:CGRectMake(self.view.frame.size.width - 50.0, 20.0, 40.0, 40.0)];
        lbl.layer.cornerRadius = 20.0;
        lbl.textAlignment = NSTextAlignmentCenter;
        lbl.textColor = kCOLOR_BACKGROUND;
        FAKFontAwesome *font = [FAKFontAwesome pauseIconWithSize:40.0];
        lbl.attributedText = [font attributedString];
        [self.view addSubview:lbl];
        _lblStop = lbl;
    }

    if (!_btnStop) {
        BFPaperButton *btn = [[BFPaperButton alloc] initFlatWithFrame:_lblStop.frame];
        [btn setTitle:@"" forState:UIControlStateNormal];
        [btn setBackgroundColor:[UIColor clearColor]];
        btn.layer.cornerRadius = 20.0;
        [btn addTarget:self action:@selector(stopAllPlay) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:btn];
        _btnStop = btn;
    }
    
    _fancyTabBar = [[FancyTabBar alloc]initWithFrame:self.view.bounds];
    [_fancyTabBar setUpChoices:self choices:@[kBo, kChim, kCho, kDe, kEch, kMeo] withMainButtonImage:[UIImage imageNamed:@"main_button"]];
    _fancyTabBar.delegate = self;
    [self.view addSubview:_fancyTabBar];
}

- (void) viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    _banner = [[ADBannerView alloc] initWithFrame:CGRectMake(0.0, self.view.frame.size.height, self.view.frame.size.width, 50.0)];
    [_banner setDelegate:self];
}


#pragma mark - Play
- (void) startPlayingWithSoundName:(NSString *)soundName {
    [[EMAudioController shareInstance] stopPlaying];
    [[EMAudioController shareInstance] configWithSoundName:soundName];
    [[EMAudioController shareInstance] playAsMusicPlayer];
}

- (void) stopAllPlay {
    FAKFontAwesome *font = nil;
    if (_isPlaying) {
        font = [FAKFontAwesome playIconWithSize:40.0];
        _isPlaying = NO;
        [[EMAudioController shareInstance] stopPlaying];
    } else {
        font = [FAKFontAwesome pauseIconWithSize:40.0];
        [[EMAudioController shareInstance] playAsMusicPlayer];
        _isPlaying = YES;
    }
    _lblStop.attributedText = [font attributedString];
    
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
        DEBUG_LOG(@"1");
    } else if (index == 2) {
        UIAlertView *alr = [[UIAlertView alloc] initWithTitle:@"Sorry" message:@"This feature are currently develop. \nComming soon" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alr show];
    } else if (index == 3) {
        DEBUG_LOG(@"3");
    } else if (index == 4) {
        DEBUG_LOG(@"4");
    } else if (index == 5) {
        DEBUG_LOG(@"5");
    } else if (index == 6) {
        DEBUG_LOG(@"6");
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
