//
//  BBAGameData.h
//  BrickBreaker
//
//  Created by Derek Weber on 5/7/14.
//  Copyright (c) 2014 Derek Weber. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BBAGameData : NSObject

+ (BBAGameData *)mainData;

@property (nonatomic, readonly)NSInteger topScore;
@property (nonatomic)NSInteger currentScore;

-(NSArray *)gameScores;

@end
