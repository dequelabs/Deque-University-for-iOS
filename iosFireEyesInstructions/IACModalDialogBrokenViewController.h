//
//  IACModalDialogBrokenViewController.h
//  Accessibility 101
//
//  Created by Jennifer Dailey on 5/26/15.
//  Copyright (c) 2015 Deque Systems. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "IACViewController.h"
#import "CustomIOS7AlertView.h"

@interface IACModalDialogBrokenViewController : IACViewController

@property (weak, nonatomic) IBOutlet UIButton *iWouldLikeToLearnMoreLink;

- (BOOL)information:(id)sender;
- (NSString*)getURLFromIndex:(NSInteger)buttonIndex;

@end
