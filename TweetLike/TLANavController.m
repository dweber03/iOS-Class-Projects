//
//  TLANavController.m
//  TweetLike
//
//  Created by Derek Weber on 4/23/14.
//  Copyright (c) 2014 Derek Weber. All rights reserved.
//

#import "TLANavController.h"

#import "TLATableViewController.h"


@interface TLANavController () <UITextViewDelegate>

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
    
    TLATableViewController * TVC;
    
    
}




-(void)viewDidLoad
{
    [super viewDidLoad];
    
    
//    self.navigationBar.barTintColor = [UIColor blueColor];
//    self.navigationBar.translucent = NO;
    
    
    
    blueBox = [[UIView alloc] initWithFrame:self.navigationBar.frame];
    blueBox.backgroundColor = [UIColor colorWithRed:0.216f green:0.533f blue:0.984f alpha:1.0];
    
    [self.view addSubview:blueBox];
    
    newForm = [[UIView alloc] initWithFrame:self.view.frame];
    
    
    
    
    
    
    addNewButton = [[UIButton alloc] initWithFrame:CGRectMake(80, (self.navigationBar.frame.size.height - 30)/2, 160, 30)];
    [addNewButton setTitle:@"Add New" forState:UIControlStateNormal];
    addNewButton.backgroundColor = [UIColor whiteColor];
    addNewButton.titleLabel.font = [UIFont systemFontOfSize:12];
    [addNewButton setTitleColor: [UIColor blueColor] forState:UIControlStateNormal];
    addNewButton.layer.cornerRadius = 15;
    
    [addNewButton addTarget:self action:@selector(newItem:) forControlEvents:UIControlEventTouchUpInside];
    
    
    [blueBox addSubview:addNewButton];
    
    
    logo = [[UIImageView alloc] initWithFrame:CGRectMake(160 - 87.5, 110, 175, 45)];
    logo.image = [UIImage imageNamed:@"logo"];
    
    [newForm addSubview:logo];
    
    cancel = [[UIButton alloc]initWithFrame:CGRectMake(180, 400, 100, 30)];
    [cancel setTitle:@"Cancel" forState:UIControlStateNormal];
    cancel.titleLabel.font = [UIFont systemFontOfSize:12];
    
    cancel.backgroundColor = [UIColor redColor];
    cancel.layer.cornerRadius = 6;
    [cancel addTarget:self action:@selector(cancelTweet) forControlEvents:UIControlEventTouchUpInside];
    [newForm addSubview:cancel];
    
    
    
    submit = [[UIButton alloc]initWithFrame:CGRectMake(40, 400, 100, 30)];
    [submit setTitle:@"Submit" forState:UIControlStateNormal];
    submit.titleLabel.font = [UIFont systemFontOfSize:12];
    
    submit.backgroundColor = [UIColor greenColor];
    submit.layer.cornerRadius = 6;
    [submit addTarget:self action:@selector(saveTweet) forControlEvents:UIControlEventTouchUpInside];
    [newForm addSubview:submit];
    
    tweetMessage = [[UITextView alloc] initWithFrame:CGRectMake(60, 210, 200, 75)];
    tweetMessage.textColor = [UIColor blackColor];
    tweetMessage.backgroundColor = [UIColor lightGrayColor];
    tweetMessage.layer.cornerRadius = 6;
    [tweetMessage.layer setBorderColor: [[UIColor darkGrayColor] CGColor]];
    [tweetMessage.layer setBorderWidth: 2.0];
    tweetMessage.keyboardType = UIKeyboardTypeTwitter;
//    tweetMessage.delegate = self;
    
    [newForm addSubview:tweetMessage];
    
    UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapScreen)];
    [self.view addGestureRecognizer:tap];
    

//    return self;
}






- (void)tapScreen
{
    [tweetMessage resignFirstResponder];
    
    //    [UIView animateWithDuration:0.2 an
}


- (void)cancelTweet
{
    [newForm removeFromSuperview];
    newForm.frame = self.view.frame;
    
    [UIView animateWithDuration:0.4 animations:^{
        blueBox.frame = self.navigationBar.frame;
        addNewButton.alpha = 1.0;
    }];
    
    
}

-(void)saveTweet
{
    if ([tweetMessage.text isEqualToString:@""]) return;
//    
//    [TVC.tweetItems insertObject:@{@"likes":@0,
//                               @"text": tweetMessage.text
//                                } atIndex:0];
//    
//    [TVC.tableView reloadData];
    
    [TVC createNewTweet:tweetMessage.text];
    
    tweetMessage.text = @"";
    
    [self cancelTweet];
}

-(void)newItem:(id)sender
{
    [UIView animateWithDuration:0.4 animations:^{blueBox.frame = self.view.frame;
        addNewButton.alpha = 0.0;
    }completion:^(BOOL finished){
        [blueBox addSubview:newForm];
    }];
    
}


-(BOOL)textViewShouldBeginEditing:(UITextView *)textView
{
    [UIView animateWithDuration:0.4 animations:^{
        
        newForm.frame = CGRectMake(0, -216 / 2, self.view.frame.size.width, self.view.frame.size.height);
        
    }];
    return YES;
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)addTableViewController:(TLATableViewController *)viewController
{
    TVC = viewController;
    
    [self pushViewController:viewController animated:NO];
    
    if ([TVC isTweetItemsEmpty])
    {
        [self newItem:nil]; 
    }
    
}
//- (void)addInitialViewController:(TLATableViewController *)viewController
//{
//    [super pushViewController:viewController animated:NO];
//
//    TVC = viewController;
//
//}
/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
 {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

- (BOOL)prefersStatusBarHidden
{
    return YES;
}

@end
