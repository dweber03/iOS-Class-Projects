//
//  TLANavController.m
//  TweetLike
//
//  Created by Derek Weber on 4/23/14.
//  Copyright (c) 2014 Derek Weber. All rights reserved.
//

#import "TLANavController.h"

#import "TLATableViewController.h"


@interface TLANavController ()

@end

@implementation TLANavController
{
    UIButton * addNewButton;
    
    UIView * blueBox;
    UIView * newForm;
    
    
    UITextView * tweetMessage;
    UIImageView * logo;
    UIButton * cancel;
    UIButton * submit;
    
}

- (id)initWithRootViewController:(UIViewController *)rootViewController
{
    self = [super initWithRootViewController:rootViewController];
    if (self)
        
        
    {
        
        self.navigationBar.barTintColor = [UIColor blueColor];
        self.navigationBar.translucent = NO;
        
        
        newForm = [[UIView alloc] initWithFrame:self.view.frame];
        
        [self.view addSubview:newForm];
        
        blueBox = [[UIView alloc] initWithFrame:self.navigationBar.frame];
        blueBox.backgroundColor = [UIColor colorWithRed:0.216f green:0.533f blue:0.984f alpha:1.0];

        [self.navigationBar addSubview:blueBox];
        
        
        
        
        addNewButton = [[UIButton alloc] initWithFrame:CGRectMake(80, (self.navigationBar.frame.size.height - 30)/2, 160, 30)];
        [addNewButton setTitle:@"Add New" forState:UIControlStateNormal];
        addNewButton.backgroundColor = [UIColor whiteColor];
        addNewButton.titleLabel.font = [UIFont systemFontOfSize:12];
        addNewButton.titleLabel.textColor = [UIColor blueColor];
        addNewButton.layer.cornerRadius = 15;
        
        [addNewButton addTarget:self action:@selector(newItem:) forControlEvents:UIControlEventTouchUpInside];
        
        
        [self.navigationBar addSubview:addNewButton];
        
        
        logo = [[UIImageView alloc] initWithFrame:CGRectMake(160 - 87.5, 110, 175, 45)];
        logo.image = [UIImage imageNamed:@"logo"];
        
    }
    return self;
}

-(void)newItem:(UIButton*)sender
{
    [UIView animateWithDuration:0.4 animations:^{blueBox.frame = self.view.frame;
        addNewButton.alpha = 0.0;
    }completion:^(BOOL finished){
        [blueBox addSubview:logo];
        }];
    
    
{   cancel = [[UIButton alloc]initWithFrame:CGRectMake(180, 400, 100, 30)];
    [cancel setTitle:@"Cancel" forState:UIControlStateNormal];
    cancel.titleLabel.font = [UIFont systemFontOfSize:12];
    
    cancel.backgroundColor = [UIColor redColor];
    cancel.layer.cornerRadius = 6;
    [cancel addTarget:self action:@selector(cancelledTweet) forControlEvents:UIControlEventTouchUpInside];
    [blueBox addSubview:cancel];
    
    
    
    submit = [[UIButton alloc]initWithFrame:CGRectMake(40, 400, 100, 30)];
    [submit setTitle:@"Submit" forState:UIControlStateNormal];
    submit.titleLabel.font = [UIFont systemFontOfSize:12];
    
    submit.backgroundColor = [UIColor greenColor];
    submit.layer.cornerRadius = 6;
    //        [submit addTarget:self action:@selector(newUser) forControlEvents:UIControlEventTouchUpInside];
    [blueBox addSubview:submit];

    tweetMessage = [[UITextView alloc] initWithFrame:CGRectMake(60, 210, 200, 75)];
    tweetMessage.textColor = [UIColor blackColor];
    tweetMessage.backgroundColor = [UIColor lightGrayColor];
    tweetMessage.layer.cornerRadius = 6;
    [tweetMessage.layer setBorderColor: [[UIColor darkGrayColor] CGColor]];
    [tweetMessage.layer setBorderWidth: 2.0];
    tweetMessage.keyboardType = UIKeyboardTypeTwitter;
    tweetMessage.delegate = self;
    
    [self.view addSubview:tweetMessage];

    UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapScreen)];
    [self.view addGestureRecognizer:tap];
    

    
}

}

- (void)tapScreen
{
    [tweetMessage resignFirstResponder];
    
    //    [UIView animateWithDuration:0.2 an
}


- (void)canceledTweet
{
    [blueBox removeFromSuperview]; 
    [self.navigationBar addSubview:addNewButton];
}

    
    
//     = [[BBALevelController alloc] initWithNibName:nil bundle:nil];
//    level.delegate = self;
//    level.view.frame = CGRectMake(0, 20, SCREEN_WIDTH, SCREEN_HEIGHT - 20);
//    level.view.backgroundColor = [UIColor blueColor];
//    
//    [self.view addSubview:score];
//    [self.view addSubview:level.view];
//    [level resetLevel];

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
