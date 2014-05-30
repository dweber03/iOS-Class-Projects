//
//  STADataArchitecture.m
//  Status
//
//  Created by Derek Weber on 5/29/14.
//  Copyright (c) 2014 Derek Weber. All rights reserved.
//

#import "STADataArchitecture.h"

@implementation STADataArchitecture
{
    NSArray * colors;
    NSMutableDictionary * colorDictionary;
    
    
}

-(void)setupArchitecture
{
    colorDictionary = [@{
               @"yellow": @{
                   
                @"image" : @"colors0",
               [@"faces" : [@[
                       @{
                           @"emotion" : @"happy",
                           @"image" : @"yellow0"
                           },
                       @{
                           @"emotion" : @"smirk",
                           @"image" : @"yellow1"
                           },
                       ] mutableCopy]
               },
               @"red": @{
               @"image" : @"colors1",
               @"faces" : @[]
               }
               } mutableCopy];
    

    colors = @[
                         @{@"color" : @"yellow",
                           @"image" : @"colors0",
                           @"faces" : @[
                                   @{
                                   @"emotion" : @"happy",
                                   @"image" : @"yellow0"
                                   },
                                   @{
                                       @"emotion" : @"smirk",
                                       @"image" : @"yellow1"
                                       },
                                   ]
                           },
                         @{@"color" : @"red",
                           @"image" : @"colors1",
                           @"faces" : @[]
                           },
                         @{@"color" : @"blue",
                           @"image" : @"colors2",
                           @"faces" : @[]
                           },
                         @{@"color" : @"orange",
                           @"image" : @"colors3",
                           @"faces" : @[]
                           },
                         @{},
                         @{},
                         @{},
                         @{},
                         @{}
                         
                         ];
}


-(void)createColors
{
    NSString * yellowKey = [colorDictionary allKeys][0];
    NSDictionary * yellowColor = colorDictionary[yellowKey];
    
    for (NSString * key in [colorDictionary allKeys])
    {
        NSDictionary * color = colorDictionary[key];
    }
    for (NSDictionary * color in colors)
    {
        NSString * imageFileName = color[@"image"];
        imageFileName = [color objectForKey:@"image"];
        UIImage * colorImage = [UIImage imageNamed:color[@"image"]];
                                
    }
}
                                
-(void)createFacesWithColor:(NSString *)color
{
     // yellow color
}
               
-(void)createFacesWithcolorDictionary:(NSDictionary *)color
{
        // yellow color
}
               

@end
               
               
