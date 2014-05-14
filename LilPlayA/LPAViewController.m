//
//  LPAViewController.m
//  LilPlayA
//
//  Created by Derek Weber on 5/13/14.
//  Copyright (c) 2014 Derek Weber. All rights reserved.
//

#import "LPAViewController.h"
#import <AVFoundation/AVFoundation.h>

@interface LPAViewController ()
{
    AVAudioPlayer * player;
    UIView * seekButton;
    UIView * progressBar;
}

@end

@implementation LPAViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self)
    {
        int w = [UIScreen mainScreen].bounds.size.width;
        int h = [UIScreen mainScreen].bounds.size.height;
        
        UIButton * playButton = [[UIButton alloc]initWithFrame:CGRectMake(10, (h-50) / 2, 50, 50)];
        playButton.backgroundColor = [UIColor greenColor];
        playButton.layer.cornerRadius = 25;
        [self.view addSubview:playButton];
        
        UIButton * stopButton = [[UIButton alloc]initWithFrame:CGRectMake(w-60, (h-50)/2 , 50, 50)];
        stopButton.backgroundColor = [UIColor redColor];
        stopButton.layer.cornerRadius = 25;
        [self.view addSubview:stopButton];
        
        seekButton = [[UIView alloc] initWithFrame:CGRectMake(70, (h-50)/2 + 40, 10, 10)];
        seekButton.backgroundColor = [UIColor blueColor];
        seekButton.layer.cornerRadius = 5;
        
        progressBar = [[UIView alloc] initWithFrame:CGRectMake(70, (h-50)/2 + 40, w-140, 4)];
        progressBar.backgroundColor = [UIColor lightGrayColor];
        [self.view addSubview:progressBar];
        [self.view addSubview:seekButton];
        
        
        
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT,(unsigned long)NULL), ^{
            
            NSURL * url = [NSURL URLWithString:@"https://api.soundcloud.com/tracks/147445565/download?client_id=2d87025c8392069f828c446b965862e3"];
            NSData * data = [NSData dataWithContentsOfURL:url];
            
            dispatch_async(dispatch_get_main_queue(), ^{
                
                player = [[AVAudioPlayer alloc]initWithData:data error:nil];
                
                [playButton addTarget:player action:@selector(play) forControlEvents:UIControlEventTouchUpInside];
                
//                [playButton addTarget:player action:@selector(pause) forControlEvents:UIControlEventTouchUpInside];
                [stopButton addTarget:player action:@selector(stop) forControlEvents:UIControlEventTouchUpInside];
                
                NSTimer * timer = [NSTimer timerWithTimeInterval:0.5 target:self selector:@selector(updateProgress) userInfo:nil repeats:YES];
                
                [timer fire];
                
            });
            
        });
    }
    return self;
}

-(void)updateProgress
{
    float timePosition = player.currentTime / player.duration;
    float xPosition = progressBar.frame.origin.x + timePosition * progressBar.frame.size.width;
    
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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
