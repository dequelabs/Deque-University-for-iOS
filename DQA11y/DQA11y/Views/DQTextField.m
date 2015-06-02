//
//  DQA11yTextField.m
//  FormValidation
//
//  Created by Chris McMeeking on 4/10/15.
//  Copyright (c) 2015 Deque Developer. All rights reserved.
//

#import "DQTextField.h"
#import "UIFont+DQFont.h"

@implementation DQTextField {
    NSString* _contentSizeCategory;
}

- (id)init {
    self = [super init];
    
    if (self) {
        [self initialize];
    }
    
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    
    if (self) {
        [self initialize];
    }
    
    return self;
}

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    
    if (self) {
        [self initialize];
    }
    
    return self;
}

-(void)initialize {
    
    _contentSizeCategory = [self.font contentSizeCategory];
    
    [self didChangePreferredContentSize];
    
    /**
     * Listens for a change in the font size as specified in settings
     */
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(didChangePreferredContentSize)
                                                 name:UIContentSizeCategoryDidChangeNotification
                                               object:nil];
    
    
}

/**
 * Changes the font size as specified in settings.
 */
-(void)didChangePreferredContentSize {
    self.font = [UIFont preferredFontForTextStyle:_contentSizeCategory];
}

-(void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

@end
