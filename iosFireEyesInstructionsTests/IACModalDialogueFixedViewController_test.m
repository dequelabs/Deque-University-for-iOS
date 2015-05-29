//
//  IACModalDialogueFixedViewController_test.m
//  Accessibility 101
//
//  Created by Alistair Barrell on 5/29/15.
//  Copyright (c) 2015 Deque Systems. All rights reserved.
//


#import <XCTest/XCTest.h>
#import "IACModalDialogFixedViewController.h"

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

- (void)tearDown {
    [super tearDown];
}

@end
