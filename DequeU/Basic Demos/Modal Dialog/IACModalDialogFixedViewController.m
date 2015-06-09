//
//  IACModalDialogFixedViewController.m
//  Deque University for iOS
//
//  Created by Jennifer Dailey on 5/26/15.
//  Copyright (c) 2015 Deque Systems. All rights reserved.
//

#import "IACModalDialogFixedViewController.h"
#import "CustomIOS7AlertView.h"

#define MAIL_TO_INDEX 0
#define VISIT_WEBSITE_INDEX 1

@interface IACModalDialogFixedViewController ()<CustomIOS7AlertViewDelegate>

@end

@implementation IACModalDialogFixedViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [_learnMoreLink.superview addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(information:)]];
}

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
    
    UIViewController* modalViewControlelr = [[UIStoryboard storyboardWithName:@"ModalDialog" bundle:[NSBundle mainBundle]] instantiateViewControllerWithIdentifier:@"AccessibleModal"];
    modalViewControlelr.view.backgroundColor = [UIColor clearColor];
    [modalViewControlelr setView:alertView];
    self.modalPresentationStyle = UIModalPresentationCurrentContext;
    [self.navigationController presentViewController:modalViewControlelr animated:YES completion:nil];
    
    [alertView setDelegate:self];
    [alertView show];
    
    self.view.accessibilityElementsHidden = YES;
    self.tabBarController.view.accessibilityElementsHidden = YES;
    
    UIAccessibilityPostNotification(UIAccessibilityScreenChangedNotification, alertView);
    
    if([alertView isHidden]){
        return FALSE;
    }
    return TRUE;
}

// Opens a mailto link if the "Contact us" button is pressed or deque.com if the "Visit Website" button is pressed.
- (void)customIOS7dialogButtonTouchUpInside: (CustomIOS7AlertView *)alertView clickedButtonAtIndex: (NSInteger)buttonIndex {
    if (buttonIndex == MAIL_TO_INDEX) {
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"mailto:chris.mcmeeking@deque.com"]];
    } else if (buttonIndex == VISIT_WEBSITE_INDEX) {
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://www.deque.com"]];
    }
    
    [alertView close];
    [self dismissViewControllerAnimated:YES completion:nil];
    self.view.accessibilityElementsHidden = NO;
    self.tabBarController.view.accessibilityElementsHidden = NO;
    UIAccessibilityPostNotification(UIAccessibilityLayoutChangedNotification, [[self learnMoreLink] superview]);
}

@end
