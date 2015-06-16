//
//  IACModalDialogFixedViewController.m
//  Deque University for iOS
//
//  Created by Jennifer Dailey on 5/26/15.
//  Copyright (c) 2015 Deque Systems. All rights reserved.
//

#import "IACModalDialogFixedViewController.h"
#import "IACModalDialogViewController.h"

@interface IACModalDialogFixedViewController () {
    IACModalDialogViewController* _modalViewController;
}

@end

@implementation IACModalDialogFixedViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _modalViewController = [[UIStoryboard storyboardWithName:@"ModalDialog" bundle:[NSBundle mainBundle]] instantiateViewControllerWithIdentifier:@"AccessibleModal"];
       _modalViewController.view.backgroundColor = [UIColor clearColor];
    
    [_learnMoreLink.superview addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(information:)]];
    
    [_modalViewController.email_us_button addTarget:self action:@selector(visitWebpage:) forControlEvents:UIControlEventTouchDown];
    [_modalViewController.visit_our_website_button addTarget:self action:@selector(visitWebpage:) forControlEvents:UIControlEventTouchDown];
    [_modalViewController.close_button addTarget:self action:@selector(visitWebpage:) forControlEvents:UIControlEventTouchDown];
    
    _modalViewController.modalPresentationStyle = UIModalPresentationOverCurrentContext;
    self.navigationController.modalPresentationStyle = UIModalPresentationCurrentContext;
    self.modalPresentationStyle = UIModalPresentationCurrentContext;
}

-(NSString*)visitWebpage:(id)sender {
    UIButton* button = (UIButton*)sender;
    NSString* URL;
    
    [_modalViewController dismissViewControllerAnimated:YES completion:nil];
    
    if(button == _modalViewController.email_us_button) {
        URL = @"mailto:chris.mcmeeking@deque.com";
    } else if(button == _modalViewController.visit_our_website_button) {
        URL = @"http://www.deque.com";
    }
    
    if(![URL isEqualToString:nil]) {
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:URL]];
    }
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, NSEC_PER_SEC), dispatch_get_main_queue(), ^{
        UIAccessibilityPostNotification(UIAccessibilityLayoutChangedNotification, self.OpenAModalDialog);
    });

    return URL;
}

- (BOOL)information:(id)sender {
    [self.navigationController presentViewController:_modalViewController animated:YES completion:nil];
    UIAccessibilityPostNotification(UIAccessibilityScreenChangedNotification, _modalViewController.view);
    
    if(![_modalViewController.view accessibilityElementIsFocused]){
        return FALSE;
    }
    return TRUE;
}

@end
