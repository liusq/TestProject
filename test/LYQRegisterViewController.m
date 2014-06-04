//
//  LYQRegisterViewController.m
//  test
//
//  Created by Emily Liu on 2014-05-14.
//  Copyright (c) 2014 Emily Liu. All rights reserved.
//

#import "LYQRegisterViewController.h"

@interface LYQRegisterViewController ()
@property (weak, nonatomic) IBOutlet UITextView *textEmailInfo;
- (IBAction)buttonEmailInfo:(id)sender;
- (IBAction)backButton:(id)sender;

@end

@implementation LYQRegisterViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.textEmailInfo.hidden = YES;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
/*
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    if ([[segue identifier] isEqualToString:@"showRegister"])
    {
        [[segue destinationViewController] setDelegate:self];
    }
}
*/

- (IBAction)buttonEmailInfo:(id)sender {
    self.textEmailInfo.text = @"Using registered Email account to retrieve past record and information";
    if(self.textEmailInfo.hidden){
        self.textEmailInfo.hidden = NO;
    }
    else{
        self.textEmailInfo.hidden = YES;
    }
}



//this backbutton represent delegate of registerviewcontroller, it performs future action
- (IBAction)backButton:(id)sender
{
    [self.delegate registerViewControllerDidFinish:self];
}
@end
