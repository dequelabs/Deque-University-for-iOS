//
//  IACLabelFixedViewController.m
//  Deque University for iOS
//
//  Created by Catherine Fisher on 2/12/14.
//  Copyright (c) 2014 Deque Systems. All rights reserved.
//

#import "IACLabelFixedViewController.h"
#import <DQA11y/DQA11y.h>

@implementation IACLabelFixedViewController 

@synthesize dogDisplay = _DogDisplay;
@synthesize catDisplay = _CatDisplay;
@synthesize fishDisplay = _FishDisplay;
@synthesize imageView = _ImageView;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];    
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //This sets the "shadow" property of the DQButtons to "ON", to help users more easily see that they are buttons.
    [_FishDisplay setShadowed:YES];
    if ([_CatDisplay isMemberOfClass:[DQButton class]])  [_CatDisplay setShadowed:YES];
    [_DogDisplay setShadowed:YES];
   
    [_CatDisplay addTarget:self action:@selector(displayImage:) forControlEvents:UIControlEventTouchDown];
    [_DogDisplay addTarget:self action:@selector(displayImage:) forControlEvents:UIControlEventTouchDown];
    [_FishDisplay addTarget:self action:@selector(displayImage:) forControlEvents:UIControlEventTouchDown];
    
    [_ImageView setImage:[UIImage imageNamed:@"dog"]];
    [_ImageView setAccessibilityHint:@""]; // Sometimes hints aren't needed, this silences the warning.
    [_ImageView setAccessibilityLabel:NSLocalizedString(@"DOG", nil)];
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

// Update the imageView's image and accessibility label given the name of the animal. It also has VoiceOver alert the user that the image has changed.
- (void)updateImage:(NSString*)name {
    [_ImageView setImage:[UIImage imageNamed:name]];
    [_ImageView setAccessibilityLabel:NSLocalizedString(name, nil)];
    
    UIAccessibilityPostNotification(UIAccessibilityLayoutChangedNotification, _ImageView);
}

- (BOOL)shouldAutorotate {
    return NO;
}

@end


