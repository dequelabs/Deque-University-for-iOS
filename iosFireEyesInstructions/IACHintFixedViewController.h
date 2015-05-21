//
//  DQFixedHintViewController.h
//  iosFireEyesInstructions
//
//  Created by Catherine Fisher on 2/12/14.
//  Copyright (c) 2014 Deque Systems. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "IACFixedViewController.h"


@interface IACHintFixedViewController : IACFixedViewController {
    IBOutlet UIButton* _buttonStarSpangledBanner;
    IBOutlet UIButton* _buttonAmazingGrace;
    IBOutlet UIButton* _buttonSinginInTheRain;
}

@property (readonly) UIButton* buttonStarSpangledBanner;
@property (readonly) UIButton* buttonAmazingGrace;
@property (readonly) UIButton* buttonSinginInTheRain;

-(NSString*)playMusic:(id)sender;
@end
