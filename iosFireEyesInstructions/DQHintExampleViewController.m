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
    [_TextView setText:@"Notice how the visual cues, like the title \"Music Player\" and the style of the \"Play Buttons\" provide context.  Because of these visual cues we already know what these buttons do."];
    
    [_SITRDisplay setAccessibilityLabel:@"Singing in the Rain"];
    [_AGDisplay setAccessibilityLabel:@"Amazing Grace"];
    [_SSBDisplay setAccessibilityLabel:@"Star Spangled Banner"];
    
    [_SITRDisplay setAccessibilityHint:@"Plays Music"];
    [_SSBDisplay setAccessibilityHint:@"Plays Music"];
    [_AGDisplay setAccessibilityHint:@"Plays Music"];
    
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

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)shouldAutorotate {
    return NO;
}

@end
