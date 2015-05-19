//
//  IACStoryTableTableViewController.h
//  Accessibility 101
//
//  Created by Chris McMeeking on 4/14/15.
//  Copyright (c) 2015 Deque Systems. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface IACStoryTableViewController : UITableViewController

@property (strong, atomic) UIColor* colorDimmed;
@property (strong, atomic) UIColor* colorDimmedDarkened;
@property (strong, atomic) UIColor* colorSelected;
@property (strong, atomic) UIColor* colorSelectedDarkened;
@property (strong, atomic) UIColor* colorMenu;
@property (strong, atomic) UIColor* colorMenuDarkened;
@property (atomic) BOOL translucentUndarkened;
@property (atomic) BOOL translucentDarkened;
@property (weak, nonatomic) IBOutlet UIView* logoView;
@property (weak, nonatomic) IBOutlet UILabel *label;

@end
