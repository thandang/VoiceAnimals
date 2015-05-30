//
//  EMAudioController.m
//  EMKiller
//
//  Created by Than Dang on 4/28/15.
//  Copyright (c) 2015 Than Dang. All rights reserved.
//

#import "EMAudioController.h"
#import <Foundation/Foundation.h>


@interface EMAudioController () <AVAudioPlayerDelegate>

@property (strong, nonatomic) AVAudioSession *audioSession;
@property (strong, nonatomic) AVAudioPlayer *backgroundMusicPlayer;
@property (assign) BOOL backgroundMusicPlaying;
@property (assign) BOOL backgroundMusicInterrupted;
@property (nonatomic, assign) SystemSoundID soundId;

@end

@implementation EMAudioController


+ (EMAudioController *) shareInstance {
    static EMAudioController    *instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (!instance) {
            instance = [[EMAudioController alloc] init];
        }
    });
    return instance;
}

- (instancetype) init {
    self = [super init];
    if (self) {
        _isRepeat = YES;
//        [self configureAudioSession];
    }
    return self;
}

- (void) configWithSoundName:(NSString *)soundName {
    [self configureAudioPlayer:soundName];
    [self configureSystemSound:soundName];
}

- (void) stopPlaying {
    [self.backgroundMusicPlayer stop];

}

- (void) playAsMusicPlayer {
    [self.backgroundMusicPlayer prepareToPlay];
    [self.backgroundMusicPlayer play];
    self.backgroundMusicPlaying = YES;
}

- (void) playSystemSound {
    AudioServicesAddSystemSoundCompletion(self.soundId, nil, nil, completionCallback, (__bridge void*) self);
    AudioServicesPlaySystemSound(self.soundId);
}

- (void) callbackPlayingSound {
    AudioServicesRemoveSystemSoundCompletion(self.soundId);
    AudioServicesDisposeSystemSoundID(self.soundId);
    
    if (_isRepeat) {
        if (self.delegate && [self.delegate respondsToSelector:@selector(audioDidStartPlaying)]) {
            [self.delegate audioDidStartPlaying];
        }
    }else{
        if (self.delegate && [self.delegate respondsToSelector:@selector(audioDidStopPlaying)]) {
            [self.delegate audioDidStopPlaying];
        }
    }
}

static void completionCallback (SystemSoundID sound, void *myself) {
    
    NSLog(@"Audio callback");

    EMAudioController *bridgeSelf = (__bridge EMAudioController *)myself;
    [bridgeSelf callbackPlayingSound];
    
}


- (void) configureAudioSession {
    // Implicit initialization of audio session
    self.audioSession = [AVAudioSession sharedInstance];
    NSError *setCategoryError = nil;
    if ([self.audioSession isOtherAudioPlaying]) { // mix sound effects with music already playing
        [self.audioSession setCategory:AVAudioSessionCategorySoloAmbient error:&setCategoryError];
        self.backgroundMusicPlaying = NO;
    } else {
        [self.audioSession setCategory:AVAudioSessionCategoryAmbient error:&setCategoryError];
    }
    if (setCategoryError) {
        NSLog(@"Error setting category! %ld", (long)[setCategoryError code]);
    }
}

- (void)configureAudioPlayer:(NSString *)soundName {
    NSString *backgroundMusicPath = [[NSBundle mainBundle] pathForResource:soundName ofType:kType];
    
    NSURL *backgroundMusicURL = [NSURL fileURLWithPath:backgroundMusicPath];
    if (_backgroundMusicPlayer) {
        _backgroundMusicPlayer = nil;
    }
    _backgroundMusicPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:backgroundMusicURL error:nil];
    _backgroundMusicPlayer.delegate = self;  // We need this so we can restart after interruptions
    _backgroundMusicPlayer.numberOfLoops = -1;	// Negative number means loop forever
}

- (void)configureSystemSound:(NSString *)soundName {
    NSString *pewPewPath = [[NSBundle mainBundle] pathForResource:soundName ofType:kType];
    NSURL *pewPewURL = [NSURL fileURLWithPath:pewPewPath];
    AudioServicesCreateSystemSoundID((__bridge CFURLRef)pewPewURL, &_soundId);
}

#pragma mark - AVAudioPlayerDelegate methods

- (void) audioPlayerBeginInterruption: (AVAudioPlayer *) player {
    self.backgroundMusicInterrupted = YES;
    self.backgroundMusicPlaying = NO;
}

- (void) audioPlayerEndInterruption: (AVAudioPlayer *) player withOptions:(NSUInteger) flags{
    [self playAsMusicPlayer];
    self.backgroundMusicInterrupted = NO;
}



@end
