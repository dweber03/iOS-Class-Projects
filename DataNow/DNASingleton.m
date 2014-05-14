//
//  DNASingleton.m
//  DataNow
//
//  Created by Derek Weber on 5/6/14.
//  Copyright (c) 2014 Derek Weber. All rights reserved.
//

#import "DNASingleton.h"

@implementation DNASingleton

+(DNASingleton *)sharedSingleton
{
    static dispatch_once_t singeltonBlock;
    static DNASingleton * singleton = nil;
    
    dispatch_once(&singeltonBlock, ^{
        singleton = [[DNASingleton alloc]init];
    });
    
    return singleton;
}

//-(NSDictionary *)sectionInfo
//{
//    return @{@"section":
//                    @[
//                     @"row1",
//                     @"row2"]
//             @{@"section2" : @[@"row1",@"row2",@"row3"]
//             };
//}

-(NSArray *)allRowsForSection:(NSString *)sectionName;
{
    return self.sectionInfo[sectionName];
}

-(NSArray *)allSections;
{
    return [self.sectionInfo allKeys];
}


- (BOOL)prefersStatusBarHidden

{return YES;}

@end
