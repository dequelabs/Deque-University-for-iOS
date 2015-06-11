//
//  DQBrokenLabelViewController.m
//  Deque University for iOS
//
//  Created by Catherine Fisher on 2/12/14.
//  Copyright (c) 2014 Deque Systems. All rights reserved.
//

#import "IACLabelBrokenViewController.h"

@implementation IACLabelBrokenViewController

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
    
    //[_CatDisplay setAccessibilityLabel:@"Cat"];
    //[_DogDisplay setAccessibilityLabel:@"Dog"];
    //[_FishDisplay setAccessibilityLabel:@"Fish"];
    
    //[_CatDisplay setAccessibilityHint:@"Modify image display"];
    //[_FishDisplay setAccessibilityHint:@"Modify image display"];
    //[_DogDisplay setAccessibilityHint:@"Modify image display"];
    
    [_CatDisplay addTarget:self action:@selector(displayImage:) forControlEvents:UIControlEventTouchDown];
    [_DogDisplay addTarget:self action:@selector(displayImage:) forControlEvents:UIControlEventTouchDown];
    [_FishDisplay addTarget:self action:@selector(displayImage:) forControlEvents:UIControlEventTouchDown];
        
    [_ImageView setImage:[UIImage imageNamed:@"dog"]];
    [_ImageView setAccessibilityHint:@""]; // Sometimes hints aren't needed, this silences the warning, letting the analyzer
                                           // know we are concsiously setting an empty hint.
    
    /**
     * You may notice that on the next line "DOG" is an NSLocalized string.
     * even though "dog" is a very short string, making it localizable allows some-
     * one to easily translate this app into another language, like french, without
     * going in and changing "dog" to "chien" in every instance. They only have to change it 
     * in one place.
     */
    
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

// Update the imageView's image and accessibility label given the name of the animal.
- (void)updateImage:(NSString*)name {
    [_ImageView setImage:[UIImage imageNamed:name]];
    [_ImageView setAccessibilityLabel:name];
}

- (BOOL)shouldAutorotate {
    return NO;
}

@end
