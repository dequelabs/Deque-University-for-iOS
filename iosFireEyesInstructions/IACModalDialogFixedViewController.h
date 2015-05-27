//
//  IACModalDialogFixedViewController.h
//  Accessibility 101
//
//  Created by Jennifer Dailey on 5/26/15.
//  Copyright (c) 2015 Deque Systems. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "IACFixedViewController.h"

@interface IACModalDialogFixedViewController : IACFixedViewController

@property (weak, nonatomic) IBOutlet UIButton *learnMoreLink;

- (IBAction)information:(id)sender;

@end
