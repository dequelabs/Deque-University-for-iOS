//
//  IFVBadViewController.m
//  iOSFormsDemo
//
//  Created by Chris McMeeking on 4/2/15.
//  Copyright (c) 2015 Deque Developer. All rights reserved.
//

#import "regex.h"
#import "IFVBrokenViewController.h"
#import "IFVFixedViewController.h"
#import "CustomIOS7AlertView.h"

@interface IFVBrokenViewController()

@end

/**
 * Localizable strings can be found in the Localizabe.strings file under supporting files.
 * We make the strings NSLocalizedStrings so that the app can easily be translated into other languages
 */

@implementation IFVBrokenViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _dateField.delegate = self;
    _nameField.delegate = self;
    _emailField.delegate = self;
    
}

+ (BOOL)validateTextField:(UITextField*)textField
               fieldLabel:(UILabel*)fieldLabel
             warningLabel:(UILabel*)warningLabel
           missingWarning:(NSString*)missingWarning
         missingA11yLabel:(NSString*)missingA11yLabel
          missingA11yHint:(NSString*)missingA11yHint
             forPredicate:(NSPredicate*)predicate
         predicateWarning:(NSString*)predicateWarning
       predicateA11yLabel:(NSString*)predicateA11yLabel
        predicateA11yHint:(NSString*)predicateA11yHint
        originalA11yLabel:(NSString*)originalA11yLabel
         originalA11yHint:(NSString*)originalA11yHint {
    
    if (textField.text == nil || [textField.text isEqualToString:@""]) {
        warningLabel.text = missingWarning;
        warningLabel.hidden = NO;
        warningLabel.textColor = [UIColor redColor];
        return NO;
    } else if (![predicate evaluateWithObject:textField.text]) {
        warningLabel.text = predicateWarning;
        warningLabel.hidden = NO;
        warningLabel.textColor = [UIColor redColor];
        return NO;
    } else {
        warningLabel.hidden = YES;
        warningLabel.text = nil;
        return YES;
    }
}

/**
 * When we hit the submit button, all three text fields get validated by "validateTextField"
 * the definition for which can be found in IFVFixedViewController.m
 */
- (IBAction)submitButton:(id)sender {
    
    [self.class validateTextField:_emailField
                       fieldLabel:_emailLabel
                     warningLabel:_emailReq
                   missingWarning:NSLocalizedString(@"VALIDATION_ERROR_MISSING", nil)
                 missingA11yLabel:[NSString stringWithFormat:@"%@ %@", _emailLabel.text, NSLocalizedString(@"VALIDATION_ERROR_MISSING", nil)]
                  missingA11yHint:nil
                     forPredicate:[NSPredicate predicateWithFormat:NSLocalizedString(@"PREDICATE_STRING_EMAIL", nil)]
                 predicateWarning:NSLocalizedString(@"VALIDATION_ERROR_EMAIL_FORMAT", nil)
               predicateA11yLabel:[NSString stringWithFormat:@"%@ %@", _emailLabel.text, NSLocalizedString(@"VALIDATION_ERROR_EMAIL_FORMAT", nil)]
                predicateA11yHint:nil
                originalA11yLabel:_emailLabel.text
                 originalA11yHint:NSLocalizedString(@"VALIDATION_ERROR_MISSING", nil)];
    
    [self.class validateTextField:_dateField
                       fieldLabel:_dateLabel
                     warningLabel:_dateReq
                   missingWarning:NSLocalizedString(@"VALIDATION_ERROR_MISSING", nil)
                 missingA11yLabel:[NSString stringWithFormat:@"%@ %@", _dateLabel.text, NSLocalizedString(@"VALIDATION_ERROR_MISSING", nil)]
                  missingA11yHint:NSLocalizedString(@"VALIDATION_ERROR_DATE_FORMAT_A11Y", nil)
                     forPredicate:[NSPredicate predicateWithFormat:NSLocalizedString(@"PREDICATE_STRING_DATE", nil)]
                 predicateWarning:NSLocalizedString(@"VALIDATION_ERROR_DATE_FORMAT", nil)
               predicateA11yLabel:[NSString stringWithFormat:@"%@ %@", _dateLabel.text, NSLocalizedString(@"VALIDATION_ERROR_DATE_FORMAT_A11Y", nil)]
                predicateA11yHint:nil
                originalA11yLabel:_dateLabel.text
                 originalA11yHint:[NSString stringWithFormat:@"%@ %@", NSLocalizedString(@"DATE_FORMAT_A11Y", nil), NSLocalizedString(@"VALIDATION_ERROR_MISSING", nil)]];
    
    [self.class validateTextField:_nameField
                       fieldLabel:_nameLabel
                     warningLabel:_nameReq
                   missingWarning:NSLocalizedString(@"VALIDATION_ERROR_MISSING", nil)
                 missingA11yLabel:[NSString stringWithFormat:@"%@ %@", _nameLabel.text, NSLocalizedString(@"VALIDATION_ERROR_MISSING", nil)]
                  missingA11yHint:nil
                     forPredicate:[NSPredicate predicateWithFormat:NSLocalizedString(@"PREDICATE_STRING_NAME", nil)]
                 predicateWarning:NSLocalizedString(@"VALIDATION_ERROR_NAME_FORMAT", nil)
               predicateA11yLabel:[NSString stringWithFormat:@"%@ %@", _nameLabel.text, NSLocalizedString(@"VALIDATION_ERROR_NAME_FORMAT", nil)]
                predicateA11yHint:nil
                originalA11yLabel:_nameLabel.text
                 originalA11yHint:NSLocalizedString(@"VALIDATION_ERROR_MISSING", nil)];
    
    if (_nameReq.text) {
        _nameReq.isAccessibilityElement = YES;
    } else {
        _nameReq.isAccessibilityElement = NO;
    }
    
    if (_emailReq.text) {
        _emailReq.isAccessibilityElement = YES;
    } else {
        _emailReq.isAccessibilityElement = NO;
    }
    
    if (_dateReq.text) {
        _dateReq.isAccessibilityElement = YES;
    } else {
        _dateReq.isAccessibilityElement = NO;
    }
}

- (IBAction)backgroundTap:(id)sender { ///< Get rid of keyboard on background tap
    [self.view endEditing:YES];
}


- (BOOL)textFieldShouldReturn:(UITextField *)textField { ///< Get rid of keyboard when "done" is pressed
    
    [textField resignFirstResponder];
    return YES;
}

- (NSUInteger)supportedInterfaceOrientations {
    return UIInterfaceOrientationMaskPortrait;
}

@end
