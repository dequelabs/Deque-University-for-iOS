//
//  DQTraitsBrokenViewController.h
//  iosFireEyesInstructions
//
//  Created by Catherine Fisher on 5/22/14.
//  Copyright (c) 2014 Deque Systems. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "IACViewController.h"
#import <DQA11y/DQA11y.h>

/**
 * Broken Hints View Controller.
 */

///< Similar interface to the Labels Demo

@interface IACTraitsBrokenViewController : IACViewController {
    IBOutlet DQButton *_buttonDisplayDog;
    IBOutlet DQButton *_buttonDisplayCat;
    IBOutlet DQButton *_buttonDisplayFish;
    IBOutlet UIImageView *_ImageView;
}

@property (readonly) DQButton *buttonDisplayDog;
@property (readonly) DQButton *buttonDisplayCat;
@property (readonly) DQButton *buttonDisplayFish;
@property (readonly) UIImageView *ImageView;

-(void)displayImage:(id)sender;
-(NSString*)visitWebPage;

@end