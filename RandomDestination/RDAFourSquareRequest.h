//
//  RDAFourSquareRequest.h
//  RandomDestination
//
//  Created by Derek Weber on 6/5/14.
//  Copyright (c) 2014 Derek Weber. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RDAFourSquareRequest : NSObject

+(NSArray *)getVenuesWithLat:(double)lat andLong:(double)lng;

@end
