//
//  CMAViewController.m
//  Motion
//
//  Created by Derek Weber on 5/22/14.
//  Copyright (c) 2014 Derek Weber. All rights reserved.
//

#import "CMAViewController.h"

#import <CoreMotion/CoreMotion.h>

@interface CMAViewController ()

@end

@implementation CMAViewController
{
    CMMotionManager * mManager;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self)
    {
        mManager = [[CMMotionManager alloc]init];
        
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    float wh = (SCREEN_WIDTH - 30) / 2.0;
   
    // TopView
    UIView * topView = [[UIView alloc] initWithFrame:CGRectMake(10, 10, wh, wh)];
    topView.backgroundColor = [UIColor colorWithWhite:0.95 alpha:1.0];
    [self.view addSubview:topView];
    
    
    // SideView
    UIView * sideView = [[UIView alloc] initWithFrame:CGRectMake((SCREEN_WIDTH + 10) / 2.0, 10, wh, wh)];
    sideView.backgroundColor = [UIColor colorWithWhite:0.95 alpha:1.0];
    [self.view addSubview:sideView];

    UIView * topDot = [[UIView alloc] initWithFrame:CGRectMake(CGRectGetMidX(topView.frame) - 10, CGRectGetMidY(topView.frame) - 10, 20, 20)];
    topDot.backgroundColor = [UIColor redColor];
    topDot.layer.cornerRadius = 10;
    [self.view addSubview:topDot];
    
    UIView * sideDot = [[UIView alloc] initWithFrame:CGRectMake(CGRectGetMidX(sideView.frame) - 10, CGRectGetMidY(topView.frame) - 10, 20, 20)];
    sideDot.backgroundColor = [UIColor redColor];
    sideDot.layer.cornerRadius = 10;
    [self.view addSubview:sideDot];

    
    [mManager startAccelerometerUpdatesToQueue:[NSOperationQueue mainQueue] withHandler:^(CMAccelerometerData *accelerometerData, NSError *error){
        
        
        
        NSLog(@"x :%f", accelerometerData.acceleration.x);
        NSLog(@"y :%f", accelerometerData.acceleration.y);
        NSLog(@"z :%f", accelerometerData.acceleration.z - 1);
        
        float tx = accelerometerData.acceleration.x;
        float ty = -accelerometerData.acceleration.y;
        
        float mintx = CGRectGetMinX(topView.frame);
        float maxtx = CGRectGetMaxX(topView.frame);
        
        if (tx + topDot.frame.origin.x < mintx) tx = 0;
        if (tx + topDot.frame.origin.x > maxtx - 20) tx = 0;
            
        float minty = CGRectGetMinY(topView.frame);
        float maxty = CGRectGetMaxY(topView.frame);
            
        if (ty + topDot.frame.origin.y < minty) ty = 0;
        if (ty + topDot.frame.origin.y > maxty - 20) ty = 0;
        

        topDot.frame = CGRectOffset(topDot.frame, tx, ty);
            
        
        float sx = accelerometerData.acceleration.x;
        float sz = -accelerometerData.acceleration.z - 1;

        float minsx = CGRectGetMinX(sideView.frame);
        float maxsx = CGRectGetMaxX(sideView.frame);
        
        if (sx + sideDot.frame.origin.x < minsx) sx = 0;
        if (sx + sideDot.frame.origin.x > maxsx - 20) sx = 0;
        
        float minsz = CGRectGetMinY(sideView.frame);
        float maxsz = CGRectGetMaxY(sideView.frame);
        
        if (sz + sideDot.frame.origin.y < minsz) sz = 0;
        if (sz + sideDot.frame.origin.y > maxsz - 20) sz = 0;

        sideDot.frame = CGRectOffset(sideDot.frame, sx, sz);

        

    }];
    
    
    
    
}

-(BOOL)prefersStatusBarHidden
{
    return YES;
}


@end
