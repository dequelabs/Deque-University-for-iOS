//
//  DQFixedHintViewController.m
//  iosFireEyesInstructions
//
//  Created by Catherine Fisher on 2/12/14.
//  Copyright (c) 2014 Deque Systems. All rights reserved.
//

#import "DQFixedHintViewController.h"
#import <AudioToolbox/AudioToolbox.h>
#import <AVFoundation/AVFoundation.h>

@interface DQFixedHintViewController ()

@end

@implementation DQFixedHintViewController {
    IBOutlet UILabel *_BrokenFixedLabel;
    IBOutlet UIButton *_SSBDisplay;
    IBOutlet UIButton *_AGDisplay;
    IBOutlet UIButton *_SITRDisplay;
    IBOutlet UITextView *_TextView;
    IBOutlet UILabel *_SSBLabel;
    IBOutlet UILabel *_SITRLabel;
    IBOutlet UILabel *_AGLabel;
    IBOutlet UILabel *_MusicPlayer;
    
    AVAudioPlayer* _AudioPlayer;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [_TextView setEditable:NO];
    [_TextView setText:@"Now we have added the hint information back onto the buttons.  With these hints, you know that 'Star Spangled Banner' is a song that is going to be played, and not a website that will be visited for further information."];
    
    [_SSBDisplay setAccessibilityLabel:@"Star Spangled Banner"];
    [_SSBDisplay setAccessibilityHint:@"Plays Song"];
    [_SSBDisplay addTarget:self action:@selector(playMusic:) forControlEvents:UIControlEventTouchDown];
    
    [_AGDisplay setAccessibilityLabel:@"Amazing Grace"];
    [_AGDisplay setAccessibilityHint:@"Plays Song"];
    [_AGDisplay addTarget:self action:@selector(playMusic:) forControlEvents:UIControlEventTouchDown];

    
    [_SITRDisplay setAccessibilityLabel:@"Singing in the Rain"];
    [_SITRDisplay setAccessibilityHint:@"Plays Song"];
    [_SITRDisplay addTarget:self action:@selector(playMusic:) forControlEvents:UIControlEventTouchDown];

    [_SSBLabel setIsAccessibilityElement:false];
    
    [_AGLabel setIsAccessibilityElement:false];
    
    [_SITRLabel setIsAccessibilityElement:false];
    
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
    _AudioPlayer.volume = 1000;
    
    [_AudioPlayer performSelector:@selector(stop) withObject:_AudioPlayer afterDelay:5];
    
    if ([_AudioPlayer play]) NSLog(@"Shoudl be playing");
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
