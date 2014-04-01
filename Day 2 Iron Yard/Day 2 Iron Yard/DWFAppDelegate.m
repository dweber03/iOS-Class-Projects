//
//  DWFAppDelegate.m
//  Day 2 Iron Yard
//
//  Created by Derek Weber on 4/1/14.
//  Copyright (c) 2014 Derek Weber. All rights reserved.
//

#import "DWFAppDelegate.h"

#import "DWFRootViewController.h"

@implementation DWFAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    self.window.rootViewController = [[DWFRootViewController alloc] init]; 
    
    self.window.backgroundColor = [UIColor greenColor];
    [self.window makeKeyAndVisible];
    return YES;

}


@end
