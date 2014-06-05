//
//  LYQUserMainViewController.m
//  test
//
//  Created by Emily Liu on 2014-05-24.
//  Copyright (c) 2014 Emily Liu. All rights reserved.
//

#import "LYQUserMainViewController.h"
#import "LYQGlobalVariable.h"

@interface LYQUserMainViewController ()
@property (nonatomic) IBOutlet UITextField *TodaySpendingField;

@property (nonatomic)LYQGlobalVariable * GlobalObj; //declare Global singleton class obj
@end

@implementation LYQUserMainViewController

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
    _GlobalObj= [LYQGlobalVariable sharedGlobal];
   
    
    
}

- (void)viewDidAppear:(BOOL)animated
{
    NSString * temp =[NSString stringWithFormat:@"%1.2f", _GlobalObj.todaySpending];
    _TodaySpendingField.text = temp;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if([[segue identifier] isEqualToString:@"showTodaySpending"])
    {
        [[segue destinationViewController]setDelegate:self];
        
    }
    
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
- (void) todaySpendingViewControllerDidFinish:(LYQTodaySpendingViewController *)controller
{
    [self dismissViewControllerAnimated:YES completion:nil];
}



@end
