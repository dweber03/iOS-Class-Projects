//
//  TDLGitHubRequest.h
//  Todo
//
//  Created by Derek Weber on 4/7/14.
//  Copyright (c) 2014 Derek Weber. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TDLGitHubRequest : NSObject

+ (NSDictionary *) getUserWithUsername: (NSString *) username; 

@end
