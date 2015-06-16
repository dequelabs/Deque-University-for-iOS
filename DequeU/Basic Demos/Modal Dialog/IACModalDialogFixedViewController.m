//
//  IACModalDialogFixedViewController.m
//  Deque University for iOS
//
//  Created by Jennifer Dailey on 5/26/15.
//  Copyright (c) 2015 Deque Systems. All rights reserved.
//

#import "IACModalDialogFixedViewController.h"

@interface IACModalDialogFixedViewController() {
    
    IACModalDialogViewController* _modalDialogViewController; ///< The view controller containing the modal dialog.
}

@end

@implementation IACModalDialogFixedViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _modalDialogViewController = [[UIStoryboard storyboardWithName:@"ModalDialog" bundle:[NSBundle mainBundle]] instantiateViewControllerWithIdentifier:@"AccessibleModal"];
    _modalDialogViewController.view.backgroundColor = [UIColor clearColor];
    
    //set up learnMoreLink button
    [_learnMoreLink.superview addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(information:)]];
    
    //set up buttons on modal dialog
    [_modalDialogViewController.email_us_button addTarget:self action:@selector(visitWebpage:) forControlEvents:UIControlEventTouchDown];
    [_modalDialogViewController.visit_our_website_button addTarget:self action:@selector(visitWebpage:) forControlEvents:UIControlEventTouchDown];
    [_modalDialogViewController.close_button addTarget:self action:@selector(visitWebpage:) forControlEvents:UIControlEventTouchDown];
    
    //set up presentation style
    _modalDialogViewController.modalPresentationStyle = UIModalPresentationOverCurrentContext;

}

- (void)information:(id)sender {
    
    //open modal dialog
    [self.splitViewController presentViewController:_modalDialogViewController animated:YES completion:nil];
    
    //focus on "Thank You" label - needs delay to be sure it is focused.
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, NSEC_PER_SEC), dispatch_get_main_queue(), ^{
        UIAccessibilityPostNotification(UIAccessibilityScreenChangedNotification, _modalDialogViewController.view);
    });
}

-(NSString*)visitWebpage:(id)sender {
    UIButton* button = (UIButton*)sender;
    NSString* URL;
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
    //focus on OpenAModalDialog - needs delay to be sure it is focused.
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, NSEC_PER_SEC), dispatch_get_main_queue(), ^{
        UIAccessibilityPostNotification(UIAccessibilityLayoutChangedNotification, self.OpenAModalDialog);
    });
    
    if(button == _modalDialogViewController.email_us_button) {
        URL = @"mailto:chris.mcmeeking@deque.com";
    } else if(button == _modalDialogViewController.visit_our_website_button) {
        URL = @"http://www.deque.com";
    }
    
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:URL]];
    
    return URL;
}


@end
