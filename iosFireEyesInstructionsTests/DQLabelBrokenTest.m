//
//  DQLabelBrokenTest.m
//  Accessibility 101
//
//  Created by Meng Du on 5/1/15.
//  Copyright (c) 2015 Deque Systems. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "IACLabelBrokenViewController.h"
#import "DQLabel+Test.h"

#define DEQAssertStringEqual(testString, correctString) XCTAssert([testString isEqualToString:correctString], @"\"%@\"", testString)

@interface DQLabelBrokenTest : XCTestCase

@property (strong, nonatomic) IACLabelFixedViewController *controller;

@end

@implementation DQLabelBrokenTest

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
    UIStoryboard *mainStoryboard = [UIStoryboard storyboardWithName:@"Storyboard" bundle:nil];
    NSLog(@"%@", mainStoryboard);
    self.controller = [mainStoryboard instantiateViewControllerWithIdentifier:@"brokenLabel"];
    [self.controller performSelectorOnMainThread:@selector(loadView) withObject:nil waitUntilDone:YES];
    [self.controller performSelectorOnMainThread:@selector(viewDidLoad) withObject:nil waitUntilDone:YES];
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testA_ItemsOnLoad {
    XCTAssert([self.controller dogDisplay], @"Should not be nil");
    XCTAssert([self.controller catDisplay], @"Should not be nil");
    XCTAssert([self.controller fishDisplay], @"Should not be nil");
    XCTAssert([self.controller imageView], @"Should not be nil");
    
    XCTAssert(self.controller.dogDisplay.accessibilityHint == nil);
    XCTAssert(self.controller.dogDisplay.accessibilityLabel == nil);
    XCTAssert(self.controller.catDisplay.accessibilityHint == nil);
    XCTAssert(self.controller.catDisplay.accessibilityLabel == nil);
    XCTAssert(self.controller.fishDisplay.accessibilityHint == nil);
    XCTAssert(self.controller.fishDisplay.accessibilityLabel == nil);
    
    XCTAssertTrue([self.controller.imageView isAccessibilityElement]);
    DEQAssertStringEqual(self.controller.imageView.accessibilityLabel, @"dog");
    DEQAssertStringEqual(self.controller.imageView.accessibilityHint, @"a picture");
}

@end
