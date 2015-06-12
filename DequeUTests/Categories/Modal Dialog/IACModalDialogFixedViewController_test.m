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

@interface IACModalDialogFixedViewController_test : XCTestCase

@property (strong, nonatomic) IACModalDialogFixedViewController *viewController;

@end

@implementation IACModalDialogFixedViewController_test

- (void)setUp {
    [super setUp];
    UIStoryboard *mainStoryboard = [UIStoryboard storyboardWithName:@"ModalDialog" bundle:nil];
    _viewController = [mainStoryboard instantiateViewControllerWithIdentifier:@"ModalBroken"];
    [_viewController view];
}
/*
- (void)testInitialState {
    XCTAssert(_viewController.modalViewController.view.isHidden);
    DEQAssertStringEqual(@"I would like to learn more", _viewController.OpenAModalDialog.accessibilityLabel);
    DEQAssertStringEqual(@"Opens a modal dialog.", _viewController.OpenAModalDialog.accessibilityHint);
    XCTAssert(_viewController.OpenAModalDialog.isAccessibilityElement);
}

- (void)testInformationMethod {
    XCTAssert([_viewController information:self]); //Checks that modal dialog is focused
    DEQAssertStringEqual(@"I would like to learn more", _viewController.OpenAModalDialog.accessibilityLabel);
    DEQAssertStringEqual(@"Opens a modal dialog.", _viewController.OpenAModalDialog.accessibilityHint);
    XCTAssert(!_viewController.modalViewController.view.isHidden);
    XCTAssert(_viewController.modalViewController.email_deque.isAccessibilityElement);
    XCTAssert(_viewController.modalViewController.visit_website.isAccessibilityElement);
    XCTAssert(_viewController.modalViewController.close.isAccessibilityElement);
    XCTAssert(_viewController.view.accessibilityElementsHidden);
    XCTAssert(_viewController.tabBarController.accessibilityElementsHidden);
    XCTAssert(!_viewController.modalViewController.accessibilityElementsHidden);
    
}

- (void)testEmailDequeButton {
    XCTAssert([_viewController information:self]);
    XCTAssert(!_viewController.modalViewController.view.isHidden);
    DEQAssertStringEqual(@"mailto:chris.mcmeeking@deque.com", [_viewController clickedButton:_viewController.modalViewController.email_deque]);
    XCTAssert(_viewController.modalViewController.view.isHidden);
    XCTAssert(_viewController.modalViewController.accessibilityElementsHidden);
    XCTAssert(!_viewController.view.accessibilityElementsHidden);
    XCTAssert(!_viewController.tabBarController.accessibilityElementsHidden);
}

- (void)testVisitWebsiteButton {
    XCTAssert([_viewController information:self]);
    XCTAssert(!_viewController.modalViewController.view.isHidden);
    DEQAssertStringEqual(@"http://www.deque.com", [_viewController clickedButton:_viewController.modalViewController.visit_website]);
    XCTAssert(_viewController.modalViewController.view.isHidden);
    XCTAssert(_viewController.modalViewController.accessibilityElementsHidden);
    XCTAssert(!_viewController.view.accessibilityElementsHidden);
    XCTAssert(!_viewController.tabBarController.accessibilityElementsHidden);
}

- (void)testCloseButton {
    XCTAssert([_viewController information:self]);
    XCTAssert(!_viewController.modalViewController.view.isHidden);
    DEQAssertEmptyString([_viewController clickedButton:_viewController.modalViewController.close]);
    XCTAssert(_viewController.modalViewController.view.isHidden);
    XCTAssert(_viewController.modalViewController.accessibilityElementsHidden);
    XCTAssert(_viewController.view.accessibilityElementsHidden);
    XCTAssert(_viewController.tabBarController.accessibilityElementsHidden);
}*/

@end
