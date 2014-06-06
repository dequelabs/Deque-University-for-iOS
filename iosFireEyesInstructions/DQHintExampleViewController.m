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
    IBOutlet UILabel *_SSBLabel;
    IBOutlet UILabel *_AGLabel;
    IBOutlet UILabel *_SITRLabel;
    IBOutlet UIButton *_SSBDisplay;
    IBOutlet UIButton *_AGDisplay;
    IBOutlet UIButton *_SITRDisplay;
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
    
    [_SITRDisplay setAccessibilityLabel:NSLocalizedString(@"SITR", nil)];
    [_AGDisplay setAccessibilityLabel:NSLocalizedString(@"AG", nil)];
    [_SSBDisplay setAccessibilityLabel:NSLocalizedString(@"SSB", nil)];
    
    [_SITRDisplay setAccessibilityHint:NSLocalizedString(@"PLAYS_MUSIC", nil)];
    [_SSBDisplay setAccessibilityHint:NSLocalizedString(@"PLAYS_MUSIC", nil)];
    [_AGDisplay setAccessibilityHint:NSLocalizedString(@"PLAYS_MUSIC", nil)];
    
    [_SSBLabel setIsAccessibilityElement:NO];
    [_AGLabel setIsAccessibilityElement:NO];
    [_SITRLabel setIsAccessibilityElement:NO];
    
    
    [_SITRDisplay addTarget:self action:@selector(playMusic:) forControlEvents:UIControlEventTouchDown];
    [_AGDisplay addTarget:self action:@selector(playMusic:) forControlEvents:UIControlEventTouchDown];
    [_SSBDisplay addTarget:self action:@selector(playMusic:) forControlEvents:UIControlEventTouchDown];
}

- (void)playMusic:(id)sender {
    
    if ([_AudioPlayer isPlaying]) [_AudioPlayer stop];
    
    UIButton* button = (UIButton*)sender;
    NSString* song = nil;
    
    if (button == _SSBDisplay) {
        song = @"SSB";
    } else if (button == _AGDisplay) {
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
