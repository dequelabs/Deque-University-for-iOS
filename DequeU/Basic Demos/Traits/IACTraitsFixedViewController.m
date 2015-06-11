//
//  DQTraitsFixedViewController.m
//  Deque University for iOS
//
//  Created by Catherine Fisher on 5/22/14.
//  Copyright (c) 2014 Deque Systems. All rights reserved.
//

#import "IACTraitsFixedViewController.h"

//Notice that this has the same functionalities as the IACTraitsBrokenViewController, but has no misleading traits for the "Fish" button.
@implementation IACTraitsFixedViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //This sets the "shadow" property of the DQButtons to "ON", to help users more easily see that they are buttons.
    [_buttonDisplayDog setShadowed:YES];
    [_buttonDisplayCat setShadowed:YES];
    [_buttonDisplayFish setUnderlined:YES]; //This sets the "underlined" property of the DQButton to "ON" to help users understand that
                                            //  this button acts like a link.
    
    [_buttonDisplayCat addTarget:self action:@selector(displayImage:) forControlEvents:UIControlEventTouchDown];
    [_buttonDisplayDog addTarget:self action:@selector(displayImage:) forControlEvents:UIControlEventTouchDown];
    [_buttonDisplayFish addTarget:self action:@selector(visitWebPage) forControlEvents:UIControlEventTouchDown];
    
    [_ImageView setImage:[UIImage imageNamed:@"dog"]];
    [_ImageView setAccessibilityHint:@""]; ///< Sometimes hints aren't needed, this silences the warning.
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

- (NSString*)visitWebPage {
    NSString* url = @"http://lmgtfy.com/?q=fish";
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:url]];
    return url;
}

- (void)updateImage:(NSString*)name {
    [_ImageView setImage:[UIImage imageNamed:name]];
    [_ImageView setAccessibilityLabel:name];
}


- (BOOL)shouldAutorotate {
    return NO;
}

@end
