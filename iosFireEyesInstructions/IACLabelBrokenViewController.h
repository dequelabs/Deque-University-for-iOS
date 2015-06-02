//
//  DQBrokenLabelViewController.h
//  iosFireEyesInstructions
//
//  Created by Catherine Fisher on 2/12/14.
//  Copyright (c) 2014 Deque Systems. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "IACViewController.h"

/**
 * View Controller for the Broken Labels Demo.
 */

@interface IACLabelBrokenViewController : IACViewController {
    IBOutlet UIButton *_DogDisplay; ///< Dog, Cat, and Fish buttons
    IBOutlet UIButton *_CatDisplay;
    IBOutlet UIButton *_FishDisplay;
    IBOutlet UIImageView *_ImageView; ///< Image view for the pictures to be displayed in
}

@property (readonly) UILabel *brokenLabel;
@property (readonly) UIButton *dogDisplay;
@property (readonly) UIButton *catDisplay;
@property (readonly) UIButton *fishDisplay;
@property (readonly) UIImageView *imageView;

- (void)displayImage:(id)sender;

@end
