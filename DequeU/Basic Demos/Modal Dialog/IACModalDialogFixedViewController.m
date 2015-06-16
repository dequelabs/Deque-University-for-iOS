//
//  IACModalDialogFixedViewController.m
//  Deque University for iOS
//
//  Created by Jennifer Dailey on 5/26/15.
//  Copyright (c) 2015 Deque Systems. All rights reserved.
//

#import "IACModalDialogFixedViewController.h"

@implementation IACModalDialogFixedViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //set up _learnMoreLink
    [_learnMoreLink.superview addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(information:)]];
    
    //set up the modal dialog
    modalViewController = [[UIStoryboard storyboardWithName:@"ModalDialog" bundle:[NSBundle mainBundle]]
                           instantiateViewControllerWithIdentifier:@"modal"];
    
    [self.view insertSubview:modalViewController.view atIndex:1];
    modalViewController.view.hidden = YES; //modal dialog closed by default
    
    //set up buttons on modal dialog
    [modalViewController.email_deque addTarget:self action:@selector(clickedButton:) forControlEvents:UIControlEventTouchDown];
    [modalViewController.visit_website addTarget:self action:@selector(clickedButton:) forControlEvents:UIControlEventTouchDown];
    [modalViewController.close addTarget:self action:@selector(clickedButton:) forControlEvents:UIControlEventTouchDown];
}

- (BOOL)information:(id)sender {
    modalViewController.view.hidden = NO; //open modal dialog
    
    //listener for when announcement is finished
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(openAlertView)
                                                 name:UIAccessibilityAnnouncementDidFinishNotification object:nil];
    [DQUtilities createDynamicNotification:NSLocalizedString(@"MODAL_DIALOG_OPENED", nil)];

    if(![modalViewController.view accessibilityElementIsFocused]){
        return FALSE;
    }
    return TRUE;
}

- (void)openAlertView {
    //remove listener
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    
    //focus goes to "Thank You" on Modal Dialog
    UIAccessibilityPostNotification(UIAccessibilityScreenChangedNotification, modalViewController.view);
}

- (void)closeAlertView {
    //remove listener
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    
    //focus goes to an accessible view
    UIAccessibilityPostNotification(UIAccessibilityScreenChangedNotification, self.view);
}

-(NSString*)clickedButton:(id)sender {
    UIButton* button = (UIButton*)sender;
    NSString* URL;
    
    modalViewController.view.hidden = YES; //close modal dialog
    
    //listener for when announcement is finished
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(closeAlertView)
                                                 name:UIAccessibilityAnnouncementDidFinishNotification object:nil];
    UIAccessibilityPostNotification(UIAccessibilityAnnouncementNotification, NSLocalizedString(@"MODAL_DIALOG_CLOSED", nil));
    
    if(button == modalViewController.email_deque) {
        URL = @"mailto:chris.mcmeeking@deque.com";
    } else if(button == modalViewController.visit_website) {
        URL = @"http://www.deque.com";
    }
    if(![URL isEqual:NULL]) {
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:URL]];
    }
    return URL;
}

@end
