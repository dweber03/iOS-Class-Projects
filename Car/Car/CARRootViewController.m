//
//  CARRootViewController.m
//  Car
//
//  Created by Derek Weber on 4/1/14.
//  Copyright (c) 2014 Derek Weber. All rights reserved.
//

#import "CARRootViewController.h"

#import "CARWheel.h"

#import "CARBumper.h"

#import "CARWindow.h"

#import "CARGasPedal.h"

#import "CARBrake.h"

@interface CARRootViewController ()

@end

@implementation CARRootViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    CARWheel *wheel1 = [[CARWheel alloc] init];
    
    wheel1.flat = NO;
    wheel1.metaltype = @"chrome";
    wheel1.size = 23;
    wheel1.frame = CGRectMake(20, 40, 40, 40);
    [self.view addSubview: wheel1];
    CARWheel *wheel2 = [[CARWheel alloc] init];
    
    wheel2.flat = NO;
    wheel2.metaltype = @"chrome";
    wheel2.size = 23;
    wheel2.frame = CGRectMake(80, 40, 40, 40);
    [self.view addSubview: wheel2];
    CARWheel *wheel3 = [[CARWheel alloc] init];
    
    wheel3.flat = NO;
    wheel3.metaltype = @"alloy";
    wheel3.size = 23;
    wheel3.frame = CGRectMake(140, 40, 40, 40);
    [self.view addSubview: wheel3];
    CARWheel *wheel4 = [[CARWheel alloc] init];
    
    wheel4.flat = NO;
    wheel4.metaltype = @"alloy";
    wheel4.size = 23;
    wheel4.frame = CGRectMake(200, 40, 40, 40); 
    [self.view addSubview: wheel4];
    CARBumper *bumper1 = [[CARBumper alloc] init];
    
    bumper1.color = [UIColor grayColor];
    bumper1.front = YES;
    bumper1.clearcoat = YES;
    
    CARBumper *bumper2 = [[CARBumper alloc] init];
    
    bumper2.color = [UIColor grayColor];
    bumper2.front = NO;
    bumper2.clearcoat = YES;
    
    CARWindow *window = [[CARWindow alloc] init];
    
    window.tint = YES;
    
    window.up = YES;
    
    window.driver = NO;
    
    CARGasPedal *gasPedal = [[CARGasPedal alloc] init];
    gasPedal.frame = CGRectMake(220, 360, 80, 100);
    
    [gasPedal setTitle: @"Start" forState: UIControlStateNormal];
    
    [gasPedal addTarget:self action:@selector(pressGasPedal) forControlEvents: UIControlEventTouchUpInside];
    
    [self.view addSubview:gasPedal];
    
    CARWindow *windshield = [[CARWindow alloc] init];
    windshield.frame = CGRectMake(20, 160, 280, 200);
    windshield.backgroundColor = [UIColor blackColor];
    windshield.alpha = .2;
    
    [self.view addSubview:windshield];
    
    CARBrake *brake = [[CARBrake alloc] init];
    brake.frame = CGRectMake(20, 360, 60, 80);
    [brake setTitle: @"Stop" forState: UIControlStateNormal];
    [brake addTarget:self action:@selector(pressBrake) forControlEvents: UIControlEventTouchUpInside];
    [self.view addSubview: brake]; 
    
    
}

- (void)pressGasPedal
{
    NSLog(@"pressedGasPedal");
    
}

-(void)pressBrake
{
    NSLog(@"pressBrake");
}

@end
