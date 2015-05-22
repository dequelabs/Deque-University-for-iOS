//
//  ViewController.m
//  DequeApp
//
//  Created by Alistair Barrell on 2/27/15.
//  Copyright (c) Deque Systems 2015. All rights reserved.
//
#import "regex.h"
#import "IFVFixedViewController.h"
#import "CustomIOS7AlertView.h"
#import "UIFont+DQFont.h"
#import "IACConstants.h"
#import "IACUtilities.h"

@interface IFVFixedViewController ()<CustomIOS7AlertViewDelegate>

@property UIColor* backgroundColorView;


@end

@implementation IFVFixedViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [_submitButton setShadowed:YES];
    _dateField.delegate = self;
    _nameField.delegate = self;
    _emailField.delegate = self;
    _dateField.accessibilityHint = [NSString stringWithFormat:@"%@ %@",
                                     NSLocalizedString(@"DATE_FORMAT_A11Y", nil),
                                     NSLocalizedString(@"VALIDATION_ERROR_MISSING", nil)];
    
    _emailField.accessibilityHint = NSLocalizedString(@"VALIDATION_ERROR_MISSING", nil);
    _nameField.superview.accessibilityHint = NSLocalizedString(@"VALIDATION_ERROR_MISSING", nil);
    
    [_dateField.superview addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(singleTapDateView)]];
    [_emailField.superview addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(singleTapeEmailView)]];
    [_nameField.superview addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(singleTapNameView)]];
    [_learnMoreLink.superview addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(information:)]];
}

- (IBAction)submitButton:(id)sender {
    
    [IFVFixedViewController validateTextField:_emailField
                                  fieldLabel:_emailLabel
                                warningLabel:_emailRequirement
                              missingWarning:NSLocalizedString(@"VALIDATION_ERROR_MISSING", nil)
                            missingA11yLabel:[NSString stringWithFormat:@"%@ %@", _emailLabel.text, NSLocalizedString(@"VALIDATION_ERROR_MISSING_A11Y", nil)]
                             missingA11yHint:nil
                                forPredicate:[NSPredicate predicateWithFormat:NSLocalizedString(@"PREDICATE_STRING_EMAIL", nil)]
                            predicateWarning:NSLocalizedString(@"VALIDATION_ERROR_EMAIL_FORMAT", nil)
                          predicateA11yLabel:[NSString stringWithFormat:@"%@ %@", _emailLabel.text, NSLocalizedString(@"VALIDATION_ERROR_EMAIL_FORMAT_A11Y", nil)]
                           predicateA11yHint:nil
                           originalA11yLabel:_emailLabel.text
                            originalA11yHint:NSLocalizedString(@"VALIDATION_ERROR_MISSING", nil)];
    
    [IFVFixedViewController validateTextField:_dateField
                                  fieldLabel:_dateLabel
                                warningLabel:_dateRequirement
                              missingWarning:[NSString stringWithFormat:@"%@ %@", NSLocalizedString(@"VALIDATION_ERROR_MISSING", nil), NSLocalizedString(@"DATE_FORMAT", nil)]
                            missingA11yLabel:[NSString stringWithFormat:@"%@ %@ %@", _dateLabel.text, NSLocalizedString(@"DATE_FORMAT_A11Y", nil), NSLocalizedString(@"VALIDATION_ERROR_MISSING_A11Y", nil)]
                             missingA11yHint:nil
                                forPredicate:[NSPredicate predicateWithFormat:NSLocalizedString(@"PREDICATE_STRING_DATE", nil)]
                            predicateWarning:NSLocalizedString(@"VALIDATION_ERROR_DATE_FORMAT", nil)
                          predicateA11yLabel:[NSString stringWithFormat:@"%@ %@", _dateLabel.text, NSLocalizedString(@"VALIDATION_ERROR_DATE_FORMAT_A11Y", nil)]
                           predicateA11yHint:nil
                           originalA11yLabel:_dateLabel.text
                            originalA11yHint:[NSString stringWithFormat:@"%@ %@",
                                              NSLocalizedString(@"DATE_FORMAT_A11Y", nil),
                                              NSLocalizedString(@"VALIDATION_ERROR_MISSING", nil)]];
    
    [IFVFixedViewController validateTextField:_nameField
                                  fieldLabel:_nameLabel
                                warningLabel:_nameRequirement
                              missingWarning:NSLocalizedString(@"VALIDATION_ERROR_MISSING", nil)
                            missingA11yLabel:[NSString stringWithFormat:@"%@ %@", _nameLabel.text, NSLocalizedString(@"VALIDATION_ERROR_MISSING_A11Y", nil)]
                             missingA11yHint:nil
                                forPredicate:[NSPredicate predicateWithFormat:NSLocalizedString(@"PREDICATE_STRING_NAME", nil)]
                            predicateWarning:NSLocalizedString(@"VALIDATION_ERROR_NAME_FORMAT", nil)
                          predicateA11yLabel:[NSString stringWithFormat:@"%@ %@", _nameLabel.text, NSLocalizedString(@"VALIDATION_ERROR_NAME_FORMAT_A11Y", nil)]
                           predicateA11yHint:nil
                           originalA11yLabel:_nameLabel.text
                            originalA11yHint:NSLocalizedString(@"VALIDATION_ERROR_MISSING", nil)];
   
    if (_nameRequirement.text) {
        UIAccessibilityPostNotification(UIAccessibilityLayoutChangedNotification, _nameField.superview);
    } else if (_emailRequirement.text) {
        UIAccessibilityPostNotification(UIAccessibilityLayoutChangedNotification, _emailField.superview);
    } else if (_dateRequirement.text) {
        UIAccessibilityPostNotification(UIAccessibilityLayoutChangedNotification, _dateField.superview);
    }
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    UIAccessibilityPostNotification(UIAccessibilityLayoutChangedNotification, _dequeLogo);
}

- (IBAction)backgroundTap:(id)sender {
    //get rid of keyboard on background tap
    [self.view endEditing:YES];
}

// get rid of keyboard when "done" is pressed
- (BOOL)textFieldShouldReturn:(UITextField *)textField {

    [textField resignFirstResponder];
    return YES;
}

- (NSUInteger)supportedInterfaceOrientations {
    return UIInterfaceOrientationMaskPortrait;
}

- (IBAction)information:(id)sender {
    
    UIAccessibilityPostNotification(UIAccessibilityScreenChangedNotification, @"Alert Opened");
    
    CustomIOS7AlertView *alertView = [CustomIOS7AlertView alertWithTitle:NSLocalizedString(@"ALERT_TITLE", nil)
                                                                 message:NSLocalizedString(@"ALERT_PARAGRAPH", nil)];
    
    [alertView setButtonTitles:[NSMutableArray arrayWithObjects:NSLocalizedString(@"ALERT_BUTTON_EMAIL_US", nil),
                                NSLocalizedString(@"ALERT_BUTTON_VISIT", nil),
                                NSLocalizedString(@"ALERT_BUTTON_CLOSE", nil),
                                nil]];
    
    [alertView setButtonColors:[NSMutableArray arrayWithObjects:[UIColor colorWithRed:255.0f/255.0f
                                                                                green:77.0f/255.0f
                                                                                 blue:94.0f/255.0f
                                                                                alpha:1.0f],
                                                                [UIColor colorWithRed:0.0f
                                                                                green:0.5f
                                                                                 blue:1.0f
                                                                                alpha:1.0f],nil]];
    
    UIViewController* modalViewControlelr = [[UIStoryboard storyboardWithName:@"FormsValidation" bundle:[NSBundle mainBundle]] instantiateViewControllerWithIdentifier:@"AccessibleModal"];
    modalViewControlelr.view.backgroundColor = [UIColor clearColor];
    [modalViewControlelr setView:alertView];
    self.modalPresentationStyle = UIModalPresentationCurrentContext;
    [self.navigationController presentViewController:modalViewControlelr animated:YES completion:nil];
    
    [alertView setDelegate:self];
    [alertView show];
    
    self.view.accessibilityElementsHidden = YES;
    self.tabBarController.view.accessibilityElementsHidden = YES;
    
    
}

- (void)customIOS7dialogButtonTouchUpInside: (CustomIOS7AlertView *)alertView clickedButtonAtIndex: (NSInteger)buttonIndex {
    if (buttonIndex == 0) {
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"mailto:chris.mcmeeking@deque.com"]];
    } else if (buttonIndex == 1) {
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://www.deque.com"]];
    }
    
    [alertView close];
    [self dismissViewControllerAnimated:YES completion:nil];
    self.view.accessibilityElementsHidden = NO;
    self.tabBarController.view.accessibilityElementsHidden = NO;
    UIAccessibilityPostNotification(UIAccessibilityLayoutChangedNotification, [[self learnMoreLink] superview]);
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
        
        textField.superview.accessibilityLabel = missingA11yLabel;
        textField.superview.accessibilityHint = missingA11yHint;
        
        return NO;
    } else if (![predicate evaluateWithObject:textField.text]) {
        warningLabel.text = predicateWarning;
        warningLabel.hidden = NO;
        warningLabel.textColor = [UIColor redColor];
        
        textField.superview.accessibilityHint = predicateA11yHint;
        textField.superview.accessibilityLabel = predicateA11yLabel;
        
        return NO;
    } else {
        warningLabel.hidden = YES;
        warningLabel.text = nil;
        
        textField.superview.accessibilityLabel = originalA11yLabel;
        textField.superview.accessibilityHint = originalA11yHint;
        
        return YES;
    }
}

- (void)singleTapDateView {
    [_dateField becomeFirstResponder];
}

- (void)singleTapNameView {
    [_nameField becomeFirstResponder];
}

- (void)singleTapeEmailView {
    [_emailField becomeFirstResponder];
}

@end
