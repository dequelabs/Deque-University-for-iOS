//
//  DQLabelExampleViewController.h
//  iosFireEyesInstructions
//
//  Created by Catherine Fisher on 2/12/14.
//  Copyright (c) 2014 Deque Systems. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GAITrackedViewController.H"


@interface DQLabelExampleViewController : GAITrackedViewController {
    IBOutlet UILabel *_ExampleLabel;
    IBOutlet UILabel *_DogLabel;
    IBOutlet UILabel *_CatLabel;
    IBOutlet UILabel *_FishLabel;
    IBOutlet UIButton *_DogDisplay;
    IBOutlet UIButton *_CatDisplay;
    IBOutlet UIButton *_FishDisplay;
    IBOutlet UITextView *_TextView;
    IBOutlet UIImageView *_ImageView;
}

@property (readonly) UILabel *exampleLabel;
@property (readonly) UILabel *dogLabel;
@property (readonly) UILabel *catLabel;
@property (readonly) UILabel *fishLabel;
@property (readonly) UIButton *dogDisplay;
@property (readonly) UIButton *catDisplay;
@property (readonly) UIButton *fishDisplay;
@property (readonly) UITextView *textView;
@property (readonly) UIImageView *imageView;

- (void)displayImage:(id)sender;


@end
