//
//  StatusBarViewController.m
//  LKPEnterpriseKit
//
//  Created by Leonard Pham on 10/2/13.
//  Copyright (c) 2013 Lenny Pham. All rights reserved.
//

#import "StatusBarViewController.h"

@interface StatusBarViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *myBackgroundImageView;

@property (nonatomic) NSInteger myStatusBarStyle;

@property (nonatomic) NSInteger myStatusBarAnimationFadeStyle;

@property (nonatomic) BOOL myStatusBarIsHidden;

@end

@implementation StatusBarViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.myStatusBarStyle              = UIStatusBarStyleDefault;
    self.myStatusBarAnimationFadeStyle = UIStatusBarAnimationFade;
}

- (IBAction)userDidChooseContent:(id)sender
{
    UISegmentedControl *segmentedControl = (UISegmentedControl *)sender;
    
    if (segmentedControl.selectedSegmentIndex == 0)
    {
        self.navigationController.navigationBar.barStyle        = UIBarStyleDefault;
        self.navigationController.navigationBar.barTintColor    = [UIColor whiteColor];
    }
    else
    {
        self.navigationController.navigationBar.barStyle        = UIBarStyleBlack;
        self.navigationController.navigationBar.barTintColor    = [UIColor blackColor];
    }
}

- (IBAction)userDidHideContent:(id)sender
{
    UISegmentedControl *segmentedControl = (UISegmentedControl *)sender;

    if (segmentedControl.selectedSegmentIndex == 0)
    {
        self.myStatusBarIsHidden = NO;
    }
    else
    {
        self.myStatusBarIsHidden = YES;
    }
    
    [UIView animateWithDuration:0.5 animations:^{
        [self setNeedsStatusBarAppearanceUpdate];
    }];
    
}

- (IBAction)userDidChooseAnimation:(id)sender
{
    UISegmentedControl *segmentedControl = (UISegmentedControl *)sender;
    
    switch (segmentedControl.selectedSegmentIndex)
    {
        case 0:
            self.myStatusBarAnimationFadeStyle = UIStatusBarAnimationFade;
            break;
        case 1:
            self.myStatusBarAnimationFadeStyle = UIStatusBarAnimationSlide;
            break;
        case 2:
            self.myStatusBarAnimationFadeStyle = UIStatusBarAnimationNone;
            break;
            
        default:
            break;
    }
    
}

- (BOOL)prefersStatusBarHidden
{
    return self.myStatusBarIsHidden;
}

- (UIStatusBarAnimation)preferredStatusBarUpdateAnimation
{
    return self.myStatusBarAnimationFadeStyle;
}

@end
