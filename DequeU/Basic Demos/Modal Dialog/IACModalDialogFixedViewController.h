//
//  IACModalDialogFixedViewController.h
//  Deque University for iOS
//
//  Created by Jennifer Dailey on 5/26/15.
//  Copyright (c) 2015 Deque Systems. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "IACViewController.h"

/**
 * Fixed Modal Dialog
 */

@interface IACModalDialogFixedViewController : IACViewController
@property (weak, nonatomic) IBOutlet UIView *OpenAModalDialog;

@property (weak, nonatomic) IBOutlet UIButton *learnMoreLink;


- (BOOL)information:(id)sender;

@end
