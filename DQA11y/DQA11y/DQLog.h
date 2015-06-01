//
//  DQLog.h
//  Accessibility 101
//
//  Created by Chris McMeeking on 4/17/15.
//  Copyright (c) 2015 Deque Systems. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 * Deque Log for iOS Application Development.
 * DQLog and DQLogElement write its arguments to NSLog with extra information, including the class name
 */
#define DQLog(args...) if (LOG_FLAG) NSLog(@"[%@ %@] - %@", self.class, NSStringFromSelector(_cmd), [NSString stringWithFormat:args])
#define DQLogElement(arg) if (LOG_FLAG) NSLog(@"%@ - %@ %@", self.class, NSStringFromSelector(_cmd), arg)

@interface DQLog : NSObject

@end
