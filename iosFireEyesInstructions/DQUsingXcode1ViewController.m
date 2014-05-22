//
//  DQUsingXcode1ViewController.m
//  iosFireEyesInstructions
//
//  Created by Catherine Fisher on 4/2/14.
//  Copyright (c) 2014 Deque Systems. All rights reserved.
//

#import "DQUsingXcode1ViewController.h"

@interface DQUsingXcode1ViewController ()

@end

@implementation DQUsingXcode1ViewController {
    IBOutlet UITextView *_step1;
    IBOutlet UITextView *_step2;
    IBOutlet UITextView *_step3;
    IBOutlet UITextView *_step4;
    IBOutlet UIImageView *_step4image;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    
    NSLog(@"Here");
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (BOOL)shouldAutorotate {
    return NO;
}

@end
