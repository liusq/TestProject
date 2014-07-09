//
//  LYQGlobalVariable.m
//  test
//
//  Created by Emily Liu on 2014-05-25.
//  Copyright (c) 2014 Emily Liu. All rights reserved.
//

#import "LYQGlobalVariable.h"




//


@implementation LYQGlobalVariable

@synthesize todaySpending;
@synthesize addSpending;
@synthesize Category;
@synthesize item;
@synthesize instantCate;
@synthesize SpendingDate;
@synthesize spendingLimit;
static  LYQGlobalVariable *sharedGlobalObj = nil;    // static instance variable

//initialize this class as singleton class, also initialize properties
+ (LYQGlobalVariable *)sharedGlobal
{
    if (sharedGlobalObj == nil) {
        sharedGlobalObj = [[super alloc] init];
    }
    return sharedGlobalObj;
}

- (id)init {
    if ( (self = [super init]) ) {
        todaySpending = 0;
        addSpending = 0;
        Category = 10; //10 represent first time use, empty
        instantCate =10;
        spendingLimit = 100;
        item = [[NSMutableArray alloc]init];    //initialize the mutable array of the singleton class，dynamically
        SpendingDate = [NSDate date];
        [self LoadDate];
    }
    return self;
}

-(NSString *)GetFilePath
{
    NSArray *filepath = NSSearchPathForDirectoriesInDomains(NSDocumentationDirectory, NSUserDomainMask, YES);
    return [[filepath objectAtIndex:0] stringByAppendingPathComponent:@"saved.xml"];
}

-(void) SaveDate
{
    //write to file for the global array, however now having issue creating file
    NSArray * value = [[NSArray alloc] initWithObjects:item, nil];
    [value writeToFile:[self GetFilePath] atomically:YES];
}

-(void) LoadDate
{
    NSString * path = [self GetFilePath];
    bool FileExist = [[NSFileManager defaultManager] fileExistsAtPath:path];
    
    if(FileExist)
    {
        NSArray * value = [[NSArray alloc] initWithContentsOfFile:path];
        item = [value objectAtIndex:0];
    }
    
}

-(void)dealloc {
    //should not be called, just for clarity
}

@end
