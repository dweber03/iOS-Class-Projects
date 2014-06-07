//
//  RDAAnnotation.h
//  RandomDestination
//
//  Created by Derek Weber on 6/5/14.
//  Copyright (c) 2014 Derek Weber. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@interface RDAAnnotation : NSObject <MKAnnotation>

@property (nonatomic, readonly) CLLocationCoordinate2D coordinate;

-(void)setCoordinate:(CLLocationCoordinate2D)newCoordinate;


@end
