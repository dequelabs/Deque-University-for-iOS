//
//  IACModalDialogueFixedViewController_test.m
//  Deque University for iOS
//
//  Created by Alistair Barrell on 5/29/15.
//  Copyright (c) 2015 Deque Systems. All rights reserved.
//


#import <XCTest/XCTest.h>
#import "IACModalDialogFixedViewController.h"
#import "DEQAsserts.h"

@interface IACModalDialogueFixedViewController_test : XCTestCase

@property (strong, nonatomic) IACModalDialogFixedViewController *controller;

@end


@implementation IACModalDialogueFixedViewController_test

@synthesize controller = _controller;

- (void)setUp {
    // Mock view controller
    [super setUp];
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"ModalDialog" bundle:nil];
    self.controller = [storyboard instantiateViewControllerWithIdentifier:@"ModalFixed"];
    
    XCTAssert([self.controller view]);
}

- (void)testInformationMethod {
    DEQAssertEmptyString(self.controller.OpenAModalDialog.accessibilityHint);
    XCTAssert(self.controller.OpenAModalDialog.isAccessibilityElement);
}

- (void)testModalDialogText {
    DEQAssertStringEqual(self.controller.modalDialogViewController.modalDialogTitle.text, NSLocalizedString(@"ALERT_TITLE", nil));
    DEQAssertStringEqual(self.controller.modalDialogViewController.modalDialogDescription.text, NSLocalizedString(@"ALERT_PARAGRAPH", nil));
    DEQAssertStringEqual(self.controller.modalDialogViewController.email_us_button.titleLabel.text, NSLocalizedString(@"ALERT_BUTTON_EMAIL_US", nil));
    DEQAssertStringEqual(self.controller.modalDialogViewController.visit_our_website_button.titleLabel.text,
                         NSLocalizedString(@"ALERT_BUTTON_VISIT", nil));
    DEQAssertStringEqual(self.controller.modalDialogViewController.close_button.titleLabel.text, NSLocalizedString(@"ALERT_BUTTON_CLOSE", nil));
}
/*
- (void)testEmailUsButton {
    DEQAssertStringEqual([self.controller visitWebpage:self.controller.modalDialogViewController.email_us_button], @"mailto:chris.mcmeeking@deque.com");
}

- (void)testVisitWebsiteButton {
    DEQAssertStringEqual([self.controller visitWebpage:self.controller.modalDialogViewController.visit_our_website_button], @"http://www.deque.com");
}

- (void)testCloseButton {
    DEQAssertEmptyString([self.controller visitWebpage:self.controller.modalDialogViewController.close_button]);
}
*/
- (void)tearDown {
    [super tearDown];
}

@end
