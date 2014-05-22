//
//  STASmileVC.m
//  Status
//
//  Created by Derek Weber on 5/19/14.
//  Copyright (c) 2014 Derek Weber. All rights reserved.
//

#import "STASmileVC.h"
#import "STASelectVC.h"

@interface STASmileVC ()

@property (nonatomic) NSMutableArray * squares;
@property (nonatomic) NSMutableArray * smilies;

@end

@implementation STASmileVC
{
    UIButton * moveButton2;
    STASelectVC * smileVC;
    UIImageView * chooseSmilie;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self)
    {
        
        self.squares = [@[] mutableCopy];

        moveButton2 = [UIButton buttonWithType:UIButtonTypeCustom];
        [moveButton2 setFrame:CGRectMake(self.view.frame.size.width / 2 - 40, 400, 48, 66)];
        [moveButton2 setImage:[UIImage imageNamed:@"arrow"] forState:UIControlStateNormal];
        [moveButton2 addTarget:self action:@selector(smileView) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:moveButton2];
        
        _smilies = [@[@"smilies_1", @"smilies_2", @"smilies_3", @"smilies_4", @"smilies_5",@"smilies_6",@"smilies_7",@"smilies_8",@"smilies_9"] mutableCopy];
        
        chooseSmilie = [[UIImageView alloc] initWithFrame:CGRectMake(64, 192, 64, 64)];
        [chooseSmilie setImage:[UIImage imageNamed:@"squares"]];

        
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
            [squares addTarget:self action:@selector (chosenSmilie:) forControlEvents:UIControlEventTouchUpInside];
            [squares setImage:[UIImage imageNamed:_smilies[r*3+c]] forState:UIControlStateNormal];
            squares.tag = c*3 + r;
            
            //            squares.backgroundColor = [UIColor blueColor];
            
            
            
            
            [self.view addSubview:squares];
            //            [self.squares addObject:squares];
            
            
        }
    }
}


-(void)chosenSmilie:(UIButton *)sender
{
    UIButton * myBtn = (UIButton *)sender;
    CGPoint location = CGPointMake(sender.frame.origin.x, sender.frame.origin.y);
    chooseSmilie.frame = CGRectMake(location.x - 8, location.y - 8, 64, 64);
    [self.view insertSubview:chooseSmilie atIndex:0];
}

-(void)smileView
{
    smileVC = [[STASelectVC alloc]init];
    [self.navigationController pushViewController:smileVC animated:YES];

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
