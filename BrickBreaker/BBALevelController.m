//
//  BBALevelController.m
//  BrickBreaker
//
//  Created by Derek Weber on 4/17/14.
//  Copyright (c) 2014 Derek Weber. All rights reserved.
//

#import "BBALevelController.h"

#import <AVFoundation/AVFoundation.h>

@interface BBALevelController () <UICollisionBehaviorDelegate>

@property(nonatomic) AVAudioPlayer * player;

@property (nonatomic) UIView * paddle;
@property(nonatomic) NSMutableArray * balls;
@property (nonatomic) NSMutableArray * bricks;


// dynamic animator
@property (nonatomic) UIDynamicAnimator * animator;
@property (nonatomic) UIPushBehavior * pusher;
@property (nonatomic) UICollisionBehavior * collider;
@property (nonatomic) UIDynamicItemBehavior * paddleDynamicProperties;
@property (nonatomic) UIDynamicItemBehavior * ballsDynamicProperties;
@property (nonatomic) UIDynamicItemBehavior * bricksDynamicProperties;
@property (nonatomic) UIAttachmentBehavior * attacher;

@end

/////////////////////////////
////////////////////////////



@implementation BBALevelController

{
    float paddleWidth;
    float points;
    int lives;
    
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
        
        self.bricks = [@[] mutableCopy];
        self.balls = [@[] mutableCopy];
        
        paddleWidth = 80;
        
        lives = 3;
        
        
        self.view.backgroundColor = [UIColor colorWithWhite:0.1 alpha:1.0];
        
        UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapScreen:)];
        
        [self.view addGestureRecognizer:tap];
        
        
        
//        UITouch * touch;
//        UIGestureRecognizer * gesture;
       
    }
    return self;
}

- (void)playSoundWithName: (NSString *)soundName
{
    NSString * file = [[NSBundle mainBundle] pathForResource:soundName ofType:@"wav"];
    
    NSURL * url = [[NSURL alloc] initFileURLWithPath:file];
    
    self.player = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
    
    [self.player play];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)resetLevel
{
    self.animator = [[UIDynamicAnimator alloc] initWithReferenceView:self.view];
    
    [self createPaddle];
    [self createBricks];
    
    self.collider = [[UICollisionBehavior alloc] initWithItems:[self allItems]];
    
    self.collider.collisionDelegate = self;
    self.collider.collisionMode = UICollisionBehaviorModeEverything;
//    self.collider.translatesReferenceBoundsIntoBoundary = YES;
    
    [self createBall];
    
    int w = self.view.frame.size.width;
    int h = self.view.frame.size.height;
    
    [self.collider addBoundaryWithIdentifier:@"ceiling" fromPoint:CGPointMake(0, 0) toPoint:CGPointMake(w, 0)];
    [self.collider addBoundaryWithIdentifier:@"leftWall" fromPoint:CGPointMake(0, 0) toPoint:CGPointMake(0, h)];
    [self.collider addBoundaryWithIdentifier:@"rightWall" fromPoint:CGPointMake(w, 0) toPoint:CGPointMake(w, h)];
    [self.collider addBoundaryWithIdentifier:@"floor" fromPoint:CGPointMake(0, h + 10) toPoint:CGPointMake(w,h + 10)];



    [self.animator addBehavior:self.collider];
    
    self.ballsDynamicProperties = [self createPropertiesForItems: self.balls];
    self.bricksDynamicProperties = [self createPropertiesForItems: self.bricks];
    self.paddleDynamicProperties = [self createPropertiesForItems:@[self.paddle]];
    
    self.paddleDynamicProperties.density = 100000000;
    self.bricksDynamicProperties.density = 100000000;
    
    self.ballsDynamicProperties.elasticity = 1.0;
    self.ballsDynamicProperties.resistance = 0.0;
}

-(void)createPaddle
{
    self.paddle = [[UIView alloc]initWithFrame:CGRectMake((SCREEN_WIDTH - paddleWidth) / 2,  SCREEN_HEIGHT - 40, paddleWidth, 6)];
    self.paddle.backgroundColor = [UIColor colorWithWhite:0.5 alpha:1.0];
    self.paddle.layer.cornerRadius = 3;
    [self.view addSubview:self.paddle];
    
    self.attacher = [[UIAttachmentBehavior alloc] initWithItem:self.paddle attachedToAnchor:CGPointMake(CGRectGetMidX(self.paddle.frame), CGRectGetMidY(self.paddle.frame))];
    
    [self.animator addBehavior:self.attacher];
}

-(void)collisionBehavior:(UICollisionBehavior *)behavior beganContactForItem:(id<UIDynamicItem>)item1 withItem:(id<UIDynamicItem>)item2 atPoint:(CGPoint)p
{
    if ([item1 isEqual:self.paddle] || [item2 isEqual:self.paddle]){
         [self playSoundWithName:@"retro_click"];
    }
        
    UIView * tempBrick;
    for (UIView * brick in self.bricks)
    {
        if ([item1 isEqual:brick] || [item2 isEqual:brick])
        {
            if(brick.alpha == 0.5)
            {
                tempBrick = brick;
                
                UILabel * brickLabel = [[UILabel alloc] initWithFrame:CGRectMake(tempBrick.frame.origin.x, tempBrick.frame.origin.y, 100, 30)];
                brickLabel.text = [NSString stringWithFormat:@"+%d", (int)brick.tag];
                brickLabel.backgroundColor = [UIColor clearColor];
                brickLabel.textColor = [UIColor redColor];
                
                [self.view addSubview: brickLabel];
                
                
                
                
                [brick removeFromSuperview];
                [self.collider removeItem:brick];
                
                points += brick.tag;
                [self.delegate addPoints:points];
                
                
//                [brickLabel removeFromSuperview];
//                [self pointLabelWithBrick:brick];
                
                }
            brick.alpha = 0.5;
            
        }
    }
    if(tempBrick != nil)
    {
        [self playSoundWithName:@"electric_alert"];
        
        [self.bricks removeObject:tempBrick];
        
//        if ([self.bricks count] == 0) {
//            
//            [self.delegate gameDone];
//            
//        }
    }
    
    
}

//-(void)pointLabelWithBrick:(UIView *)brick
//{
//    UILabel *pointLabel = [UILabel alloc] initWithFrame:self.view.
//}

-(void)collisionBehavior:(UICollisionBehavior *)behavior beganContactForItem:(id<UIDynamicItem>)item withBoundaryIdentifier:(id<NSCopying>)identifier atPoint:(CGPoint)p

{
    if ([(NSString *) identifier isEqualToString:@"floor"])
        
    {
        UIView * ball = (UIView *)item;
        [ball removeFromSuperview];
        [self.collider removeItem:ball];

        
        lives--;
        
        if (lives > 0)
        {
            
            [self createBall];
        } else {
            if ([self.delegate respondsToSelector:@selector(gameDone)])
            {
                [self.delegate gameDone];
            }

        }

        
    }
}

-(void)pointLabelWithBrick: (UIView *)brick
{
    UILabel * label = [[UILabel alloc] initWithFrame:brick.frame];
    
    label.text = [NSString stringWithFormat:@"+%d", (int)brick.tag];
    label.textColor = [UIColor whiteColor];
    label.textAlignment = NSTextAlignmentCenter;
    label.font = [UIFont fontWithName:@"HelveticaNeue" size:12];
    
    [self.view addSubview:label];
    
    [UIView animateWithDuration:0.4 animations:^{
        label.alpha = 0.0;}
     completion:^(BOOL finished) {
         [label removeFromSuperview];
     }];
    
}

- (UIDynamicItemBehavior *)createPropertiesForItems:(NSArray *)items
{
    UIDynamicItemBehavior * properties = [[UIDynamicItemBehavior alloc] initWithItems:items];
    properties = [[UIDynamicItemBehavior alloc] initWithItems:items];
    properties.allowsRotation = NO;
    properties.friction = 0.0;
    [self.animator addBehavior:properties];
    return properties;
}


- (NSArray *)allItems
{
    NSMutableArray * items = [@[self.paddle] mutableCopy];
    
//    for (UIView * item in self.balls) [items addObject:item];
    for (UIView * item in self.bricks) [items addObject:item];
    
    return items;
}


-(void)createBricks
{
    int brickCols = 4;
    int brickRows = 2;
    
    float brickWidth = (SCREEN_WIDTH - (10 * (brickCols +1))) / brickCols;
    float brickHeight = 20;
    
    for (int c = 0; c < brickCols; c++)
    {
        for (int r = 0; r< brickRows; r++)
        {
            float brickX = ((brickWidth + 10) * c) + 10;
            float brickY = ((brickHeight + 10) * r) + 10;
            UIView * brick = [[UIView alloc] initWithFrame:CGRectMake(brickX, brickY, brickWidth, brickHeight)];
            
//        
//        }
//    }
//    for (int i = 0; i < brickCols; i++)
//    {
//        float brickX = ((brickWidth + 10) * i) + 10;
//        
//        UIView * brick = [[UIView alloc] initWithFrame: CGRectMake(brickX , 10, brickWidth, 30)];
        brick.layer.cornerRadius = 6;
        brick.backgroundColor = [UIColor colorWithWhite: 0.7 alpha: 1.0];
            
            int random = arc4random_uniform(5) * 50;
            brick.tag = random;
            
        
        [self.view addSubview:brick];
        [self.bricks addObject:brick];
        
        
    }
}
}

-(void)createBall
{
    CGRect frame = self.paddle.frame;
    
    UIView * ball = [[UIView alloc] initWithFrame:CGRectMake(frame.origin.x, frame.origin.y - 12, 10, 10)];
    
    ball.backgroundColor = [UIColor whiteColor];
    ball.layer.cornerRadius = 5;
    [self.view addSubview:ball];
    
    [self.balls addObject: ball];
    
    [self.collider addItem:ball];
    [self.ballsDynamicProperties addItem:ball];
    
    self.pusher = [[UIPushBehavior alloc] initWithItems:self.balls mode:UIPushBehaviorModeInstantaneous];
    self.pusher.pushDirection = CGVectorMake(0.015, -0.015);
    self.pusher.active = YES;
    [self.animator addBehavior:self.pusher];
}

-(void)tapScreen:(UIGestureRecognizer *)gr
{
    CGPoint location = [gr locationInView:self.view];
    
    self.attacher.anchorPoint = CGPointMake(location.x, self.attacher.anchorPoint.y);
    
}
@end
