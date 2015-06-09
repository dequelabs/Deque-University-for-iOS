//
//  DQTraitsBrokenViewController.h
//  Deque University for iOS
//
//  Created by Catherine Fisher on 5/22/14.
//  Copyright (c) 2014 Deque Systems. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "IACViewController.h"
#import <DQA11y/DQA11y.h>

//! The broken version of the Traits demonstration.
/*! This demo is similar to the Labels demonstration. */
@interface IACTraitsBrokenViewController : IACViewController {
    IBOutlet DQButton *_buttonDisplayDog; ///< The "Dog" button.
    IBOutlet DQButton *_buttonDisplayCat; ///< The "Cat" button.
    IBOutlet DQButton *_buttonDisplayFish; ///< The "Fish" button.
    IBOutlet UIImageView *_ImageView; ///< The Image view for the pictures to be displayed in.
}

@property (readonly) DQButton *buttonDisplayDog;
@property (readonly) DQButton *buttonDisplayCat;
@property (readonly) DQButton *buttonDisplayFish;
@property (readonly) UIImageView *ImageView;

//! Updates the image in the imageView given the button that was pressed.
/*!
 * This is only used for the Dog button and Cat button.
 * \param sender is the id of the button pressed.
 */
-(void)displayImage:(id)sender;

//! This opens the corresponding Wikipedia article in Safari when one of the buttons is pressed.
/*!
 * This is only used for the Fish button.
 * \returns an NSString of the URL of the webpage that was visited. This is returned for testing purposes.
 */
-(NSString*)visitWebPage;

@end