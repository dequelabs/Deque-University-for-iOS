//
//  DQBrokenHintViewController.h
//  iosFireEyesInstructions
//
//  Created by Catherine Fisher on 2/12/14.
//  Copyright (c) 2014 Deque Systems. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "IACViewController.h"

/** 
 * Broken version of our Hints demo.
 * this view controller is NOT for the fixed version
 */

@interface IACHintBrokenViewController : IACViewController {
    IBOutlet UIButton* _buttonStarSpangledBanner;
    IBOutlet UIButton* _buttonAmazingGrace;
    IBOutlet UIButton* _buttonSinginInTheRain;
}

@property (readonly) UIButton* buttonStarSpangledBanner;
@property (readonly) UIButton* buttonAmazingGrace;
@property (readonly) UIButton* buttonSinginInTheRain;

-(NSString*)visitWebPage:(id)sender;

@end
