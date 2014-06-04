//
//  LYQRegisterViewController.h
//  test
//
//  Created by Emily Liu on 2014-05-14.
//  Copyright (c) 2014 Emily Liu. All rights reserved.
//

#import <UIKit/UIKit.h>

@class LYQRegisterViewController;

@protocol LYQRegisterViewControllerDelegate
-(void)registerViewControllerDidFinish: (LYQRegisterViewController *)controller;

@end
@interface LYQRegisterViewController : UIViewController

//create a delegate variable called "delegate" for other object to use
@property (weak, nonatomic) id <LYQRegisterViewControllerDelegate> delegate;


@end
