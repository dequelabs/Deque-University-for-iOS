//
//  DQHintExampleViewController.m
//  iosFireEyesInstructions
//
//  Created by Catherine Fisher on 2/12/14.
//  Copyright (c) 2014 Deque Systems. All rights reserved.
//

#import "DQHintExampleViewController.h"

@interface DQHintExampleViewController ()

@end

@implementation DQHintExampleViewController {
    IBOutlet UILabel *_ExampleLabel;
    IBOutlet UILabel *_DogLabel;
    IBOutlet UILabel *_CatLabel;
    IBOutlet UILabel *_FishLabel;
    IBOutlet UIButton *_DogDisplay;
    IBOutlet UIButton *_CatDisplay;
    IBOutlet UIButton *_FishDisplay;
    IBOutlet UITextView *_TextView;
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
    [_TextView setText:@"Notice how the visual cues, like the title \"Music Player\" and the style of the \"Play Buttons\" provide context.  Because of these visual cues we already know what these buttons do."];
    
    [_FishDisplay setAccessibilityLabel:@"Singing in the Rain"];
    [_CatDisplay setAccessibilityLabel:@"Amazing Grace"];
    [_DogDisplay setAccessibilityLabel:@"Star Spangled Banner"];
    
    [_FishDisplay setAccessibilityHint:@"Plays Music"];
    [_DogDisplay setAccessibilityHint:@"Plays Music"];
    [_CatDisplay setAccessibilityHint:@"Plays Music"];
    
    [_DogLabel setIsAccessibilityElement:NO];
    [_CatLabel setIsAccessibilityElement:NO];
    [_FishLabel setIsAccessibilityElement:NO];
    
    [_TextView setEditable:NO];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
