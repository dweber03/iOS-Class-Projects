//
//  EDAViewController.m
//  EggDrop
//
//  Created by Derek Weber on 5/22/14.
//  Copyright (c) 2014 Derek Weber. All rights reserved.
//

#import "EDAViewController.h"
#import <CoreMotion/CoreMotion.h>

@interface EDAViewController ()

@end

@implementation EDAViewController
{
    CMMotionManager * mManager;
    BOOL eggIsFalling;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    mManager = [[CMMotionManager alloc]init];
	
    [mManager startDeviceMotionUpdatesToQueue:[NSOperationQueue mainQueue] withHandler:^(CMDeviceMotion *motion, NSError *error) {
       
        float roll = motion.attitude.roll * 10;
        
        if(!eggIsFalling) self.egg.frame = CGRectOffset(self.egg.frame, roll, 0);
        
        
        float eggMidX = CGRectGetMidX(self.egg.frame);
        float spoonMidX = CGRectGetMidX(self.spoon.frame);
        
        if (fabs(spoonMidX - eggMidX) > self.egg.frame.size.width / 2.0 && !eggIsFalling)
        {
            eggIsFalling = YES;
            
            [UIView animateWithDuration:0.3 animations:^{
                
            self.egg.frame = CGRectOffset(self.egg.frame,(self.egg.frame.size.width)/4.0, (self.egg.frame.size.height)/4.0);
                
                float x = self.egg.frame.origin.x + self.egg.frame.size.width/4.0;
                float y = self.egg.frame.origin.y + self.egg.frame.size.height/4.0;

                float w = self.egg.frame.size.width/2.0;
                float h = self.egg.frame.size.height/2.0;
                
                self.egg.frame = CGRectMake(x, y, w, h);
                
//            self.egg.transform = CGAffineTransformScale(CGAffineTransformIdentity, 0.5, 0.5);
                
                
            }];
        }
        
        
    }];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    
    
    
}

@end
