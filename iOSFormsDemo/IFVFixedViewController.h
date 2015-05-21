//
//  ViewController.h
//  DequeApp
//
//  Created by Alistair Barrell on 2/27/15.
//  Copyright (c) Deque Systems 2015. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "IACFixedViewController.h"

@interface IFVFixedViewController : IACFixedViewController <UITextFieldDelegate>

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

@property (weak, nonatomic) IBOutlet UIImageView *dequeLogo;

@property (weak, nonatomic) IBOutlet UIButton *learnMoreLink;

@property (weak, nonatomic) IBOutlet UIButton *submitButton;

- (IBAction)submitButton:(id)sender;
- (IBAction)backgroundTap:(id)sender;
- (IBAction)information:(id)sender;

@end

