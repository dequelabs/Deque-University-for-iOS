//
//  UIFont+DQFont.h
//  FormValidation
//
//  Created by Chris McMeeking on 4/13/15.
//  Copyright (c) 2015 Deque Developer. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 * Overwrites UIFont to check for dynamic type
 */
@interface UIFont (DQFont)

- (NSString*const)contentSizeCategory;


@end
