//
//  SMATeamBVC.m
//  SingleMix
//
//  Created by Derek Weber on 5/7/14.
//  Copyright (c) 2014 Derek Weber. All rights reserved.
//

#import "SMATeamBVC.h"

@interface SMATeamBVC ()

@end

@implementation SMATeamBVC

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self)
    
    {
        self.view.backgroundColor = [UIColor redColor];
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


@end
