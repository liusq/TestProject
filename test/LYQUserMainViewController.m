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
@property (nonatomic, retain) IBOutlet UIDatePicker *DateViewer;
@property(nonatomic,retain) IBOutlet UILabel *datelabel;
@property (weak, nonatomic) IBOutlet UIProgressView *progressBar;
@property (weak, nonatomic) IBOutlet UILabel *progressLabel;

@property (nonatomic)LYQGlobalVariable * GlobalObj; //declare Global singleton class obj
@end

@implementation LYQUserMainViewController

//method for makeing progress bar moving
- (void)makeMyProgressBarMoving {
    
    float actual = [self.progressBar progress];
    if (actual < 1) {
        self.progressBar.progress =  ((float)_GlobalObj.todaySpending/(float)_GlobalObj.spendingLimit);
        [NSTimer scheduledTimerWithTimeInterval:0.05 target:self selector:@selector(makeMyProgressBarMoving) userInfo:nil repeats:NO];
        if((float)actual<0.7)
        {
            [self.progressBar setProgressTintColor:[UIColor blueColor]];
        }
        else
        {
            [self.progressBar setProgressTintColor:[UIColor orangeColor]];
        }
    }
    else if(actual == 1)
    {
        if((float)_GlobalObj.todaySpending>(float)_GlobalObj.spendingLimit)
        {
            [self.progressBar setProgressTintColor:[UIColor redColor]];
        }
        else
        {
            [self.progressBar setProgressTintColor:[UIColor orangeColor]];
        }
    }
    
    else if(actual >1){
        
        [self.progressBar setProgressTintColor:[UIColor redColor]];
        
    }
    
}

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

    self.DateViewer.frame = CGRectMake(0, 0, 320, 80);
    self.DateViewer.transform = CGAffineTransformMakeScale(.6, 0.6);
    [self.view addSubview:_DateViewer];
    
     _progressBar.progress = 0.0;
}

- (void)viewDidAppear:(BOOL)animated
{
    NSString * temp =[NSString stringWithFormat:@"%1.2f", _GlobalObj.todaySpending];
    _TodaySpendingField.text = temp;
    [_DateViewer setDate:_GlobalObj.SpendingDate animated:YES];
    if(_GlobalObj.spendingLimit >= _GlobalObj.todaySpending)
    {
        if(((float)_GlobalObj.spendingLimit - (float)_GlobalObj.todaySpending)/((float)_GlobalObj.spendingLimit )> 0.3 )
        {
            self.progressLabel.text = @"On track";
            self.progressLabel.textColor = [UIColor greenColor];
        }
        else
        {
            self.progressLabel.text = @"At risk";
            self.progressLabel.textColor = [UIColor orangeColor];
        }
    }
    //make risk option for user, need to implement further
    else if(_GlobalObj.spendingLimit < _GlobalObj.todaySpending)
    {
        self.progressLabel.text = @"Exceeded";
        self.progressLabel.textColor = [UIColor redColor];
    }
    [self performSelectorOnMainThread:@selector(makeMyProgressBarMoving) withObject:nil waitUntilDone:NO];
    
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
