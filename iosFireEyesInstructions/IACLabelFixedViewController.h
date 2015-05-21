//
//  IACLabelFixedViewController.h
//  iosFireEyesInstructions
//
//  Created by Catherine Fisher on 2/12/14.
//  Copyright (c) 2014 Deque Systems. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "IACFixedViewController.h"
#import "DQButton.h"

@interface IACLabelFixedViewController : IACFixedViewController {
    IBOutlet DQButton *_DogDisplay;
    IBOutlet DQButton *_CatDisplay;
    IBOutlet DQButton *_FishDisplay;
    IBOutlet UIImageView *_ImageView;
}

@property (readonly) DQButton *dogDisplay;
@property (readonly) DQButton *catDisplay;
@property (readonly) DQButton *fishDisplay;
@property (readonly) UIImageView *imageView;

- (void)displayImage:(id)sender;


@end