//
//  IACAboutDequeViewController.m
//  Deque University for iOS
//
//  Created by Chris McMeeking on 4/16/15.
//  Copyright (c) 2015 Deque Systems. All rights reserved.
//

#import "IACAboutDequeViewController.h"
#import <DQA11y/DQA11y.h>

#define DEQUE_URL @"http://accessibility.deque.com/contact-deque-today"

@interface IACAboutDequeViewController ()
@property (weak, nonatomic) IBOutlet DQButton *buttonContactUs;
@property UIColor* backgroundColorView;
@end

@implementation IACAboutDequeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Load the "Contact Us" button
    [self.buttonContactUs addTarget:self action:@selector(loadDequeWebPage) forControlEvents:UIControlEventTouchUpInside];
    
    self.buttonContactUs.underlined = YES; // Underline the button - this is a DQButton setting.
}

- (void)loadDequeWebPage {
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:DEQUE_URL]]; // Load the Deque web page in Safari.
}

@end
