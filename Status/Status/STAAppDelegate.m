//
//  STAAppDelegate.m
//  Status
//
//  Created by Derek Weber on 5/19/14.
//  Copyright (c) 2014 Derek Weber. All rights reserved.
//

#import "STAAppDelegate.h"
#import "STAVC.h"
#import "STTwitter.h"

@implementation STAAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
   
    
    STAVC * VC = [[STAVC alloc]init];
    
    UINavigationController * navVC = [[UINavigationController alloc]initWithRootViewController:VC];
    
    [navVC setNavigationBarHidden:YES];
    
    self.window.rootViewController = navVC;
    
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;
}


@end
