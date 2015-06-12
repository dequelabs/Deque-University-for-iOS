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
    _modalViewController = [[UIStoryboard storyboardWithName:@"ModalDialog" bundle:[NSBundle mainBundle]]
                           instantiateViewControllerWithIdentifier:@"modal"];
    _modalViewController.view.backgroundColor = [UIColor clearColor];
    self.modalPresentationStyle = UIModalPresentationCurrentContext;
    self.navigationController.modalPresentationStyle = UIModalPresentationCurrentContext;
    
    //set up buttons on modal dialog
    [_modalViewController.email_deque addTarget:self action:@selector(clickedButton:) forControlEvents:UIControlEventTouchDown];
    [_modalViewController.visit_website addTarget:self action:@selector(clickedButton:) forControlEvents:UIControlEventTouchDown];
    [_modalViewController.close addTarget:self action:@selector(clickedButton:) forControlEvents:UIControlEventTouchDown];
}

- (BOOL)information:(id)sender {
    [self.navigationController presentViewController:_modalViewController animated:YES completion:nil]; //open modal dialog
    self.view.accessibilityElementsHidden = YES;
    self.tabBarController.accessibilityElementsHidden = YES;
    UIAccessibilityPostNotification(UIAccessibilityScreenChangedNotification, _modalViewController.view);

    if(![_modalViewController.view accessibilityElementIsFocused]){
        return FALSE;
    }
    return TRUE;
}

-(NSString*)clickedButton:(id)sender {
    UIButton* button = (UIButton*)sender;
    NSString* URL;
    
    if(button == _modalViewController.email_deque) {
        URL = @"mailto:chris.mcmeeking@deque.com";
    } else if(button == _modalViewController.visit_website) {
        URL = @"http://www.deque.com";
    }
    if(![URL isEqual:NULL]) {
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:URL]];
    }
    [self dismissViewControllerAnimated:YES completion:nil];
    self.view.accessibilityElementsHidden = NO;
    self.tabBarController.accessibilityElementsHidden = NO;
    UIAccessibilityPostNotification(UIAccessibilityScreenChangedNotification, self.learnMoreLink);
    
    return URL;
}

@end
