//
//  IACFontSizeBrokenViewController.m
//  Accessibility 101
//
//  Created by Chris McMeeking on 3/31/15.
//  Copyright (c) 2015 Deque Systems. All rights reserved.
//

#import "IACFontSizeBrokenViewController.h"
#import "DEQDynamicTypeLabel.h"
#import "DEQDynamicTypeTextView.h"

@implementation IACFontSizeBrokenViewController {
    
    __weak IBOutlet DEQDynamicTypeLabel *_MainHeading;
    __weak IBOutlet DEQDynamicTypeLabel *_ParagraphOneHeading;
    __weak IBOutlet DEQDynamicTypeTextView *_ParagraphOneText;
    __weak IBOutlet DEQDynamicTypeLabel *_ParagraphTwoHeading;
    __weak IBOutlet DEQDynamicTypeTextView *_ParagraphTwoText;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _MainHeading.text = NSLocalizedString(@"FONT_SIZE_BROKEN_HEADING", nil);
    
    _ParagraphOneHeading.text = NSLocalizedString(@"FONT_SIZE_BROKEN_SUBHEADING1", nil);
    
    _ParagraphOneText.text = NSLocalizedString(@"FONT_SIZE_BROKEN_PARAGRAPH1", nil);
    
    _ParagraphTwoHeading.text = NSLocalizedString(@"FONT_SIZE_BROKEN_SUBHEADING2", nil);
    
    _ParagraphTwoText.text = NSLocalizedString(@"FONT_SIZE_BROKEN_PARAGRAPH2", nil);
}

@end
