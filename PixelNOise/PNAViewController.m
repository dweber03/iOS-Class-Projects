//
//  PNAViewController.m
//  PixelNOise
//
//  Created by Derek Weber on 5/5/14.
//  Copyright (c) 2014 Derek Weber. All rights reserved.
//

#import "PNAViewController.h"
#import "PNAPixelSounds.h"
#import "PNAWorldViewController.h"

@interface PNAViewController ()

@end

@implementation PNAViewController
{
    //This is a LOCAL variable
    PNAPixelSounds * sounds;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self)
    
    {
        sounds = [[PNAPixelSounds alloc]init];
        
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

-(BOOL)prefersStatusBarHidden {return YES;}


- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    NSLog(@"Play Sound");
    
//    [sounds playSoundWithName:@"click_alert"];
    
    
    
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


