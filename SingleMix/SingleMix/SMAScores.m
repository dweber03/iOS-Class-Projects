//
//  SMAScores.m
//  SingleMix
//
//  Created by Derek Weber on 5/7/14.
//  Copyright (c) 2014 Derek Weber. All rights reserved.
//

#import "SMAScores.h"

@implementation SMAScores

+ (SMAScores *)mainData;
{
    
    static dispatch_once_t create;
    static SMAScores * singleton = nil;
    dispatch_once(&create, ^{
        singleton = [[SMAScores alloc]init];
    });
    
    return singleton;
}

-(void)updateTeamAScore
{
    _TeamAScore ++;
}

-(void)updateTeamBScore
{
    _TeamBScore ++;
}



@end
