//
//  DWFViewController.m
//  W1D1
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
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)redButton:(id)sender {
    self.firstLabel.text = @"Run";
    
}

- (IBAction)blueButton:(id)sender {
    self.secondLabel.text = self.myTextField.text;
    self.secondLabel.textColor = [UIColor redColor];
    
}


- (IBAction)myTextField:(UITextField *)sender {
}

- (IBAction)greenButton:(id)sender {
    
    self.thirdLabel.text = @"Go";
    
    
}




@end
