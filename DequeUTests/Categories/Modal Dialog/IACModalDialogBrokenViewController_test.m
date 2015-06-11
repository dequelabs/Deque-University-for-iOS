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

- (void)testInformationMethod {
    XCTAssert([_viewController information:self]);
    
}
/*
- (void)testButtonClick {
    DEQAssertStringEqual(@"mailto:chris.mcmeeking@deque.com", [_viewController clickedButton:_viewController.modalViewController.email_deque]);
    DEQAssertStringEqual(@"http://www.deque.com", [_viewController clickedButton:_viewController.modalViewController.visit_website]);
    DEQAssertEmptyString([_viewController clickedButton:_viewController.modalViewController.close]);
}*/





@end
