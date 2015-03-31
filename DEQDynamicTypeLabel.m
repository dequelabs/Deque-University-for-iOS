//
//  IACResizingLabel.m
//  Accessibility 101
//
//  Created by Chris McMeeking on 3/31/15.
//  Copyright (c) 2015 Deque Systems. All rights reserved.
//

#import "DEQDynamicTypeLabel.h"

@implementation DEQDynamicTypeLabel

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

-(void)initialize {
    _contentSizeCategory = UIFontTextStyleHeadline;
    [self didChangePreferredContentSize];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(didChangePreferredContentSize)
                                                 name:UIContentSizeCategoryDidChangeNotification
                                               object:nil];
    

}

-(void)didChangePreferredContentSize {
    self.font = [UIFont preferredFontForTextStyle:_contentSizeCategory];
}

-(void)setContentSizeCategory:(NSString *)contentSizeCategory {
    
    if (_contentSizeCategory == UIFontTextStyleHeadline ||
        _contentSizeCategory == UIFontTextStyleSubheadline ||
        _contentSizeCategory == UIFontTextStyleFootnote ||
        _contentSizeCategory == UIFontTextStyleCaption2 ||
        _contentSizeCategory == UIFontTextStyleCaption1) {
        
        _contentSizeCategory = contentSizeCategory;
    } else {
        NSLog(@"%@ WARNING: Content Size Category not valid, setting to UIFontTextStyleHeadline by default", self);
        _contentSizeCategory = UIFontTextStyleHeadline;
    }
    
    [self didChangePreferredContentSize];
}


@end
