//
//  LYQTodaySpendingViewController.m
//  test
//
//  Created by Emily Liu on 2014-05-25.
//  Copyright (c) 2014 Emily Liu. All rights reserved.
//

#import "LYQTodaySpendingViewController.h"
#import "LYQGlobalVariable.h"
#import "LYQAddSpending.h"


@interface LYQTodaySpendingViewController ()
@property (weak, nonatomic) IBOutlet UIButton *foodPropertyButton;
@property (weak, nonatomic) IBOutlet UIButton *transportationPropertyButton;

@property (weak, nonatomic) IBOutlet UIButton *billsPropertyButton;

@property (weak, nonatomic) IBOutlet UIButton *travelPropertyButton;
@property (weak, nonatomic) IBOutlet UIButton *shoppingPropertyButton;
@property (weak, nonatomic) IBOutlet UIButton *otherPropertyButton;
- (IBAction)BackButton:(id)sender;
- (IBAction)submit:(id)sender;
- (IBAction)foodButton:(id)sender;
- (IBAction)transportationButton:(id)sender;
- (IBAction)travelButton:(id)sender;
- (IBAction)shoppingButton:(id)sender;
- (IBAction)otherButton:(id)sender;
- (IBAction)billsButton:(id)sender;


@property (nonatomic)LYQGlobalVariable * GlobalObj; //declare Global singleton class obj

@property (nonatomic)LYQAddSpending * AddSpendingObj ;

@property (weak, nonatomic) IBOutlet UITextField *priceText;

@property (nonatomic) int CateIndicator;



@end

@implementation LYQTodaySpendingViewController

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
    
    //Create AddSpending Instance for taking user input
    
    _GlobalObj = [LYQGlobalVariable sharedGlobal];
   _AddSpendingObj = [[LYQAddSpending alloc] init];
    _CateIndicator = 10; //first initialze this indicator as 10, means empty
    
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

- (IBAction)BackButton:(id)sender {
    [self.delegate todaySpendingViewControllerDidFinish:self];

}

- (IBAction)submit:(id)sender
{

    if(_CateIndicator==10 || [self.priceText.text isEqualToString:@""])
    {
        UIAlertView* alert = [[UIAlertView alloc]
                              initWithTitle:@"Warning!"
                              message:@"Please enter price and select a category!"
                              delegate:nil
                              cancelButtonTitle:@"OK"
                              otherButtonTitles: nil];
        [alert show];
        //show warning message
        
    }
    else{
        _AddSpendingObj.add = [self.priceText.text floatValue];
        _AddSpendingObj.SetCategory = _CateIndicator;
        
        
        //pass data to Global singleton class
        _GlobalObj.addSpending = _AddSpendingObj.add;
        _GlobalObj.Category = _AddSpendingObj.SetCategory;
        //dynamic allocate memory for temp
        LYQAddSpending * temp = [[LYQAddSpending alloc] init];
        temp.add = _AddSpendingObj.add;
        temp.SetCategory = _AddSpendingObj.SetCategory;
        
        
        //now store temp into Global array for future use
        [_GlobalObj.item addObject:temp ]; //add one item to "item" array
        _CateIndicator = 10; //reset back to 10;
    }
    
}


//button action for categories
- (IBAction)foodButton:(id)sender {
    _CateIndicator = 0;
    _foodPropertyButton.selected = YES;
    _transportationPropertyButton.selected = NO;
    _billsPropertyButton.selected = NO;
    _travelPropertyButton.selected = NO;
    _shoppingPropertyButton.selected = NO;
    _otherPropertyButton.selected = NO;
    
}

- (IBAction)transportationButton:(id)sender {
    _CateIndicator = 1;
    _foodPropertyButton.selected = NO;
    _transportationPropertyButton.selected = YES;
    _billsPropertyButton.selected = NO;
    _travelPropertyButton.selected = NO;
    _shoppingPropertyButton.selected = NO;
    _otherPropertyButton.selected = NO;
}



- (IBAction)travelButton:(id)sender {
    _CateIndicator = 3;
    _foodPropertyButton.selected = NO;
    _transportationPropertyButton.selected = NO;
    _billsPropertyButton.selected = NO;
    _travelPropertyButton.selected = YES;
    _shoppingPropertyButton.selected = NO;
    _otherPropertyButton.selected = NO;
}

- (IBAction)shoppingButton:(id)sender {
    _CateIndicator = 4;
    _foodPropertyButton.selected = NO;
    _transportationPropertyButton.selected = NO;
    _billsPropertyButton.selected = NO;
    _travelPropertyButton.selected = NO;
    _shoppingPropertyButton.selected = YES;
    _otherPropertyButton.selected = NO;
}

- (IBAction)otherButton:(id)sender {
    _CateIndicator = 5;
    _foodPropertyButton.selected = NO;
    _transportationPropertyButton.selected = NO;
    _billsPropertyButton.selected = NO;
    _travelPropertyButton.selected = NO;
    _shoppingPropertyButton.selected = NO;
    _otherPropertyButton.selected =YES;
}

- (IBAction)billsButton:(id)sender {
    _CateIndicator = 2;
    _foodPropertyButton.selected = NO;
    _transportationPropertyButton.selected = NO;
    _billsPropertyButton.selected = YES;
    _travelPropertyButton.selected = NO;
    _shoppingPropertyButton.selected = NO;
    _otherPropertyButton.selected = NO;
}


//touch anywhere to hide number pad
- (void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
     for (UIView *txt in self.view.subviews )
    {
            if(([txt isKindOfClass: [UITextField class]] && [txt isFirstResponder]))
            {
                     [txt resignFirstResponder];
            }
    }
}



@end