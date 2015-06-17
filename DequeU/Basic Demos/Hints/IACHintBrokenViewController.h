//
//  DQBrokenHintViewController.h
//  Deque University for iOS
//
//  Created by Catherine Fisher on 2/12/14.
//  Copyright (c) 2014 Deque Systems. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "IACViewController.h"

//! The broken version of the Hints demonstration.
@interface IACHintBrokenViewController : IACViewController {
    IBOutlet UIButton* _buttonStarSpangledBanner; ///< The "Star Spangled Banner" button
    IBOutlet UIButton* _buttonAmazingGrace; ///< The "Amazing Grace" button
    IBOutlet UIButton* _buttonSinginInTheRain; ///< The "Singing in the Rain" button
}

@property (readonly) UIButton* buttonStarSpangledBanner;
@property (readonly) UIButton* buttonAmazingGrace;
@property (readonly) UIButton* buttonSinginInTheRain;

//! This opens the corresponding Wikipedia article in Safari when one of the buttons is pressed.
/*!
 * \param sender is an id of the button that was pressed.
 * \returns an NSString of the URL of the webpage that was visited. This is returned for testing purposes.
 */
-(NSString*)visitWebPage:(id)sender;

@end
