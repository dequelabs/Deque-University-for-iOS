//
//  IACTextView.m
//  Accessibility 101
//
//  Created by Chris McMeeking on 3/31/15.
//  Copyright (c) 2015 Deque Systems. All rights reserved.
//

#import "DQTextView.h"
#import "UIFont+DQFont.h"

@interface DQTextView ()
@property (nonatomic, weak) NSLayoutConstraint* heightConstraint;
@end

@implementation DQTextView {
    NSString* _contentSizeCategory;
}

+(BOOL)isValidContentSizeCategory:(NSString*const)contentSizeCategory {
    return (contentSizeCategory == UIFontTextStyleHeadline ||
            contentSizeCategory == UIFontTextStyleSubheadline ||
            contentSizeCategory == UIFontTextStyleFootnote ||
            contentSizeCategory == UIFontTextStyleCaption2 ||
            contentSizeCategory == UIFontTextStyleCaption1 ||
            contentSizeCategory == UIFontTextStyleBody);
}

-(id)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    
    if (self)
        [self initialize];
    
    return self;
}

-(id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    
    if (self)
        [self initialize];
    
    return self;
}

-(id)initWithFrame:(CGRect)frame textContainer:(NSTextContainer *)textContainer {
    self = [super initWithFrame:frame textContainer:textContainer];
    
    if (self)
        [self initialize];
    
    return self;
}

-(void)initialize {
    
    _contentSizeCategory = [self.font contentSizeCategory];

    self.scrollEnabled = NO;

    [self didChangePreferredContentSize];
    
    for (NSLayoutConstraint* constraint in self.constraints) {
        if (constraint.firstAttribute == NSLayoutAttributeHeight) {
            if (constraint.relation == NSLayoutRelationEqual) {
                self.heightConstraint = constraint;
            }
        }
    }

    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(didChangePreferredContentSize)
                                                 name:UIContentSizeCategoryDidChangeNotification
                                               object:nil];
    
    
}

-(void)didChangePreferredContentSize {
    self.font = [UIFont preferredFontForTextStyle:_contentSizeCategory];
}

-(void)setFont:(UIFont *)font {
    [super setFont:font];
    [self textViewDidChange];
}

-(void)setText:(NSString *)text {
    [super setText:text];
    [self textViewDidChange];
}

-(void)textViewDidChange {
    CGFloat fixedWidth = self.frame.size.width;
    CGSize newSize = [self sizeThatFits:CGSizeMake(fixedWidth, MAXFLOAT)];
    self.heightConstraint.constant = newSize.height;
}

-(void)setContentSizeCategory:(NSString *)contentSizeCategory {
    
    if ([DQTextView isValidContentSizeCategory:contentSizeCategory]) {
        
        _contentSizeCategory = contentSizeCategory;
    } else {
        NSLog(@"%@ WARNING: Content Size Category not valid, setting to UIFontTextStyleBody by default", self);
        _contentSizeCategory = UIFontTextStyleBody;
    }
    
    [self didChangePreferredContentSize];
}

-(void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

@end
