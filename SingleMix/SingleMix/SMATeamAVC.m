//
//  SMATeamAVC.m
//  SingleMix
//
//  Created by Derek Weber on 5/7/14.
//  Copyright (c) 2014 Derek Weber. All rights reserved.
//

#import "SMATeamAVC.h"

@interface SMATeamAVC ()

@end

@implementation SMATeamAVC

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self)
    {
        self.view.backgroundColor = [UIColor blueColor];
        
        
       

        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    int halfHeight = self.view.frame.size.height / 2;
    int width = self.view.frame.size.width;

    self.view.frame = CGRectMake(0, 0, width, halfHeight);
    

    }

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    NSLog(@"Root");
}


@end
