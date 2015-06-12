//
//  IACModalDialogueBrokenViewController_test.m
//  Deque University for iOS
//
//  Created by Alistair Barrell on 5/29/15.
//  Copyright (c) 2015 Deque Systems. All rights reserved.
//


#import <XCTest/XCTest.h>
#import "IACModalDialogBrokenViewController.h"
#import "IACModalDialogViewController.h"
#import <DQA11y/DQA11y.h>
#import "DEQAsserts.h"

@interface IACModalDialogueBrokenViewController_test : XCTestCase {
    @private
    IACModalDialogBrokenViewController* _viewController;
}

@end

@implementation IACModalDialogueBrokenViewController_test

- (void)setUp {
    [super setUp];
    UIStoryboard *mainStoryboard = [UIStoryboard storyboardWithName:@"ModalDialog" bundle:nil];
    _viewController = [mainStoryboard instantiateViewControllerWithIdentifier:@"ModalBroken"];
    [_viewController view];
}
/*
- (void)testInitialState {
    XCTAssert(_viewController.modalViewController.view.isHidden);
    DEQAssertStringEqual(@"I would like to learn more", _viewController.wrapperView.accessibilityLabel);
    DEQAssertStringEqual(@"Opens a modal dialog.", _viewController.wrapperView.accessibilityHint);
    XCTAssert(_viewController.wrapperView.isAccessibilityElement);
}

- (void)testInformationMethod {
    XCTAssert([_viewController information:self]);
    DEQAssertStringEqual(@"I would like to learn more", _viewController.wrapperView.accessibilityLabel);
    DEQAssertStringEqual(@"Opens a modal dialog.", _viewController.wrapperView.accessibilityHint);
    XCTAssert(!_viewController.modalViewController.view.isHidden);
    XCTAssert(_viewController.modalViewController.email_deque.isAccessibilityElement);
    XCTAssert(_viewController.modalViewController.visit_website.isAccessibilityElement);
    XCTAssert(_viewController.modalViewController.close.isAccessibilityElement);
    
}

- (void)testEmailDequeButton {
    XCTAssert([_viewController information:self]);
    XCTAssert(!_viewController.modalViewController.view.isHidden);
    DEQAssertStringEqual(@"mailto:chris.mcmeeking@deque.com", [_viewController clickedButton:_viewController.modalViewController.email_deque]);
    XCTAssert(_viewController.modalViewController.view.isHidden);
}

- (void)testVisitWebsiteButton {
    XCTAssert([_viewController information:self]);
    XCTAssert(!_viewController.modalViewController.view.isHidden);
    DEQAssertStringEqual(@"http://www.deque.com", [_viewController clickedButton:_viewController.modalViewController.visit_website]);
    XCTAssert(_viewController.modalViewController.view.isHidden);
}

- (void)testCloseButton {
    XCTAssert([_viewController information:self]);
    XCTAssert(!_viewController.modalViewController.view.isHidden);
    DEQAssertEmptyString([_viewController clickedButton:_viewController.modalViewController.close]);
    XCTAssert(_viewController.modalViewController.view.isHidden);
}
*/
@end
