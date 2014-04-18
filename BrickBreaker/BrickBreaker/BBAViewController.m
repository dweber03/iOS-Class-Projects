//
//  BBAViewController.m
//  BrickBreaker
//
//  Created by Derek Weber on 4/17/14.
//  Copyright (c) 2014 Derek Weber. All rights reserved.
//

#import "BBAViewController.h"
#import "BBALevelController.h"

@interface BBAViewController () <BBALevelDelegate>

@end

@implementation BBAViewController
{
    BBALevelController * level;
    UIButton * startButton;
    UILabel * score;
}


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self)
    {
        startButton = [[UIButton alloc] initWithFrame:CGRectMake(240, 150, 60, 60)];
        [startButton setTitle:@"START" forState:UIControlStateNormal];
        startButton.backgroundColor = [UIColor blueColor];
        startButton.layer.cornerRadius = 30;
        [startButton addTarget:self action:@selector(resetLevel) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:startButton];
        
        
        
        score = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH - 280, SCREEN_HEIGHT - 300)];
        score.backgroundColor = [UIColor blackColor];
        
        [self.view addSubview:score];
    }
    return self;
}



- (void)resetLevel
{
    [startButton removeFromSuperview];
    level = [[BBALevelController alloc] initWithNibName:nil bundle:nil];
    level.delegate = self;
    level.view.frame = CGRectMake(0, 20, SCREEN_WIDTH, SCREEN_HEIGHT - 20);
    level.view.backgroundColor = [UIColor blueColor];

    [self.view addSubview:level.view];
    [level resetLevel];
}

-(void)gameDone
{
    [level.view removeFromSuperview];
    [self.view addSubview:startButton];
    
}

-(void)addPoints:(int)points
{
    score.text = [NSString stringWithFormat:@"%d", points];
    score.backgroundColor = [UIColor greenColor];
    
    NSLog(@"Total points = %d", points);

}
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    

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

- (BOOL) prefersStatusBarHidden {return YES; }

@end
