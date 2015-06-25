//
//  IACUpdatingContentBrokenViewController.m
//  Deque University for iOS
//
//  Created by Jennifer Dailey on 6/22/15.
//  Copyright (c) 2015 Deque Systems. All rights reserved.
//

#import "IACUpdatingContentBrokenViewController.h"

#define BEGINNING_NUMBER_OF_SECONDS 0
#define ONE_SECOND 1
#define TEN_SECONDS 10

@implementation IACUpdatingContentBrokenViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.progressView = [[UIProgressView alloc] initWithProgressViewStyle:UIProgressViewStyleDefault]; //create Progress Bar
    [self.wrapperView addSubview:self.progressView]; //Add Progress Bar to wrapperView
    
    //Constraints for the Progress Bar
    [self.view addConstraint:[NSLayoutConstraint
                              constraintWithItem:self.progressView
                              attribute:NSLayoutAttributeCenterX
                              relatedBy:NSLayoutRelationEqual
                              toItem:self.wrapperView
                              attribute:NSLayoutAttributeCenterX
                              multiplier:1.0
                              constant:0.0]];
    
    [self.view addConstraint:[NSLayoutConstraint
                              constraintWithItem:self.progressView
                              attribute:NSLayoutAttributeTop
                              relatedBy:NSLayoutRelationEqual
                              toItem:self.wrapperView
                              attribute:NSLayoutAttributeTop
                              multiplier:1.0
                              constant:0.0]];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    //start Progress Bar
    self.myTimer = [NSTimer scheduledTimerWithTimeInterval:ONE_SECOND target:self selector:@selector(updateProgressBar:) userInfo:nil repeats:YES];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
    [self.myTimer invalidate]; //Stop Progress Bar when user leaves page
}

- (NSString*)updateProgressBar:(NSTimer *)timer {
    static int count = BEGINNING_NUMBER_OF_SECONDS; count++;
    
    //If less than or equal to 100% completion
    if(count <= TEN_SECONDS) {
        
        //Remove the "s" in "seconds" if there is only 1 second
        if(count == ONE_SECOND) {
            self.progressLabel.text = [NSString stringWithFormat:NSLocalizedString(@"SECOND", nil), count];
        } else {
            self.progressLabel.text = [NSString stringWithFormat:NSLocalizedString(@"SECONDS", nil), count];
        }
        
        self.progressView.progress = (float)count/10.0f; //update Progress Bar
        self.wrapperView.accessibilityLabel = self.progressLabel.text; //update label
        
    } else {
        //Restart Progress Bar and alert user
        count = BEGINNING_NUMBER_OF_SECONDS;
        UIAccessibilityPostNotification(UIAccessibilityScreenChangedNotification, self.wrapperView);
        UIAccessibilityPostNotification(UIAccessibilityAnnouncementNotification, NSLocalizedString(@"TEN_SECOND_ALERT", nil));
        
        return NSLocalizedString(@"TEN_SECOND_ALERT", nil);
    }
    return nil;
}

@end
