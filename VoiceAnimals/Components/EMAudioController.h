//
//  EMAudioController.h
//  EMKiller
//
//  Created by Than Dang on 4/28/15.
//  Copyright (c) 2015 Than Dang. All rights reserved.
//

#import <Foundation/Foundation.h>
#define kPlayByMusic    0 //1 is by Music player 0 is play by System soud
@import AVFoundation;

@protocol EMAudioDelegate <NSObject>

- (void) audioDidStartPlaying;
- (void) audioDidStopPlaying;

@end

@interface EMAudioController : NSObject

@property (nonatomic, weak) id<EMAudioDelegate>delegate;
@property (nonatomic, assign) BOOL isRepeat;

+ (EMAudioController *) shareInstance;

- (void) configWithSoundName:(NSString *)soundName;

- (void) playAsMusicPlayer;
- (void) playSystemSound;
- (void) stopPlaying;

@end
