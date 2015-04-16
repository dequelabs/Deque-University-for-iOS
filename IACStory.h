//
//  IACStory.h
//  Accessibility 101
//
//  Created by Chris McMeeking on 4/14/15.
//  Copyright (c) 2015 Deque Systems. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface IACStory : NSObject

@property (strong, nonatomic) UIViewController* viewController;
@property (strong, nonatomic) NSString* title;

- (id)initWithViewController:(UIViewController*)viewController;

@end
