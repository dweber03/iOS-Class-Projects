//
//  TDLTableViewCell.m
//  ToDo2
//
//  Created by Derek Weber on 4/8/14.
//  Copyright (c) 2014 Derek Weber. All rights reserved.
//

#import "TDLTableViewCell.h"
#import "MOVE.h"

@implementation TDLTableViewCell

{
    UIButton * lowButton;
    UIButton * medButton;
    UIButton * highButton;
}


- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        self.bgView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width - 20, 40)];
        self.bgView.layer.cornerRadius = 6;
        [self.contentView addSubview:self.bgView]; 
        
        self.nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 5, 260 , 30)];
        self.nameLabel.textColor = [UIColor whiteColor];
        self.nameLabel.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:20];
        [self.bgView addSubview:self.nameLabel];
        
        
        
        self.strikeThrough = [[UIView alloc] initWithFrame:CGRectMake(5, 22, self.frame.size.width - 30, 1)];
        self.strikeThrough.backgroundColor = [UIColor whiteColor];
        self.strikeThrough.alpha = 0;
        [self.bgView addSubview:self.strikeThrough];
        
        self.circleButton = [[UIButton alloc] initWithFrame:CGRectMake(self.frame.size.width - 50, 10, 20, 20)];
        self.circleButton.layer.cornerRadius = 10;
        self.circleButton.backgroundColor = [UIColor whiteColor];
        [self.bgView addSubview:self.circleButton];
        
        
        
        
    }
    return self;
}

-(void) resetLayout
{
//    if (self.swiped)
//        
//    {[self createButtons];
//        self.swiped = YES;
//    } else {self.bgView.frame = CGRectMake(10, 0, self.frame.size.width - 20, 40);
//    [lowButton removeFromSuperview];
//    [medButton removeFromSuperview];
//    [highButton removeFromSuperview];
//    self.swiped = NO;



    self.bgView.frame = CGRectMake(10, 0, self.frame.size.width - 20, 40);
    [lowButton removeFromSuperview];
    [medButton removeFromSuperview];
    [highButton removeFromSuperview];
    self.swiped = NO; 
}

-(void)createButtons
    
{
    lowButton = [[UIButton alloc] initWithFrame:CGRectMake(180, 0, 40, 40)];
    lowButton.tag = 1;
    lowButton.alpha = 0;
    lowButton.backgroundColor = [UIColor yellowColor];
    lowButton.layer.cornerRadius = 20;
    [lowButton addTarget:self action:@selector(pressPriorityButton:) forControlEvents:UIControlEventTouchUpInside];
    [self.contentView addSubview:lowButton];
    
    medButton = [[UIButton alloc] initWithFrame:CGRectMake(225, 0, 40, 40)];
    medButton.tag = 2;
    medButton.alpha = 0;
    medButton.backgroundColor = [UIColor orangeColor];
    medButton.layer.cornerRadius = 20;
    [medButton addTarget:self action:@selector(pressPriorityButton:) forControlEvents:UIControlEventTouchUpInside];
    [self.contentView addSubview:medButton];
    
    highButton = [[UIButton alloc] initWithFrame:CGRectMake(270, 0, 40, 40)];
    highButton.tag = 3;
    highButton.alpha = 0;
    highButton.backgroundColor = [UIColor redColor];
    highButton.layer.cornerRadius = 20;
    [highButton addTarget:self action:@selector(pressPriorityButton:) forControlEvents:UIControlEventTouchUpInside];
    [self.contentView addSubview:highButton];
}

-(void) pressPriorityButton:(id)sender
{
    UIButton * button = (UIButton *) sender;
    [self.delegate setItemPriority:(int)button.tag withItem:self];
    
}

-(void)showCircleButtons
{
    [self createButtons];
    
    [MOVE animateView:lowButton properties:@{@"alpha": @1, @"duration": @.2, @"delay":@0.3}];
    [MOVE animateView:medButton properties:@{@"alpha": @1, @"duration": @.2, @"delay":@0.2}];
    [MOVE animateView:highButton properties:@{@"alpha": @1, @"duration": @.2, @"delay":@0.1}];
    
}

-(void)hideCircleButtons
{
    [MOVE animateView:lowButton properties:@{@"alpha": @0, @"duration": @.2, @"delay":@0.0, @"remove": @YES}];
    [MOVE animateView:medButton properties:@{@"alpha": @0, @"duration": @.2, @"delay":@0.1, @"remove": @YES}];
    [MOVE animateView:highButton properties:@{@"alpha": @0, @"duration": @.2, @"delay":@0.2, @"remove": @YES}];
}

-(void) showDeleteButton
{
    highButton = [[UIButton alloc] initWithFrame:CGRectMake(270, 0, 40, 40)];
    highButton.tag = 3;
    highButton.alpha = 0;
    highButton.backgroundColor = [UIColor redColor];
    highButton.layer.cornerRadius = 20;
    [highButton setTitle:@"X" forState:UIControlStateNormal];
    highButton.titleLabel.font = [UIFont fontWithName:@"HelveticNeue-Ultralight" size:30];
    [highButton addTarget:self action:@selector(pressDeleteButton) forControlEvents:UIControlEventTouchUpInside];
    [self.contentView addSubview:highButton];
    [MOVE animateView:highButton properties:@{@"alpha": @1, @"duration": @.2, @"delay":@0.1}];
}

-(void)pressDeleteButton
{
    [self.delegate deleteItem:self]; 
}

-(void) hideDeleteButton
{
    [MOVE animateView:highButton properties:@{@"alpha": @0, @"duration": @.2, @"delay":@0.2, @"remove": @YES}];
}
- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
