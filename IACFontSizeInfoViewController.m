//
//  IACFontSizeInfoViewController.m
//  Accessibility 101
//
//  Created by Chris McMeeking on 3/31/15.
//  Copyright (c) 2015 Deque Systems. All rights reserved.
//

#import "IACFontSizeInfoViewController.h"
#import "DEQDynamicTypeTextView.h"
#import "DEQDynamicTypeLabel.h"

@interface IACFontSizeInfoViewController () {
    
    __weak IBOutlet UILabel *_MainHeading;
    __weak IBOutlet UILabel *_ParagraphOneHeading;
    __weak IBOutlet UITextView *_ParagraphOneText;
    __weak IBOutlet UILabel *_ParagraphTwoHeading;
    __weak IBOutlet UITextView *_ParagraphTwoText;
}

@end

@implementation IACFontSizeInfoViewController

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    _MainHeading.text = NSLocalizedString(@"FONT_SIZE_INFO_HEADING", nil);
    
    _ParagraphOneHeading.text = NSLocalizedString(@"FONT_SIZE_INFO_SUBHEADING1", nil);
    
    _ParagraphOneText.text = NSLocalizedString(@"FONT_SIZE_INFO_PARAGRAPH1", nil);
    
    _ParagraphTwoHeading.text = NSLocalizedString(@"FONT_SIZE_INFO_SUBHEADING2", nil);
    
    _ParagraphTwoText.text = NSLocalizedString(@"FONT_SIZE_INFO_PARAGRAPH2", nil);
}

@end
