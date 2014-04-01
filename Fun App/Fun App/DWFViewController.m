//
//  DWFViewController.m
//  Fun App
//
//  Created by Derek Weber on 3/31/14.
//  Copyright (c) 2014 Derek Weber. All rights reserved.
//

#import "DWFViewController.h"

@interface DWFViewController ()

@end

@implementation DWFViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)buttonPressed:(id)sender {
    
    self.myLabel.text = @"Derek";

}
@end
