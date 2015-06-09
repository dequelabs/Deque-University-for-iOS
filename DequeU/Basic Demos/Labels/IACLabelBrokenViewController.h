//
//  DQBrokenLabelViewController.h
//  Deque University for iOS
//
//  Created by Catherine Fisher on 2/12/14.
//  Copyright (c) 2014 Deque Systems. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "IACViewController.h"

//! The broken version of the Labels demonstration.
@interface IACLabelBrokenViewController : IACViewController {
    IBOutlet UIButton *_DogDisplay; ///< The "Dog" button.
    IBOutlet UIButton *_CatDisplay; ///< The "Cat" button.
    IBOutlet UIButton *_FishDisplay; ///< The "Fish" button.
    IBOutlet UIImageView *_ImageView; ///< The Image view for the pictures to be displayed in.
}

@property (readonly) UIButton *dogDisplay;
@property (readonly) UIButton *catDisplay;
@property (readonly) UIButton *fishDisplay;
@property (readonly) UIImageView *imageView;

//! Updates the image in the imageView given the button that was pressed.
/*! \param sender is the id of the button pressed. */
- (void)displayImage:(id)sender;

@end
