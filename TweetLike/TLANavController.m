//
//  TLANavController.m
//  TweetLike
//
//  Created by Derek Weber on 4/23/14.
//  Copyright (c) 2014 Derek Weber. All rights reserved.
//

#import "TLANavController.h"

@interface TLANavController ()

@end

@implementation TLANavController
{
    UIButton * addNewButton;
    
}

- (id)initWithRootViewController:(UIViewController *)rootViewController
{
    self = [super initWithRootViewController:rootViewController];
    if (self)
    {
        self.navigationBar.barTintColor = [UIColor blueColor];
        self.navigationBar.translucent = NO;
        
        addNewButton = [[UIButton alloc] initWithFrame:CGRectMake(80, (self.navigationBar.frame.size.height - 30)/2, 160, 30)];
        [addNewButton setTitle:@"Add New" forState:UIControlStateNormal];
        addNewButton.backgroundColor = [UIColor whiteColor];
        addNewButton.titleLabel.font = [UIFont systemFontOfSize:12];
        addNewButton.titleLabel.textColor = [UIColor blueColor];
        addNewButton.layer.cornerRadius = 15;
        
        [self.navigationBar addSubview:addNewButton];
        

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
