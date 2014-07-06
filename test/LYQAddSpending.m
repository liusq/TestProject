//
//  LYQAddSpending.m
//  test
//
//  Created by Emily Liu on 2014-05-28.
//  Copyright (c) 2014 Emily Liu. All rights reserved.
//

#import "LYQAddSpending.h"

@implementation LYQAddSpending

@synthesize add;
@synthesize SetCategory;
@synthesize AddDate;
LYQAddSpending * AddSpending;

+ (LYQAddSpending *)InitAddSpending
{
        AddSpending = [[super alloc] init];
   
    return AddSpending;
}

- (id)init {
    if ( (self = [super init]) ) {
        add = 0;
        SetCategory = 10;
        
    }
    
    return self;
}

@end
