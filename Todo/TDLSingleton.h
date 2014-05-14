//
//  TDLSingleton.h
//  Todo
//
//  Created by Derek Weber on 5/6/14.
//  Copyright (c) 2014 Derek Weber. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TDLSingleton : NSObject

+ (TDLSingleton *)sharedSingleton;

-(void)addListItem:(NSDictionary *)listItem;
- (void)removeListItem: (NSDictionary *)listItem;
- (void)removeListItemAtIndex:(NSInteger)index;

-(NSArray *)allListItems;


@end
