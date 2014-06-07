//
//  RDAFourSquareRequest.m
//  RandomDestination
//
//  Created by Derek Weber on 6/5/14.
//  Copyright (c) 2014 Derek Weber. All rights reserved.
//

#import "RDAFourSquareRequest.h"

@implementation RDAFourSquareRequest

+ (NSArray *)getVenuesWithLat:(double)lat andLong:(double)lng;
{
    NSArray * venues = @[];
    
    NSString * locationURL = [NSString stringWithFormat:@"https://api.foursquare.com/v2/venues/explore?ll=%f,%f&oauth_token=RO3OCMY1GOZKSSOIQQN4DKX2FNNAQBVQFFND4DMUTIHNIWPA&v=20140605",lat, lng];
    
    
    NSURLRequest * request = [NSURLRequest requestWithURL:[NSURL URLWithString:locationURL]];
    
    NSData * responseData = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
    
    NSDictionary * fsInfo = [NSJSONSerialization JSONObjectWithData:responseData options:0 error:nil];
    
    venues = fsInfo[@"response"][@"groups"][0][@"items"];
    
    
    
    return venues;
    
}


@end
