//
//  LYQGlobalVariable.h
//  test
//
//  Created by Emily Liu on 2014-05-25.
//  Copyright (c) 2014 Emily Liu. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface LYQGlobalVariable : NSObject
{
    //set private variables
    float todaySpending;
    float addSpending;
    int Category;
    int instantCate;
    NSMutableArray *item;
}


@property (nonatomic) float todaySpending;
@property (nonatomic) float addSpending;
@property (nonatomic) int Category;//
@property (nonatomic) int instantCate;
@property (nonatomic) NSMutableArray *item;


+ (LYQGlobalVariable *) sharedGlobal;
@end