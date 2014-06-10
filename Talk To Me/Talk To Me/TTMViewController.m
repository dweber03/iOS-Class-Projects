//
//  TTMViewController.m
//  Talk To Me
//
//  Created by Derek Weber on 6/9/14.
//  Copyright (c) 2014 Derek Weber. All rights reserved.
//

#import "TTMViewController.h"

#import <Parse/Parse.h>

@interface TTMViewController ()

@end

@implementation TTMViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self)
    {
        // CREATE A CHANNEL
        PFInstallation * currentInstallation = [PFInstallation currentInstallation];
        [currentInstallation addUniqueObject:@"Braves" forKey:@"channels"];
        [currentInstallation saveInBackground];
        
        // PUSH TO CHANNEL
        PFPush * push = [[PFPush alloc]init];
        [push setChannel:@"Braves"];
        [push setMessage:@"Braves Win"];
        [push sendPushInBackground];
        
        // PUSH BASED ON A QUERY
        PFQuery * query = [PFQuery queryWithClassName:@"User"];
        [query whereKey:@"age" equalTo:(20)];
        
        
        PFPush * pushWithQuery = [[PFPush alloc]init];
        [pushWithQuery setQuery:query];
        [pushWithQuery setMessage:@"Beer is Awesome"];
        [pushWithQuery sendPushInBackground];
        
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

@end
