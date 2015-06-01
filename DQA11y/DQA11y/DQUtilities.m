//
//  DQUtilities.m
//  Accessibility 101
//
//  Created by Jennifer Dailey on 5/6/15.
//  Copyright (c) 2015 Deque Systems. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DQUtilities.h"
#import <UIKit/UIKit.h>

@implementation DQUtilities

+(void)createDynamicNotification:(NSString*)announcement {
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, NSEC_PER_SEC), dispatch_get_main_queue(), ^{
        UIAccessibilityPostNotification(UIAccessibilityAnnouncementNotification, announcement);
    });
}

@end