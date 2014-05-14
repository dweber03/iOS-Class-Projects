//
//  BBASingleton.m
//  BrickBreaker
//
//  Created by Derek Weber on 5/6/14.
//  Copyright (c) 2014 Derek Weber. All rights reserved.
//

#import "BBASingleton.h"

@implementation BBASingleton

+(BBASingleton *)sharedSingleton
{
    static dispatch_once_t singeltonBlock;
    static BBASingleton * singleton = nil;
    
    dispatch_once(&singeltonBlock, ^{
        singleton = [[BBASingleton alloc]init];
    });
    
    return singleton;
}

-(NSArray *)allRowsForSection:(NSString *)sectionName;
{
    return self.sectionInfo[sectionName];
}

-(NSArray *)allSections;
{
    return [self.sectionInfo allKeys];
}

@end
