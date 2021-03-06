//
//  BBAGameData.m
//  BrickBreaker
//
//  Created by Derek Weber on 5/7/14.
//  Copyright (c) 2014 Derek Weber. All rights reserved.
//

#import "BBAGameData.h"

@implementation BBAGameData

+(BBAGameData *)mainData
{
    static dispatch_once_t create;
    static BBAGameData * singleton = nil;
    
    dispatch_once(&create, ^{
        singleton = [[BBAGameData alloc]init];
    });
    
    return singleton;
    
}

-(void)setCurrentScore:(NSInteger)currentScore
{
    _currentScore = currentScore;
    
    if (currentScore > _topScore) _topScore = currentScore;
}


-(NSArray *)gameScores
{
    return @[];
}

@end
