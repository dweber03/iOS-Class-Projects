//
//  SLFAppDelegate.m
//  Selfy
//
//  Created by Derek Weber on 4/21/14.
//  Copyright (c) 2014 Derek Weber. All rights reserved.
//

#import "SLFAppDelegate.h"
#import "SLFTableViewController.h"
#import <Parse/Parse.h>
#import "SLFViewController.h"
#import "SLFSelfyViewController.h"
#import "SLFNavController.h"


@implementation SLFAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    [Parse setApplicationId:@"H1JHLiA7kFRmIWvtbkHDcnA1Caj4UofHxRx6UZAB"
                  clientKey:@"dKLyXccYHUy1MXNgrdR2Sq5b1fNQoTr4clSXVd3p"];
    
    [PFUser enableAutomaticUser];
    
//    self.window.rootViewController = [[SLFTableViewController alloc] initWithStyle:UITableViewStylePlain];
//    self.window.rootViewController = [[SLFViewController alloc] initWithNibName:nil bundle:nil];
//    self.window.rootViewController = [[SLFSelfyViewController alloc] initWithNibName:nil bundle:nil];
    
    SLFNavController * lc = [[SLFNavController alloc]init];
    
    
    self.window.rootViewController = lc;
    
    [lc addViewController:[[SLFViewController alloc] init]];
    
    //    self.window.rootViewController = [TLANavController];
    
    
    

    
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    return YES;
}



@end
