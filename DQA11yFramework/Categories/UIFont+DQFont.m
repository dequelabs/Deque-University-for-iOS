//
//  UIFont+DQFont.m
//  FormValidation
//
//  Created by Chris McMeeking on 4/13/15.
//  Copyright (c) 2015 Deque Developer. All rights reserved.
//

#import "UIFont+DQFont.h"

@implementation UIFont (DQFont)

- (NSString*const)contentSizeCategory {
    if ([self isEqual:[UIFont preferredFontForTextStyle:UIFontTextStyleBody]]) {
        return UIFontTextStyleBody;
    } else if ([self isEqual:[UIFont preferredFontForTextStyle:UIFontTextStyleCaption1]]) {
        return UIFontTextStyleCaption1;
    } else if ([self isEqual:[UIFont preferredFontForTextStyle:UIFontTextStyleCaption2]]) {
        return UIFontTextStyleCaption2;
    } else if ([self isEqual:[UIFont preferredFontForTextStyle:UIFontTextStyleFootnote]]) {
        return UIFontTextStyleFootnote;
    } else if ([self isEqual:[UIFont preferredFontForTextStyle:UIFontTextStyleHeadline]]) {
        return UIFontTextStyleHeadline;
    } else if ([self isEqual:[UIFont preferredFontForTextStyle:UIFontTextStyleSubheadline]]) {
        return UIFontTextStyleSubheadline;
    } else {
        NSLog(@"Warning: It appears the font is not a dynamic type.");
        return nil;
    }
}

@end
