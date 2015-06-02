//
//  DEQDynamicTypeButton.m
//  FormValidation
//
//  Created by Chris McMeeking on 4/8/15.
//  Copyright (c) 2015 Deque Developer. All rights reserved.
//

#import "DQButton.h"
#import "DQTextView.h"
#import "UIFont+DQFont.h"


@implementation DQButton {
    NSString* _contentSizeCategory;
}

@dynamic shadowed;
@dynamic underlined;

-(id)init {
    self = [super init];
    
    if (self) {
        [self initialize];
    }
    
    return self;
}

-(id)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    
    if (self) {
        [self initialize];
    }
    
    return self;
}

-(id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    
    if (self) {
        [self initialize];
    }
    
    return self;
}

-(void)initialize {
    
    _contentSizeCategory = self.titleLabel.font.contentSizeCategory;
    
    [self didChangePreferredContentSize];
    
    /**
     * Listener for dynamic type
     */
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(didChangePreferredContentSize)
                                                 name:UIContentSizeCategoryDidChangeNotification
                                               object:nil];
}

/**
 * Gets called when type size is changed in settings.
 * This function changes the type size instantly according to the size specified in settings.
 */
-(void)didChangePreferredContentSize {
    self.titleLabel.font = [UIFont preferredFontForTextStyle:_contentSizeCategory];
}

-(void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

/**
 * Sets the text in the button to be underlined if it is underlined
 */
- (void)setUnderlined:(BOOL)underlined {
    if (underlined) {
        NSMutableAttributedString* attributedText = [[NSMutableAttributedString alloc] initWithString:self.titleLabel.text];
        [attributedText addAttribute:NSUnderlineStyleAttributeName value:[NSNumber numberWithInt:NSUnderlineStyleSingle] range:NSMakeRange(0, attributedText.length)];
        [self setAttributedTitle:attributedText forState:UIControlStateNormal];
    } else {
        NSMutableAttributedString* attributedText = [[self attributedTitleForState:UIControlStateNormal] mutableCopy];
        [attributedText removeAttribute:NSUnderlineStyleAttributeName range:NSMakeRange(0, attributedText.length)];
        [self setAttributedTitle:attributedText forState:UIControlStateNormal];
    }
}

/**
 * Sets the button to have a shadow (if wanted) to more easily see that it is a button
 */
- (void)setShadowed:(BOOL)shadowed {
    if (shadowed) {
        self.layer.shadowOffset = CGSizeMake(1,1);
        self.layer.shadowOpacity = 1;
        self.layer.cornerRadius = 3.0;
        self.layer.shadowColor = [UIColor grayColor].CGColor;
    } else {
        self.layer.shadowColor = [UIColor clearColor].CGColor;
    }
}

@end
