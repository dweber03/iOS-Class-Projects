//
//  STAVC.m
//  Status
//
//  Created by Derek Weber on 5/19/14.
//  Copyright (c) 2014 Derek Weber. All rights reserved.
//

#import "STAVC.h"
#import "STASmileVC.h"


@interface STAVC ()

@property (nonatomic) NSMutableArray * squares;
@property (nonatomic) NSMutableArray* colors;



@end

@implementation STAVC
{
    UIButton * moveButton1;
    
    STASmileVC * smileView;
    UIImageView * chooseColor;
    

}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self)
    {
        self.squares = [@[] mutableCopy];
        
        _colors = [@[@"colors_1", @"colors_2", @"colors_3", @"colors_4", @"colors_5",@"colors_6", @"colors_7", @"colors_8", @"colors_9"] mutableCopy];
        
        moveButton1 = [UIButton buttonWithType:UIButtonTypeCustom];
        [moveButton1 setFrame:CGRectMake(self.view.frame.size.width / 2 - 50, 350, 48, 66)];
        [moveButton1 setImage:[UIImage imageNamed:@"arrow"] forState:UIControlStateNormal];
        [moveButton1 addTarget:self action:@selector(launchSmiley) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:moveButton1];
        
        chooseColor = [[UIImageView alloc] initWithFrame:CGRectMake(64, 192, 64, 64)];
        [chooseColor setImage:[UIImage imageNamed:@"squares"]];
        
        [self createSquares];
        
    }
    return self;
    
    
}

-(void)createSquares
{
    int squaresCols = 3;
    int squaresRows = 3;
    
    float width = 64;
    float height = 64;
    
    for (int c = 0; c < squaresCols; c++)
    {
        for (int r = 0; r < squaresRows; r++)
        {
            float squareX = ((width * c) + 64);
            float squareY = ((height * r) + 128);
            UIButton * squares = [[UIButton alloc] initWithFrame:CGRectMake(squareX + 8, squareY + 8, width - 16, height -16)];
            [squares addTarget:self action:@selector(chosenColor:) forControlEvents:UIControlEventTouchUpInside];
            [squares setImage:[UIImage imageNamed:_colors[r*3+c]] forState:UIControlStateNormal];
            squares.tag = c*3 + r;
            
//            squares.backgroundColor = [UIColor blueColor];
            

            
            
            [self.view addSubview:squares];
//            [self.squares addObject:squares];
            
            
        }
    }
}

-(void)chosenColor:(UIButton *)sender
{
    UIButton * myBtn = (UIButton *)sender;
    CGPoint location = CGPointMake(sender.frame.origin.x, sender.frame.origin.y);
    chooseColor.frame = CGRectMake(location.x - 8, location.y - 8, 64, 64);
    [self.view insertSubview:chooseColor atIndex:0];
    
    
}

-(void)launchSmiley
{
    smileView = [[STASmileVC alloc] init];
    [self.navigationController pushViewController:smileView animated:YES];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
