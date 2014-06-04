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
        item = [[NSMutableArray alloc]init];    //initialize the mutable array of the singleton class，dynamically
        
    }
    return self;
}

-(void)dealloc {
    //should not be called, just for clarity
}

@end
