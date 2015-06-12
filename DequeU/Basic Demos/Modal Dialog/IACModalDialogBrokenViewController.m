//
//  IACModalDialogBrokenViewController.m
//  Deque University for iOS
//
//  Created by Jennifer Dailey on 5/26/15.
//  Copyright (c) 2015 Deque Systems. All rights reserved.
//

#import "IACModalDialogBrokenViewController.h"

@implementation IACModalDialogBrokenViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //set up _iWouldLikeToLearnMoreLink
    [_iWouldLikeToLearnMoreLink.superview addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(information:)]];
    
    //set up modal dialog
    _modalViewController = [[UIStoryboard storyboardWithName:@"ModalDialog" bundle:[NSBundle mainBundle]]
                           instantiateViewControllerWithIdentifier:@"modal"];
    _modalViewController.view.backgroundColor = [UIColor clearColor];
    
    //set up buttons on modal dialog
    [_modalViewController.email_deque addTarget:self action:@selector(clickedButton:) forControlEvents:UIControlEventTouchDown];
    [_modalViewController.visit_website addTarget:self action:@selector(clickedButton:) forControlEvents:UIControlEventTouchDown];
    [_modalViewController.close addTarget:self action:@selector(clickedButton:) forControlEvents:UIControlEventTouchDown];
}

- (BOOL)information:(id)sender {
    [self.view addSubview:_modalViewController.view];
    UIAccessibilityPostNotification(UIAccessibilityLayoutChangedNotification, self.iWouldLikeToLearnMoreLink);

    if(![_modalViewController.view accessibilityElementIsFocused]){
        return TRUE;
    }
    return FALSE;
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
    [_modalViewController.view removeFromSuperview]; //close modal dialog
    return URL;
}

@end

