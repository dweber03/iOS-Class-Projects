//
//  SABViewController.m
//  StuffedAnimalBattle
//
//  Created by Derek Weber on 5/15/14.
//  Copyright (c) 2014 Derek Weber. All rights reserved.
//

#import "SABViewController.h"
#import <SpriteKit/SpriteKit.h>
#import "SABGameScene.h"


// Create a singleton for player health
// - track wins per player
// move buttons & bars outside of scene
// when a player is hit update singleton & also update health bar ( notification or singleton delegate)

@interface SABViewController ()

@end

@implementation SABViewController

-(id)init
{
    self = [super init];
    if (self)
    {
        
        //all sprite kit games need a sprite kit view
        SKView * skView = [[SKView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
        
        [self.view addSubview:skView];
        
        SABGameScene * skScene = [[SABGameScene alloc]initWithSize:CGSizeMake(SCREEN_WIDTH, SCREEN_HEIGHT)];
        
        skView.showsFPS = YES;
        // NODE is an object of the SCENE(everything on the screen is a NODE)
        skView.showsNodeCount = YES;
        
        [skView presentScene:skScene];
        
        
        UIButton *buttonA = [[UIButton alloc] initWithFrame:CGRectMake(SCREEN_WIDTH - 120, SCREEN_HEIGHT - 120, 40, 40)];
        [buttonA addTarget:skScene action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
        [buttonA setTitle:@"A" forState:UIControlStateNormal];
        buttonA.layer.cornerRadius = 20;
        buttonA.backgroundColor = [UIColor lightGrayColor];
        
        [self.view addSubview:buttonA];
        
        UIButton *buttonB = [[UIButton alloc] initWithFrame:CGRectMake(SCREEN_WIDTH - 70, SCREEN_HEIGHT - 170, 40, 40)];
        [buttonB addTarget:skScene action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
        [buttonB setTitle:@"B" forState:UIControlStateNormal];
        buttonB.layer.cornerRadius = 20;
        buttonB.backgroundColor = [UIColor lightGrayColor];
        
        [self.view addSubview:buttonB];

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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (BOOL)prefersStatusBarHidden {return YES;}


@end
