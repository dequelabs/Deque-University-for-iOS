//
//  IACModalDialogBrokenViewController.m
//  Deque University for iOS
//
//  Created by Jennifer Dailey on 5/26/15.
//  Copyright (c) 2015 Deque Systems. All rights reserved.
//

#import "IACModalDialogBrokenViewController.h"
#import "IACViewController.h"

#define MAIL_TO_INDEX 0
#define VISIT_WEBSITE_INDEX 1

@interface IACModalDialogBrokenViewController ()<CustomIOS7AlertViewDelegate> {
    UIView* overlayViewForModal; ///< The overlay view for VoiceOver Simulation.
}

@end

@implementation IACModalDialogBrokenViewController

- (void) viewDidLoad {
    [super viewDidLoad];
}

- (BOOL)information:(id)sender {
    CustomIOS7AlertView* alertView = [CustomIOS7AlertView alertWithTitle:NSLocalizedString(@"ALERT_TITLE", nil)
                                                                 message:NSLocalizedString(@"ALERT_PARAGRAPH", nil)];
    
    [alertView setButtonTitles:[NSMutableArray arrayWithObjects:NSLocalizedString(@"ALERT_BUTTON_EMAIL_US", nil),
                                NSLocalizedString(@"ALERT_BUTTON_VISIT", nil),
                                NSLocalizedString(@"ALERT_BUTTON_CLOSE", nil),
                                nil]];
    
    [alertView setButtonColors:[NSMutableArray arrayWithObjects:[UIColor colorWithRed:45.0f/255.0f
                                                                                green:107.0f/255.0f
                                                                                 blue:32.0f/255.0f
                                                                                alpha:1.0f],
                                [UIColor colorWithRed:2.0f/255.0f
                                                green:27.0f/255.0f
                                                 blue:63.0f/255.0f
                                                alpha:1.0f],nil]];
    [alertView setDelegate:self];
    
    [alertView show];

    return ![alertView accessibilityElementIsFocused];
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

//Function defined in CustomIOS7AlertView
- (void)customIOS7dialogButtonTouchUpInside: (CustomIOS7AlertView *)alertView clickedButtonAtIndex: (NSInteger)buttonIndex
{
    NSString* URL = [self getURLFromIndex: buttonIndex];
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:URL]];
    
    [alertView close];
}

@end
