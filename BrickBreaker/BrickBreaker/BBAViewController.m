//
//  BBAViewController.m
//  BrickBreaker
//
//  Created by Derek Weber on 4/17/14.
//  Copyright (c) 2014 Derek Weber. All rights reserved.
//

#import "BBAViewController.h"
#import "BBALevelController.h"
#import "BBAGameData.h"


@interface BBAViewController () <BBALevelDelegate>

@end

@implementation BBAViewController
{
    BBALevelController * levelController;
//    BBAHeader * header;
//    BBAStats * stats;
    
    UIButton * startButton;
    
    
    UILabel * score;
    UILabel * gameLives;
    
    int lives;
    int topScore;
    int level;
    BOOL newHighScore;
    
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
        
        
        
        
        
    }
    return self;
}

- (void)startGame
{
    
    score = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH - 280, SCREEN_HEIGHT - 300)];
    score.backgroundColor = [UIColor blackColor];
    score.textAlignment = NSTextAlignmentLeft;
    score.text = [NSString stringWithFormat:@"%d", [BBAGameData mainData].topScore];
    [self.view addSubview:score];
    
    lives = 3;
}

- (void)resetLevel
{
    [startButton removeFromSuperview];
    levelController = [[BBALevelController alloc] initWithNibName:nil bundle:nil];
    levelController.delegate = self;
    levelController.view.frame = CGRectMake(0, 20, SCREEN_WIDTH, SCREEN_HEIGHT - 20);
    levelController.view.backgroundColor = [UIColor blueColor];
    
    [self.view addSubview:score];
    [self.view addSubview:levelController.view];
    [levelController resetLevel];
}

-(void)gameDone
{
    [levelController.view removeFromSuperview];
    [score removeFromSuperview];
    [self.view addSubview:startButton];
    
}

-(void)addPoints:(int)points
{
    score.text = [NSString stringWithFormat:@"%d", points];
    score.textColor = [UIColor blueColor];
    
    NSLog(@"Total points = %d", points);

    
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    gameLives = [[UILabel alloc] initWithFrame:CGRectMake(SCREEN_WIDTH - 280, 0, SCREEN_WIDTH - 280, SCREEN_HEIGHT - 300)];
    gameLives.backgroundColor = [UIColor blackColor];
    gameLives.textColor = [UIColor whiteColor];
    
    
    
//    NSUserDefaults * userDefaults = [NSUserDefaults standardUserDefaults];
//    topScore = [[userDefaults objectForKey:@"topScore"] intValue];
//    

}

-(void)updatePoints: (int)points
{
//    score = points;
    
//    NSUserDefaults * userDefaults = [NSUserDefaults standardUserDefaults];
//    [userDefaults setObject:@(topScore) forKey:@"topScore"];
//    [userDefaults synchronize];
//    
    
    // synchronize saves the userDefaults & "topScore"
}

-(int)loseLife
{
    if (lives > 0) lives--;
    return lives;
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
