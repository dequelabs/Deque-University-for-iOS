//
//  IACFormsValidationBrokenViewController.h
//  Deque University for iOS
//
//  Created by Chris McMeeking on 4/2/15.
//  Copyright (c) 2015 Deque Developer. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "IACViewController.h"

//! The broken version of the Forms Validation demonstration.
@interface IACFormsValidationBrokenViewController : IACViewController <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UILabel *dateLabel; ///< The
@property (weak, nonatomic) IBOutlet UILabel *emailLabel;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UITextField *nameField;
@property (weak, nonatomic) IBOutlet UITextField *dateField;
@property (weak, nonatomic) IBOutlet UITextField *emailField;
@property (weak, nonatomic) IBOutlet UILabel *nameReq;  ///< nameReq, dateReq and emailReq are visual hints for letting a user
@property (weak, nonatomic) IBOutlet UILabel *emailReq; ///< know a field is required
@property (weak, nonatomic) IBOutlet UILabel *dateReq;
@property (weak, nonatomic) IBOutlet UIImageView *logo;

- (IBAction)submitButton:(id)sender;
- (IBAction)backgroundTap:(id)sender;

@end

