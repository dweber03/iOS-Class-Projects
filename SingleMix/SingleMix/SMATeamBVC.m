//
//  SMATeamBVC.m
//  SingleMix
//
//  Created by Derek Weber on 5/7/14.
//  Copyright (c) 2014 Derek Weber. All rights reserved.
//

#import "SMATeamBVC.h"
#import "SMAScores.h"

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
//    int halfHeight = self.view.frame.size.height / 2;
//    int width = self.view.frame.size.width;
//    self.view.frame = CGRectMake(0, halfHeight, width, halfHeight);

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [[SMAScores mainData] updateTeamBScore];
}


@end
