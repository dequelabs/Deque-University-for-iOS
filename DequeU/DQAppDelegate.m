//
//  DQAppDelegate.m
//  Deque University for iOS
//
//  Created by Catherine Fisher on 2/5/14.
//  Copyright (c) 2014 Deque Systems. All rights reserved.
//

#import "DQAppDelegate.h"
#import <AVFoundation/AVFoundation.h>
#import <AudioToolbox/AudioToolbox.h>
#import "GAI.h"

#define GAI_INST [GAI sharedInstance]

@implementation DQAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    [[AVAudioSession sharedInstance] setCategory:AVAudioSessionCategoryPlayback error:nil];
    
    //! Set up Google Anylitics
    GAI_INST.trackUncaughtExceptions = YES;
    
    GAI_INST.dispatchInterval = 20;
    
    [[GAI_INST logger] setLogLevel:kGAILogLevelNone];
    
    [GAI_INST trackerWithTrackingId:@"UA-61120003-2"];
    
    return YES;
}



@end
