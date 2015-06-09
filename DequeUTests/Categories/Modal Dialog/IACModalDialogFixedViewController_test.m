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

- (void)testSendLayoutChangedNotification {
    XCTAssertTrue([self.controller information:self]);
}

- (void)testInformationButtonAccessibility{
    XCTAssertTrue([self.controller.OpenAModalDialog isAccessibilityElement]);
    DEQAssertStringEqual(self.controller.OpenAModalDialog.accessibilityLabel, @"Open a modal dialog");
    DEQAssertEmptyString(self.controller.OpenAModalDialog.accessibilityHint);
    DEQAssertStringEqual(self.controller.learnMoreLink.accessibilityLabel, @"I would like to learn more about Deque");
    
}

- (void)tearDown {
    [super tearDown];
}

@end
