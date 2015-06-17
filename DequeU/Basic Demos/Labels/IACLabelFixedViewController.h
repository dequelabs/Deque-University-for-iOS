//
//  IACLabelFixedViewController.h
//  Deque University for iOS
//
//  Created by Catherine Fisher on 2/12/14.
//  Copyright (c) 2014 Deque Systems. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "IACViewController.h"
#import <DQA11y/DQA11y.h>

//! The accessible (fixed) verison of the Labels demonstration.
@interface IACLabelFixedViewController : IACViewController {
    IBOutlet DQButton *_DogDisplay; ///< The "Dog" button.
    IBOutlet DQButton *_CatDisplay; ///< The "Cat" button.
    IBOutlet DQButton *_FishDisplay; ///< The "Fish" button.
    IBOutlet UIImageView *_ImageView; ///< The Image view for the pictures to be displayed in.
}

@property (readonly) DQButton *dogDisplay;
@property (readonly) DQButton *catDisplay;
@property (readonly) DQButton *fishDisplay;
@property (readonly) UIImageView *imageView;

//! Updates the image in the imageView given the button that was pressed.
/*! \param sender is the id of the button pressed. */
- (void)displayImage:(id)sender;


@end