//
//  DLAViewController.m
//  DrawLinesApp
//
//  Created by Derek Weber on 4/15/14.
//  Copyright (c) 2014 Derek Weber. All rights reserved.
//

#import "DLAViewController.h"

#import "DLAStageLines.h"

#import "DLAStageScribble.h"

@interface DLAViewController ()

@end

@implementation DLAViewController
{
    //    UIButton * colorButton;
    DLAStageScribble * scribbleView;
    
    UIView * colorDrawer;
    
    float lineWidth;
    UIColor * lineColor;
    
   
    
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        
        //        self.view = [[DLAStageLines alloc] initWithFrame:self.view.frame];
        //        self.view = [[DLAStageScribble alloc] initWithFrame:self.view.frame];
        
        
    }
    return self;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    
//    scribbleView = [[DLAStageLines alloc] initWithFrame:self.view.frame];
    
    //    scribbleView.lineColor = [UIColor blueColor];
    
    lineColor = [UIColor colorWithRed:0.251f green:0.251f blue:0.251f alpha:1.0f];
    lineWidth = 5.0;

    [self toggleStage];
    
    [self.view addSubview:scribbleView];
    
    UISlider *slider = [[UISlider alloc] initWithFrame:CGRectMake(20, SCREEN_HEIGHT - 60, 280, 40)];
    slider.transform = CGAffineTransformMakeRotation(-90 * M_PI / 180);
    slider.frame = CGRectMake(SCREEN_WIDTH - 43, SCREEN_HEIGHT - 300, 23, 280);
    slider.maximumValue = 20.0;
    slider.minimumValue = 2.0;
    
    slider.value = lineWidth;
    
    [slider addTarget:self action:@selector(changeSize:) forControlEvents:UIControlEventAllEvents];
    
    [self.view addSubview:slider];
    
    colorDrawer = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 40)];
    
    NSArray * colors = @[
                         [UIColor colorWithRed:0.251f green:0.251f blue:0.251f alpha:1.0f],
                         [UIColor colorWithRed:0.008f green:0.353f blue:0.431f alpha:1.0f],
                         [UIColor colorWithRed:0.016f green:0.604f blue:0.671f alpha:1.0f],
                         [UIColor colorWithRed:1.000f green:0.988f blue:0.910f alpha:1.0f],
                         [UIColor colorWithRed:1.000f green:0.298f blue:0.153f alpha:1.0f],
                         ];
    
    float buttonWidth = SCREEN_WIDTH / [colors count];
    
    for (UIColor * color in colors)
    {
        int index = [colors indexOfObject:color];
        
        UIButton * button = [[UIButton alloc] initWithFrame:CGRectMake(buttonWidth * index, 0, buttonWidth, 40)];
        button.backgroundColor = color;
        
        [button addTarget:self action:@selector(changeColor:) forControlEvents:UIControlEventTouchUpInside];
        [colorDrawer addSubview:button];
        [self.view addSubview:colorDrawer];
    }
    
    
    
    UIButton * toggleButton = [[UIButton alloc]initWithFrame:CGRectMake(10, 50, 50, 50)];
    toggleButton.backgroundColor = [UIColor orangeColor];
    [toggleButton addTarget:self action:@selector(toggleStage) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:toggleButton];
    

    
    UIButton * undoButton = [[UIButton alloc]initWithFrame:CGRectMake(SCREEN_WIDTH - 120, 50, 50, 50)];
    undoButton.backgroundColor = [UIColor lightGrayColor];
    [undoButton addTarget:self action:@selector(undoStage) forControlEvents:UIControlEventTouchUpInside];
    [undoButton setTitle:@"undo" forState:UIControlStateNormal];
    [self.view addSubview:undoButton];
    

    UIButton * clearButton = [[UIButton alloc]initWithFrame:CGRectMake(SCREEN_WIDTH - 60, 50, 50, 50)];
    clearButton.backgroundColor = [UIColor redColor];
    [clearButton addTarget:self action:@selector(clearStage) forControlEvents:UIControlEventTouchUpInside];
    [clearButton setImage:[UIImage imageNamed:@"Delete"] forState:UIControlStateNormal];
    
    [self.view addSubview:clearButton];
}

-(void) undoStage
{
    [scribbleView undoStage];
}

-(void) clearStage
{
    [scribbleView clearStage];
}

- (void) toggleStage
{
    NSMutableArray * lines = scribbleView.lines;
    
    [scribbleView removeFromSuperview];
    
    if ([scribbleView isMemberOfClass:[DLAStageScribble class]])
    {
        scribbleView = [[DLAStageLines alloc] initWithFrame:self.view.frame];
    } else {
        scribbleView = [[DLAStageScribble alloc]initWithFrame:self.view.frame];
    }
    
    scribbleView.lineWidth = lineWidth;
    scribbleView.lineColor = lineColor;
    
    if(lines != nil) scribbleView.lines = lines; 
    
    [self.view insertSubview:scribbleView atIndex:0];
    
}

-(void)changeSize:(UISlider *)sender
{
    lineWidth = sender.value;

    scribbleView.lineWidth = lineWidth;
    
}

- (void) changeColor: (UIButton *)sender
{
    lineColor = sender.backgroundColor;

    scribbleView.lineColor = lineColor;
}

- (BOOL) prefersStatusBarHidden {return YES; }




@end
