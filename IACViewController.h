//
//  IACViewController.h
//  Accessibility 101
//
//  Created by Chris McMeeking on 4/14/15.
//  Copyright (c) 2015 Deque Systems. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GAITrackedViewController.H"


@interface IACViewController : GAITrackedViewController {
    UIView* _overlayView;
    UIButton* _overlayButton;
}

@property (readonly) UIView* overlayView;
@property (readonly) UIButton* overlayButton;

- (void) createOverlayView;
- (void) changeObnoxiousOverlay;
- (UIImage*) addImage;

@end
