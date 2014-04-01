//
//  DWFViewController.h
//  W1D1
//
//  Created by Derek Weber on 3/31/14.
//  Copyright (c) 2014 Derek Weber. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DWFViewController : UIViewController
- (IBAction)redButton:(id)sender;

@property (weak, nonatomic) IBOutlet UILabel *firstLabel;

- (IBAction)blueButton:(id)sender;

@property (weak, nonatomic) IBOutlet UILabel *secondLabel;

@property (weak, nonatomic) IBOutlet UITextField *myTextField;

- (IBAction)greenButton:(id)sender;


@property (weak, nonatomic) IBOutlet UILabel *thirdLabel;
@end
