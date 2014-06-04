//
//  DQTraitsExampleViewController.m
//  iosFireEyesInstructions
//
//  Created by Catherine Fisher on 5/22/14.
//  Copyright (c) 2014 Deque Systems. All rights reserved.
//

#import "DQTraitsExampleViewController.h"

@interface DQTraitsExampleViewController ()

@end

@implementation DQTraitsExampleViewController {
    IBOutlet UILabel *_ExampleLabel;
    IBOutlet UILabel *_DogLabel;
    IBOutlet UILabel *_CatLabel;
    IBOutlet UILabel *_FishLabel;
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
	[_TextView setText:@"Below is a screen similar to the one in the Labels example, however, notice that one of the buttons looks a little different.  It's appearance would suggest that it is a link."];
    
    [_CatDisplay addTarget:self action:@selector(displayImage:) forControlEvents:UIControlEventTouchDown];
    [_DogDisplay addTarget:self action:@selector(displayImage:) forControlEvents:UIControlEventTouchDown];
    [_FishDisplay addTarget:self action:@selector(visitWebPage) forControlEvents:UIControlEventTouchDown];
    
    NSMutableAttributedString *commentString = [[NSMutableAttributedString alloc] initWithString:@"Fish"];
    
    [commentString addAttribute:NSUnderlineStyleAttributeName value:[NSNumber numberWithInteger:NSUnderlineStyleSingle] range:NSMakeRange(0, [commentString length])];
    
    [_FishDisplay setAttributedTitle:commentString forState:UIControlStateNormal];
    
    [_CatDisplay setAccessibilityLabel:@"Cat"];
    [_DogDisplay setAccessibilityLabel:@"Dog"];
    [_FishDisplay setAccessibilityLabel:@"Fish"];
    
    [_DogLabel setIsAccessibilityElement:NO];
    [_CatLabel setIsAccessibilityElement:NO];
    [_FishLabel setIsAccessibilityElement:NO];
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
