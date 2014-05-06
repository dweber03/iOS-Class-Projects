//
//  PNAWorldViewController.m
//  PixelNOise
//
//  Created by Derek Weber on 5/5/14.
//  Copyright (c) 2014 Derek Weber. All rights reserved.
//

#import "PNAWorldViewController.h"
#import <AVFoundation/AVFoundation.h>


@interface PNAWorldViewController () <UICollisionBehaviorDelegate>

@property(nonatomic) AVAudioPlayer * player;


@property (nonatomic) UIView * square;
@property (nonatomic) UIDynamicAnimator * animator;
@property (nonatomic) UICollisionBehavior * collider;
@property(nonatomic) NSMutableArray * squares;

@end

@implementation PNAWorldViewController
{
//    UIView * square;
    
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self)
    
    {
        
        
//        UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapScreen:)];
//        
//        [self.view addGestureRecognizer:tap];
        
        
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
    
    
    
    
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch * touch = [touches allObjects][0];
    
    CGPoint location = [touch locationInView:self.view];
    
    int w = self.view.frame.size.width;
    int h = self.view.frame.size.height;
    
    UIView * square = [[UIView alloc] initWithFrame:CGRectMake(location.x, location.y, 10, 10)];
    
    square.backgroundColor = [UIColor whiteColor];
    
    [self.view addSubview:square];
    
    UIDynamicAnimator *animator = [[UIDynamicAnimator alloc] initWithReferenceView:self.view];
    UIGravityBehavior *gravityBehavior = [[UIGravityBehavior alloc] initWithItems:@[square]];
    UICollisionBehavior * collider = [[UICollisionBehavior alloc] initWithItems:@[square]];
    [collider addBoundaryWithIdentifier:@"floor" fromPoint:CGPointMake(0, h + 10) toPoint:CGPointMake(w,h + 10)];
    
    collider.collisionDelegate = self;
    
    
    
    
    [animator addBehavior:gravityBehavior];
    [animator addBehavior:collider];
    
    self.animator = animator;

}

-(void)collisionBehavior:(UICollisionBehavior *)behavior beganContactForItem:(id<UIDynamicItem>)item withBoundaryIdentifier:(id<NSCopying>)identifier atPoint:(CGPoint)p

{   if ([(NSString *) identifier isEqualToString:@"floor"])
    
    [self playSoundWithName:@"electric_alert"];
    
    {
        UIView * square = (UIView *)item;
//        [square removeFromSuperview];
        [self.collider removeItem:square];
    }
}
//-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
//{
//    
//    UITouch * touch = [touches allObjects][0];
//
//    CGPoint location = [touch locationInView:self.view];
//    
//    
//    UIView * square = [[UIView alloc] initWithFrame:CGRectMake(location.x, location.y, 10, 10)];
//    
//    square.backgroundColor = [UIColor whiteColor];
//    
//    [self.view addSubview:square];
//
//    UIDynamicAnimator *animator = [[UIDynamicAnimator alloc] initWithReferenceView:self.view];
//    UIGravityBehavior *gravityBehavior = [[UIGravityBehavior alloc] initWithItems:@[square]];
//    UICollisionBehavior * collider = [[UICollisionBehavior alloc] initWithItems:@[square]];
//    collider.translatesReferenceBoundsIntoBoundary = YES;
//    
//    
//    
//    [animator addBehavior:gravityBehavior];
//    [animator addBehavior:collider];
//    
//    self.animator = animator;
//
//}
//





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
