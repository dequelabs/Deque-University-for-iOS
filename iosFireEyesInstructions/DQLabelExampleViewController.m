//
//  DQLabelExampleViewController.m
//  iosFireEyesInstructions
//
//  Created by Catherine Fisher on 2/12/14.
//  Copyright (c) 2014 Deque Systems. All rights reserved.
//

#import "DQLabelExampleViewController.h"

@interface DQLabelExampleViewController ()

@end

@implementation DQLabelExampleViewController

@synthesize exampleLabel = _ExampleLabel;
@synthesize dogLabel = _DogLabel;
@synthesize catLabel = _CatLabel;
@synthesize fishLabel = _FishLabel;
@synthesize dogDisplay = _DogDisplay;
@synthesize catDisplay = _CatDisplay;
@synthesize fishDisplay = _FishDisplay;
@synthesize textView = _TextView;
@synthesize imageView = _ImageView;


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    return self;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.screenName = @"Labels Example";
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [_CatDisplay addTarget:self action:@selector(displayImage:) forControlEvents:UIControlEventTouchDown];
    [_DogDisplay addTarget:self action:@selector(displayImage:) forControlEvents:UIControlEventTouchDown];
    [_FishDisplay addTarget:self action:@selector(displayImage:) forControlEvents:UIControlEventTouchDown];

	[_TextView setText:NSLocalizedString(@"LABEL_EXAMPLE_TEXTVIEW", nil)];
    
    [_CatDisplay setAccessibilityLabel:NSLocalizedString(@"CAT", nil)];
    [_DogDisplay setAccessibilityLabel:NSLocalizedString(@"DOG", nil)];
    [_FishDisplay setAccessibilityLabel:NSLocalizedString(@"FISH", nil)];
    
    [_CatDisplay setAccessibilityHint:NSLocalizedString(@"MODIFY_IMAGE", nil)];
    [_FishDisplay setAccessibilityHint:NSLocalizedString(@"MODIFY_IMAGE", nil)];
    [_DogDisplay setAccessibilityHint:NSLocalizedString(@"MODIFY_IMAGE", nil)];
    
    [_DogLabel setText:NSLocalizedString(@"DISPLAY_DOG", nil)];
    [_CatLabel setText:NSLocalizedString(@"DISPLAY_CAT", nil)];
    [_FishLabel setText:NSLocalizedString(@"DISPLAY_FISH", nil)];
    
    [_DogLabel setIsAccessibilityElement:NO];
    [_CatLabel setIsAccessibilityElement:NO];
    [_FishLabel setIsAccessibilityElement:NO];
    [_TextView setEditable:NO];
    
    [_ImageView setImage:[UIImage imageNamed:@"dog"]];
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

- (void)updateImage:(NSString*)name {
    [_ImageView setImage:[UIImage imageNamed:name]];
    [_ImageView setAccessibilityLabel:name];
}

- (BOOL)shouldAutorotate {
    return NO;
}

@end
