//
//  DQFixedHintViewController.m
//  iosFireEyesInstructions
//
//  Created by Catherine Fisher on 2/12/14.
//  Copyright (c) 2014 Deque Systems. All rights reserved.
//

#import "DQFixedHintViewController.h"

@interface DQFixedHintViewController ()

@end

@implementation DQFixedHintViewController {
    IBOutlet UILabel *_BrokenFixedLabel;
    IBOutlet UIButton *_DogDisplay;
    IBOutlet UIButton *_CatDisplay;
    IBOutlet UIButton *_FishDisplay;
    IBOutlet UITextView *_TextView;
    IBOutlet UILabel *_SSB;
    IBOutlet UILabel *_SITR;
    IBOutlet UILabel *_AG;
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
    [_TextView setText:@"The song that will be played is marked in the label.  This allows users who are familiar with our application instant access to the information they need, while allowing inexperienced users to wait for additional context.  This removes any doubt about what these buttons do."];
    
    [_DogDisplay setAccessibilityLabel:@"Star Spangled Banner"];
    [_DogDisplay setAccessibilityHint:@"Plays Song"];
    
    [_CatDisplay setAccessibilityLabel:@"Amazing Grace"];
    [_CatDisplay setAccessibilityHint:@"Plays Song"];
    
    [_FishDisplay setAccessibilityLabel:@"Singing in the Rain"];
    [_FishDisplay setAccessibilityHint:@"Plays Song"];
    
    [_SSB setIsAccessibilityElement:false];
    
    [_AG setIsAccessibilityElement:false];
    
    [_SITR setIsAccessibilityElement:false];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
