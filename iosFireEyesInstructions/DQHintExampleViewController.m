//
//  DQHintExampleViewController.m
//  iosFireEyesInstructions
//
//  Created by Catherine Fisher on 2/12/14.
//  Copyright (c) 2014 Deque Systems. All rights reserved.
//

#import "DQHintExampleViewController.h"
#import <AudioToolbox/AudioToolbox.h>
#import <AVFoundation/AVFoundation.h>

@interface DQHintExampleViewController ()

@end

@implementation DQHintExampleViewController {
    IBOutlet UILabel *_ExampleLabel;
    IBOutlet UILabel *_StarSpangledBannerLabel;
    IBOutlet UILabel *_AmazingGraceLabel;
    IBOutlet UILabel *_SingingInTheRainLabel;
    IBOutlet UIButton *_StarSpangledBannerPlay;
    IBOutlet UIButton *_AmazingGracePlay;
    IBOutlet UIButton *_SingingInTheRainPlay;
    IBOutlet UITextView *_TextView;
    IBOutlet UILabel *_MusicPlayer;
    
    AVAudioPlayer* _AudioPlayer;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    return [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
}

- (void)viewDidLoad {

    [super viewDidLoad];

    [_TextView setEditable:NO];
    [_TextView setText:NSLocalizedString(@"HINT_EXAMPLE_TEXTVIEW", nil)];
    
    [_SingingInTheRainPlay setAccessibilityLabel:NSLocalizedString(@"SITR", nil)];
    [_AmazingGracePlay setAccessibilityLabel:NSLocalizedString(@"AG", nil)];
    [_StarSpangledBannerPlay setAccessibilityLabel:NSLocalizedString(@"SSB", nil)];
    
    [_SingingInTheRainPlay setAccessibilityHint:NSLocalizedString(@"PLAYS_MUSIC", nil)];
    [_StarSpangledBannerPlay setAccessibilityHint:NSLocalizedString(@"PLAYS_MUSIC", nil)];
    [_AmazingGracePlay setAccessibilityHint:NSLocalizedString(@"PLAYS_MUSIC", nil)];
    
    [_StarSpangledBannerLabel setIsAccessibilityElement:NO];
    [_AmazingGraceLabel setIsAccessibilityElement:NO];
    [_SingingInTheRainLabel setIsAccessibilityElement:NO];
    
    
    [_SingingInTheRainPlay addTarget:self action:@selector(playMusic:) forControlEvents:UIControlEventTouchDown];
    [_AmazingGracePlay addTarget:self action:@selector(playMusic:) forControlEvents:UIControlEventTouchDown];
    [_StarSpangledBannerPlay addTarget:self action:@selector(playMusic:) forControlEvents:UIControlEventTouchDown];
}

- (void)playMusic:(id)sender {
    
    if ([_AudioPlayer isPlaying]) [_AudioPlayer stop];
    
    UIButton* button = (UIButton*)sender;
    NSString* song = nil;
    
    if (button == _StarSpangledBannerPlay) {
        song = @"SSB";
    } else if (button == _AmazingGracePlay) {
        song = @"AG";
    } else {
        song = @"SIR";
    }
    
    NSString *soundFilePath = [[NSBundle mainBundle] pathForResource:song ofType:@"mp3"];
    NSURL *soundFileURL = [NSURL fileURLWithPath:soundFilePath];
    NSError* error;
    _AudioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:soundFileURL error:&error];
    
    if (error) NSLog(@"Error: %@", error);
    
    _AudioPlayer.numberOfLoops = 0;
    _AudioPlayer.volume = 50;
    
    [_AudioPlayer performSelector:@selector(stop) withObject:_AudioPlayer afterDelay:5];
    
    if ([_AudioPlayer play]) NSLog(@"Should be playing");
}

- (BOOL)shouldAutorotate {
    return NO;
}

@end
