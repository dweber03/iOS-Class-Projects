//
//  SMAScores.h
//  SingleMix
//
//  Created by Derek Weber on 5/7/14.
//  Copyright (c) 2014 Derek Weber. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SMAScores : NSObject

+ (SMAScores *)mainData;

@property (nonatomic, readonly)NSInteger TeamAScore;
@property (nonatomic, readonly)NSInteger TeamBScore;

-(void)updateTeamAScore;
-(void)updateTeamBScore;

@end
