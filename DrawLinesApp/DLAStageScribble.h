//
//  DLAStageScribble.h
//  DrawLinesApp
//
//  Created by Derek Weber on 4/15/14.
//  Copyright (c) 2014 Derek Weber. All rights reserved.
//

#import <UIKit/UIKit.h>


@protocol DLAStageDelegate;


@interface DLAStageScribble : UIView

@property (nonatomic) float lineWidth;
@property (nonatomic) UIColor * lineColor;
@property (nonatomic) NSMutableArray * lines; 

-(void) clearStage;
-(void) undoStage;

//@property (nonatomic) UIButton * newColor;


@end
