//
//  MGAViewController.m
//  MyGame
//
//  Created by Derek Weber on 6/10/14.
//  Copyright (c) 2014 Derek Weber. All rights reserved.
//

#import "MGAViewController.h"
#import <GameKit/GameKit.h>

@interface MGAViewController ()

@end

@implementation MGAViewController
{
    GKLocalPlayer * player;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    player = [GKLocalPlayer localPlayer];
    
    if (!player.isAuthenticated)
    {
        MGAViewController * selfCopy = self;
    [player setAuthenticateHandler:^(UIViewController * viewController, NSError * error)
    {
        if (viewController)[selfCopy presentViewController:viewController animated:YES completion:nil];
        else [selfCopy playerReady];
        
    }];
}
}

-(void)playerReady
{
    [player loadDefaultLeaderboardIdentifierWithCompletionHandler:^(NSString *leaderboardIdentifier, NSError *error) {
        NSLog(@"%@", leaderboardIdentifier);
        
    }];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
