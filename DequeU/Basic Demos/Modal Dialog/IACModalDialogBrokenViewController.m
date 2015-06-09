//
//  IACModalDialogBrokenViewController.m
//  Deque University for iOS
//
//  Created by Jennifer Dailey on 5/26/15.
//  Copyright (c) 2015 Deque Systems. All rights reserved.
//

#import "IACModalDialogBrokenViewController.h"

#define MAIL_TO_INDEX 0
#define VISIT_WEBSITE_INDEX 1

@interface IACModalDialogBrokenViewController ()<CustomIOS7AlertViewDelegate>

@end

@implementation IACModalDialogBrokenViewController

- (void) viewDidLoad {
    [super viewDidLoad];
}

/**
 * Creates and does not focus the modal dialog
 * Returns whether or not the dialog is NOT focused for testing purposes
 */

- (BOOL)information:(id)sender {
    CustomIOS7AlertView *alertView = [CustomIOS7AlertView alertWithTitle:NSLocalizedString(@"ALERT_TITLE", nil)
                                                                 message:NSLocalizedString(@"ALERT_PARAGRAPH", nil)];
    
    [alertView setButtonTitles:[NSMutableArray arrayWithObjects:NSLocalizedString(@"ALERT_BUTTON_EMAIL_US", nil),
                                NSLocalizedString(@"ALERT_BUTTON_VISIT", nil),
                                NSLocalizedString(@"ALERT_BUTTON_CLOSE", nil),
                                nil]];
    
    [alertView setButtonColors:[NSMutableArray arrayWithObjects:[UIColor colorWithRed:255.0f/255.0f
                                                                                green:77.0f/255.0f
                                                                                 blue:94.0f/255.0f
                                                                                alpha:1.0f],
                                [UIColor colorWithRed:0.0f
                                                green:0.5f
                                                 blue:1.0f
                                                alpha:1.0f],nil]];
    
    [alertView setDelegate:self];
    
    [alertView show];

    if(![alertView accessibilityElementIsFocused]) {
        return YES;
    }
    return NO;
}

- (NSString*) getURLFromIndex: (NSInteger)buttonIndex {
    NSString* URL;
    if(buttonIndex == MAIL_TO_INDEX) {
        URL = @"mailto:chris.mcmeeking@deque.com";
        
    } else if(buttonIndex == VISIT_WEBSITE_INDEX) {
        URL = @"http://www.deque.com";
        
    }
    return URL;
}

- (void)customIOS7dialogButtonTouchUpInside: (CustomIOS7AlertView *)alertView clickedButtonAtIndex: (NSInteger)buttonIndex
{
    NSString* URL = [self getURLFromIndex: buttonIndex];
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:URL]];
    
    [alertView close];
}

@end
