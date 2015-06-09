//
//  ViewController.h
//  DequeApp
//
//  Created by Alistair Barrell on 2/27/15.
//  Copyright (c) Deque Systems 2015. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "IACViewController.h"
#import <DQA11y/DQA11y.h>

/**
 * Fixed version of the Forms Demo.
 */

@interface IACFormsValidationFixedViewController : IACViewController <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UITextField *nameField;
@property (weak, nonatomic) IBOutlet UILabel *nameRequirement;

@property (weak, nonatomic) IBOutlet UILabel *emailLabel;
@property (weak, nonatomic) IBOutlet UITextField *emailField;
@property (weak, nonatomic) IBOutlet UILabel *emailRequirement;

@property (weak, nonatomic) IBOutlet UILabel *dateLabel;
@property (weak, nonatomic) IBOutlet UITextField *dateField;
@property (weak, nonatomic) IBOutlet UILabel *dateRequirement;

@property (weak, nonatomic) IBOutlet UIImageView *dequeLogo; ///< Title Image

@property (weak, nonatomic) IBOutlet DQButton *submitButton;

- (IBAction)submitButton:(id)sender; ///< when the submit button from above is pressed
- (IBAction)backgroundTap:(id)sender; ///< so that the keyboard disappears on background tap

@end

