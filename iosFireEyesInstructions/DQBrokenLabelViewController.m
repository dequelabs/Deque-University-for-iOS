//
//  DQBrokenLabelViewController.m
//  iosFireEyesInstructions
//
//  Created by Catherine Fisher on 2/12/14.
//  Copyright (c) 2014 Deque Systems. All rights reserved.
//

#import "DQBrokenLabelViewController.h"

@interface DQBrokenLabelViewController ()

@end

@implementation DQBrokenLabelViewController {
    IBOutlet UILabel *_BrokenLabel;
    IBOutlet UIButton *_DogDisplay;
    IBOutlet UIButton *_CatDisplay;
    IBOutlet UIButton *_FishDisplay;
    IBOutlet UITextView *_TextView;
    IBOutlet UIImageView *_ImageView;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [_TextView setText:@"This is the way a blind person percieves this particular view.  Notice the ambiguity of the display buttons.  What pictures do they display?"];
    
    //[_CatDisplay setAccessibilityLabel:@"Cat"];
    //[_DogDisplay setAccessibilityLabel:@"Dog"];
    //[_FishDisplay setAccessibilityLabel:@"Fish"];
    
    //[_CatDisplay setAccessibilityHint:@"Modify image display"];
    //[_FishDisplay setAccessibilityHint:@"Modify image display"];
    //[_DogDisplay setAccessibilityHint:@"Modify image display"];
    
    [_CatDisplay addTarget:self action:@selector(displayImage:) forControlEvents:UIControlEventTouchDown];
    [_DogDisplay addTarget:self action:@selector(displayImage:) forControlEvents:UIControlEventTouchDown];
    [_FishDisplay addTarget:self action:@selector(displayImage:) forControlEvents:UIControlEventTouchDown];
    
    [_TextView setEditable:NO];
    
    [_ImageView setImage:[UIImage imageNamed:@"dog"]];
    [_ImageView setAccessibilityHint:@""]; //Sometimes hints aren't needed, this silences the warning, letting the analyzer know we are concsiously setting an empty hint.
    [_ImageView setAccessibilityLabel:@"dog"];
    [_ImageView setIsAccessibilityElement:YES];
}

- (void)displayImage:(id)sender {
    UIButton* button = (UIButton*)sender;
    
    if (button == _CatDisplay) {
        [self updateImage:@"cat"];
    } else if (button == _DogDisplay) {
        [self updateImage:@"dog"];
    } else {
        [self updateImage:@"fish"];
    }
}

- (void)updateImage:(NSString*)name {
    [_ImageView setImage:[UIImage imageNamed:name]];
    [_ImageView setAccessibilityLabel:name];
}

- (BOOL)shouldAutorotate {
    return NO;
}

@end
