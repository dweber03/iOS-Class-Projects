//
//  BBASingleton.h
//  BrickBreaker
//
//  Created by Derek Weber on 5/6/14.
//  Copyright (c) 2014 Derek Weber. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BBASingleton : NSObject

+ (BBASingleton *)sharedSingleton;

@property (nonatomic) NSDictionary * sectionInfo;

-(NSArray *)allSections;
-(NSArray *)allRowsForSection:(NSString *)sectionName;


@end
