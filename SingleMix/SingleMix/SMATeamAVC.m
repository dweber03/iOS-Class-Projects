//
//  SMATeamAVC.m
//  SingleMix
//
//  Created by Derek Weber on 5/7/14.
//  Copyright (c) 2014 Derek Weber. All rights reserved.
//

#import "SMATeamAVC.h"
#import "SMAScores.h"

@interface SMATeamAVC ()

@end

@implementation SMATeamAVC


-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [[SMAScores mainData] updateTeamAScore];
    
    
}


@end
