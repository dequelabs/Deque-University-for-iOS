//
//  DQTraitsBrokenViewController.m
//  iosFireEyesInstructions
//
//  Created by Catherine Fisher on 5/22/14.
//  Copyright (c) 2014 Deque Systems. All rights reserved.
//

#import "IACTraitsBrokenViewController.h"
#import "DQButton.h"

@interface IACTraitsBrokenViewController ()

@end

@implementation IACTraitsBrokenViewController {
    IBOutlet DQButton *_buttonDisplayDog;
    IBOutlet DQButton *_buttonDisplayCat;
    IBOutlet DQButton *_buttonDisplayFish;
    IBOutlet UIImageView *_ImageView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [_buttonDisplayCat setShadowed:YES];
    [_buttonDisplayDog setShadowed:YES];
    [_buttonDisplayFish setUnderlined:YES];
    
    [_buttonDisplayCat addTarget:self action:@selector(displayImage:) forControlEvents:UIControlEventTouchDown];
    [_buttonDisplayDog addTarget:self action:@selector(displayImage:) forControlEvents:UIControlEventTouchDown];
    [_buttonDisplayFish addTarget:self action:@selector(visitWebPage) forControlEvents:UIControlEventTouchDown];

    [_ImageView setImage:[UIImage imageNamed:@"dog"]];
    [_ImageView setAccessibilityHint:@""]; //Sometimes hints aren't needed, this silences the warning.
    [_ImageView setAccessibilityLabel:NSLocalizedString(@"DOG", nil)];
    [_ImageView setIsAccessibilityElement:YES];
}

- (void)displayImage:(id)sender {
    UIButton* button = (UIButton*)sender;
    
    if (button == _buttonDisplayCat) {
        [self updateImage:@"cat"];
    } else if (button == _buttonDisplayDog) {
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
