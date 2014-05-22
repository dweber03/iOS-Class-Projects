//
//  TPAViewController.m
//  TwitterPost
//
//  Created by Derek Weber on 5/20/14.
//  Copyright (c) 2014 Derek Weber. All rights reserved.
//

#import "TPAViewController.h"
#import "STTwitter.h"

@interface TPAViewController ()

@end

@implementation TPAViewController
{
    STTwitterAPI * twitter;
    
    UITextField * tweetField;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self)
    
    {
        twitter = [STTwitterAPI twitterAPIOSWithFirstAccount];
        
        [twitter verifyCredentialsWithSuccessBlock:^(NSString *username)
        {
            NSLog(@"%@", username);
        } errorBlock:^(NSError *error)
        {
            NSLog(@"%@", error.userInfo);
        }];

    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    int w = [UIScreen mainScreen].bounds.size.width;
    int h = [UIScreen mainScreen].bounds.size.height;
    
    tweetField = [[UITextField alloc]initWithFrame: CGRectMake(20, 20, w - 40, h - 296)];
    
    [self.view addSubview:tweetField];
    UIButton * tweetButton = [[UIButton alloc] initWithFrame:CGRectMake(0, h - 276, w, 40)];
    
    tweetButton.backgroundColor = [UIColor colorWithRed:0.208f green:0.710f blue:0.843f alpha:1.0f];
    [tweetButton setTitle:@"Tweet" forState:UIControlStateNormal];
    [tweetButton addTarget:self action:@selector(postTweet) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:tweetButton];
    
}

-(void)postTweet
{
    [twitter postStatusUpdate:tweetField.text inReplyToStatusID:nil latitude:nil longitude:nil placeID:nil displayCoordinates:nil trimUser:nil successBlock:^(NSDictionary *status) {
        NSLog(@"%@", status);
    } errorBlock:^(NSError *error) {
        NSLog(@"%@",error.userInfo);
    }];
    
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
