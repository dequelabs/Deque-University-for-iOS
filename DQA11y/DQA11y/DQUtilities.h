//
//  DQUtilities.h
//  Accessibility 101
//
//  Created by Jennifer Dailey on 5/6/15.
//  Copyright (c) 2015 Deque Systems. All rights reserved.
//

#ifndef Accessibility_101_DQUtilities_h
#define Accessibility_101_DQUtilities_h

/**
 * Deque Utilities File.
 * This file contains methods for accessibility features that are not related to any view or controller.
 */
@interface DQUtilities : NSObject

+(void)createDynamicNotification:(NSString*)announcement; ///< Delays the accessibilityAnnouncementNotification so it does not get interrupted
                                                          ///< by other accessibility notifications

@end

#endif
