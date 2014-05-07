//
//  SMARootVC.m
//  SingleMix
//
//  Created by Derek Weber on 5/7/14.
//  Copyright (c) 2014 Derek Weber. All rights reserved.
//

#import "SMARootVC.h"
#import "SMATeamAVC.h"
#import "SMATeamBVC.h"


@interface SMARootVC ()

@end

@implementation SMARootVC

{
    SMATeamAVC * blueTeam;
    SMATeamBVC * redTeam;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self)
    {
        blueTeam = [[SMATeamAVC alloc] initWithNibName:nil bundle:nil];
        redTeam = [[SMATeamBVC alloc]initWithNibName:nil bundle:nil];

        [self.view addSubview:blueTeam.view];
        [self.view addSubview:redTeam.view];

    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
//-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
//{
//    NSLog(@"Root");
//}

@end
