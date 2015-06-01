//
//  DQWrapperView.m
//  Accessibility 101
//
//  Created by Chris McMeeking on 4/17/15.
//  Copyright (c) 2015 Deque Systems. All rights reserved.
//

#import "DQWrapperView.h"
#import "UIView+DQView.h"

#import "DQLog.h"
#import "DQLabel.h"

#define LOG_FLAG YES

@implementation DQWrapperView

- (id)init {
    
    if (self = [super init]) {
        [self initialize];
    }
    
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder {
    
    if (self = [super initWithCoder:aDecoder]) {
        [self initialize];
    }
    
    return self;
}

- (id)initWithFrame:(CGRect)frame {

    if (self = [super initWithFrame:frame]) {
        [self initialize];
    }
    
    return self;
}

- (void)initialize {
    
    if ([self findFirstActiveElement]) {
        [self addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(singleTapView)]];
    }
}

- (void)singleTapView {

    UIView* activeElement = [self findFirstActiveElement];
    
    if ([activeElement isKindOfClass:[UIButton class]]) {
        UIButton* button = (UIButton*)activeElement;        
        [button sendActionsForControlEvents:UIControlEventTouchUpInside];
    } else if ([activeElement isKindOfClass:[UISwitch class]]) {
        UISwitch* aSwitch = (UISwitch*)activeElement;
        [aSwitch setOn:(!aSwitch.on) animated:YES];
        [aSwitch sendActionsForControlEvents:UIControlEventValueChanged];
    }
}

- (NSString*)accessibilityLabel {
    NSMutableString* accessibilityLabel = [NSMutableString new];
    
    for (UIView* view in self.subviews) {
        
        if (view.accessibilityLabel)
            [accessibilityLabel appendFormat:@" %@", view.accessibilityLabel];
    }
    
    UIView* firstActiveView = [self findFirstActiveElement];
    
    if (firstActiveView && [firstActiveView isKindOfClass:[UIButton class]]) {
        [accessibilityLabel appendFormat:@", %@", NSLocalizedString(@"BUTTON", nil)];
    } else if ([firstActiveView isKindOfClass:[UISwitch class]]) {
        
        UISwitch* switchView = (UISwitch*)firstActiveView;
        
        if (switchView.on) {
            [accessibilityLabel appendString:@", on"];
        } else {
            [accessibilityLabel appendString:@", off"];
        }
    }
    
    return accessibilityLabel;
}

- (NSString*)accessibilityHint {
    
    UIView* firstActiveElement = [self findFirstActiveElement];
    
    if ([firstActiveElement isKindOfClass:[UISwitch class]]) {
        
        UISwitch* switchView = (UISwitch*)firstActiveElement;
        
        if (switchView.state) {
            return @"Double tap to toggle setting.";
        } else {
            return @"Double tap to toggle setting.";
        }
    }
    
    return firstActiveElement.accessibilityHint;
}

@end
