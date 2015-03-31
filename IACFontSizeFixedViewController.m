//
//  IACFontSizeFixedViewController.m
//  Accessibility 101
//
//  Created by Chris McMeeking on 3/31/15.
//  Copyright (c) 2015 Deque Systems. All rights reserved.
//

#import "IACFontSizeFixedViewController.h"
#import "DEQDynamicTypeTextView.h"
#import "DEQDynamicTypeLabel.h"

@interface IACFontSizeFixedViewController () {
    
    __weak IBOutlet DEQDynamicTypeLabel *_MainHeading;
    __weak IBOutlet DEQDynamicTypeLabel *_ParagraphOneHeading;
    __weak IBOutlet UITextView *_ParagraphOneText;
    __weak IBOutlet DEQDynamicTypeLabel *_ParagraphTwoHeading;
    __weak IBOutlet DEQDynamicTypeTextView *_ParagraphTwoText;
}

@end

@implementation IACFontSizeFixedViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _MainHeading.text = NSLocalizedString(@"FONT_SIZE_FIXED_HEADING", nil);
    
    _ParagraphOneHeading.text = NSLocalizedString(@"FONT_SIZE_FIXED_SUBHEADING1", nil);
    
    _ParagraphOneText.text = NSLocalizedString(@"FONT_SIZE_FIXED_PARAGRAPH1", nil);
    
    _ParagraphTwoHeading.text = NSLocalizedString(@"FONT_SIZE_FIXED_SUBHEADING2", nil);
    
    _ParagraphTwoText.text = NSLocalizedString(@"FONT_SIZE_FIXED_PARAGRAPH2", nil);
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
