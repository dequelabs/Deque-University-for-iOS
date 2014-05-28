//
//  DQTraitsFixedViewController.m
//  iosFireEyesInstructions
//
//  Created by Catherine Fisher on 5/22/14.
//  Copyright (c) 2014 Deque Systems. All rights reserved.
//

#import "DQTraitsFixedViewController.h"

@interface DQTraitsFixedViewController ()

@end

@implementation DQTraitsFixedViewController {
    IBOutlet UILabel *_BrokenFixedLabel;
    IBOutlet UIButton *_DogDisplay;
    IBOutlet UIButton *_CatDisplay;
    IBOutlet UIButton *_FishDisplay;
    IBOutlet UITextView *_TextView;
    IBOutlet UIImageView *_ImageView;
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
    
    [_TextView setText:@"Here we have removed the unnecessary traits to clarify the purpose of the last button.  There are many examples of traits that should not be paired together."];
    [_CatDisplay addTarget:self action:@selector(displayImage:) forControlEvents:UIControlEventTouchDown];
    [_DogDisplay addTarget:self action:@selector(displayImage:) forControlEvents:UIControlEventTouchDown];
    [_FishDisplay addTarget:self action:@selector(visitWebPage) forControlEvents:UIControlEventTouchDown];
    
    NSMutableAttributedString *commentString = [[NSMutableAttributedString alloc] initWithString:@"Fish"];
    
    [commentString addAttribute:NSUnderlineStyleAttributeName value:[NSNumber numberWithInteger:NSUnderlineStyleSingle] range:NSMakeRange(0, [commentString length])];
    
    [_FishDisplay setAttributedTitle:commentString forState:UIControlStateNormal];
    
    [_CatDisplay setAccessibilityLabel:@"Cat"];
    [_DogDisplay setAccessibilityLabel:@"Dog"];
    [_FishDisplay setAccessibilityLabel:@"Fish"];
    
    [_CatDisplay setAccessibilityHint:@"Modify image display"];
    [_FishDisplay setAccessibilityHint:@"Modify image display"];
    [_DogDisplay setAccessibilityHint:@"Modify image display"];
    
    [_TextView setEditable:NO];
    
    [_ImageView setImage:[UIImage imageNamed:@"dog"]];
    [_ImageView setAccessibilityHint:@""]; //Sometimes hints aren't needed, this silences the warning.
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

- (void)visitWebPage {
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://lmgtfy.com/?q=fish"]];
}

- (void)updateImage:(NSString*)name {
    [_ImageView setImage:[UIImage imageNamed:name]];
    [_ImageView setAccessibilityLabel:name];
}


- (BOOL)shouldAutorotate {
    return NO;
}

@end
