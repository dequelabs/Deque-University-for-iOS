//
//  IFVBrokenViewControllerTests.m
//  Accessibility 101
//
//  Created by Alistair Barrell on 5/26/15.
//  Copyright (c) 2015 Deque Systems. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "IFVBrokenViewController.h"
#import "AppDelegate.h"
#import <DQA11y/DQA11y.h>
#import "DEQAsserts.h"
@import CoreGraphics;

#define DEQAssertColorEqualsStoryBoardRed(color) XCTAssertTrue([DQColorUtilities isEqualToColorWithRed:0.919586479 green: 0.055712726  blue: 0.0222684592 alpha:1.0 withColor:color])
#define DEQAssertColorEqualsRedColor(color) XCTAssertTrue([DQColorUtilities isEqual:[UIColor redColor] To:color]);
#define DEQAssertColorEqualsBlack(color) XCTAssertTrue([DQColorUtilities isEqualToColorWithRed:0 green: 0  blue: 0 alpha:1.0 withColor:color])

@interface IFVBrokenViewControllerTests : XCTestCase

@property (strong, nonatomic) IFVBrokenViewController *controller;

@end

@implementation IFVBrokenViewControllerTests

@synthesize controller = _controller;

- (void)setUp {
    [super setUp];
    // Mock view controller
    [super setUp];
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"FormsValidation" bundle:nil];
    self.controller = [storyboard instantiateViewControllerWithIdentifier:@"broken1"];
    
    XCTAssert([self.controller view]);
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testInitialState {
    
    XCTAssertFalse(self.controller.emailField.isAccessibilityElement);
    XCTAssertFalse(self.controller.emailField.superview.isAccessibilityElement);
    XCTAssert([[self.controller emailReq] isHidden]);
    
    XCTAssertFalse(self.controller.dateField.isAccessibilityElement);
    XCTAssertFalse(self.controller.dateField.superview.isAccessibilityElement);
    DEQAssertStringEqual(self.controller.dateReq.text, @"mm/dd/yyyy");
    XCTAssertFalse([[self.controller dateReq] isHidden]);
    
    XCTAssertFalse(self.controller.nameField.isAccessibilityElement);
    XCTAssertFalse(self.controller.nameField.superview.isAccessibilityElement);
    XCTAssert([self.controller nameReq]);
    
    // Check that accessibilityLabel matches the image.
    NSData *checkImageData = UIImagePNGRepresentation([UIImage imageNamed:@"DequeLogo"]);
    XCTAssert([checkImageData isEqualToData:UIImagePNGRepresentation(self.controller.logo.image)]);
    XCTAssert([self.controller.logo.accessibilityLabel isEqualToString:@"Logo, Deque Systems"]);
    
    [self testUserSubmitsValidStrings];
}

-(void)testUserSubmitsValidStrings {
    //Test regex error checking when valid strings are input:
    
    // Input valid strings and submit
    self.controller.emailField.text = @"valid@example.com";
    self.controller.nameField.text = @"valid";
    self.controller.dateField.text = @"11/11/2014";
    [self.controller submitButton:self];
    
    XCTAssertTrue([self.controller.emailReq isHidden]);
    XCTAssertTrue([self.controller.nameReq isHidden]);
    XCTAssertTrue([self.controller.dateReq isHidden]);
}

// Test Regex Error checking with invalid input.
- (void)testUserSubmitsInvalidStrings {
    
    // Input invalid strings and submit form
    self.controller.emailField.text = @"invalidexample";
    self.controller.nameField.text = @"invalid-example";
    self.controller.dateField.text = @"1/1/14";
    [self.controller submitButton:self];
    
    // Verify visual
    DEQAssertStringEqual(self.controller.emailReq.text, @"Please enter a valid email.");
    XCTAssertFalse([self.controller.emailReq isHidden]);
    
    
    DEQAssertStringEqual(self.controller.nameReq.text, @"Can only contain letters and numbers.");
    XCTAssertFalse([self.controller.nameReq isHidden]);
    
    DEQAssertEmptyString(self.controller.nameField.superview.accessibilityHint);
    
    DEQAssertStringEqual(self.controller.dateReq.text, @"Required format mm/dd/yyyy.");
    XCTAssertFalse([self.controller.dateReq isHidden]);
    
    [self testUserSubmitsValidStrings];
}

-(void)testUserSubmitsNothing {
    
    // Input empty strings and submit
    self.controller.emailField.text = @"";
    self.controller.nameField.text = @"";
    self.controller.dateField.text = @"";
    [self.controller submitButton:self];
    
    // Test visual
    DEQAssertStringEqual(self.controller.emailReq.text, @"This field is required.");
    XCTAssertFalse([self.controller.emailReq isHidden]);
    
    
    DEQAssertStringEqual(self.controller.dateReq.text, @"This field is required.");
    XCTAssertFalse([self.controller.dateReq isHidden]);
    
    
    DEQAssertStringEqual(self.controller.nameReq.text, @"This field is required.");
    XCTAssertFalse([self.controller.nameReq isHidden]);
    
    [self testUserSubmitsValidStrings];
}

-(void)testColorChangeOfTextForDateField{
    
    DEQAssertColorEqualsBlack(self.controller.dateReq.textColor);
    DEQAssertColorEqualsStoryBoardRed(self.controller.nameReq.textColor);
    DEQAssertColorEqualsStoryBoardRed(self.controller.emailReq.textColor);
    
    self.controller.emailField.text = @"";
    self.controller.nameField.text = @"";
    self.controller.dateField.text = @"";
    
    DEQAssertColorEqualsBlack(self.controller.dateReq.textColor);
    DEQAssertColorEqualsStoryBoardRed(self.controller.nameReq.textColor);
    DEQAssertColorEqualsStoryBoardRed(self.controller.emailReq.textColor);
    
    [self.controller submitButton:self];
    
    DEQAssertColorEqualsRedColor(self.controller.dateReq.textColor);
    DEQAssertColorEqualsRedColor(self.controller.nameReq.textColor);
    DEQAssertColorEqualsRedColor(self.controller.emailReq.textColor);
    
}


@end
