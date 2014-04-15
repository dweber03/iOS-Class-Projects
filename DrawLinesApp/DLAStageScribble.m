//
//  DLAStageScribble.m
//  DrawLinesApp
//
//  Created by Derek Weber on 4/15/14.
//  Copyright (c) 2014 Derek Weber. All rights reserved.
//

#import "DLAStageScribble.h"

@implementation DLAStageScribble
{
    NSMutableArray * scribbles;
    
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        
        
        self.lineWidth = 2.0;
        self.lineColor = [UIColor colorWithWhite:0.3 alpha:1.0];
        self.backgroundColor = [UIColor whiteColor];
        
        scribbles = [@[] mutableCopy];
        
//        self.newColor= [[UIButton alloc] initWithFrame:CGRectMake(self.frame.size.width - 50, 10, 20, 20)];
//        self.newColor.layer.cornerRadius = 10;
//        self.newColor.backgroundColor = [UIColor whiteColor];
//        [self.bgView addSubview:self.newColor];

    }
    return self;
}

-(void)createButtons
{
    
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetLineCap(context, kCGLineCapRound);
    CGContextSetLineWidth(context, self.lineWidth);
    [(self.lineColor) set];
    
    for (NSDictionary * scribble in scribbles)
    {
        CGContextSetLineWidth(context, [scribble[@"width"] floatValue]);
        [(UIColor *)scribble[@"color"]set];
        
        NSArray * points = scribble[@"points"];
        

        CGPoint start = [points[0] CGPointValue];
        CGContextMoveToPoint(context, start.x, start.y);
        
        for (NSValue * value in points)
        {
//            int index = [scribble indexOfObject:value]; 
            
            CGPoint point = [value CGPointValue];
            CGContextAddLineToPoint(context, point.x, point.y);
            
            
            
        }
        
        CGContextStrokePath(context);
    }
    
}
- (void)setLineWidth:(float)lineWidth
{
    _lineWidth = lineWidth;
    
    [self setNeedsDisplay];
    
}

-(void)setLineColor:(UIColor *)lineColor
{
    _lineColor = lineColor;
    
    [self setNeedsDisplay];
    
}
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event;
{
    for (UITouch * touch in touches)
    {
        CGPoint location = [touch locationInView:self];
        
//        [scribbles addObject:[@[
//                                NSValue valueWithCGPoint:location] mutableCopy]];
        
        
        [scribbles addObject:[@{
                                @"color" : self.lineColor,
                                @"width" : @(self.lineWidth),
                                @"points" : [@[[NSValue valueWithCGPoint:location]] mutableCopy]}
                                 mutableCopy]];
    }
    [self setNeedsDisplay];
}


- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event;
{
    for (UITouch * touch in touches)
    {
        CGPoint location = [touch locationInView:self];
        
//        [[scribbles lastObject] addObject:[NSValue valueWithCGPoint:location]];
        
        [[scribbles lastObject][@"points"] addObject:[NSValue valueWithCGPoint:location]];
        
        
    }
    [self setNeedsDisplay];
}
-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    for (UITouch * touch in touches)
    {
        CGPoint location = [touch locationInView:self];
        
        [[scribbles lastObject][@"points"] addObject: [NSValue valueWithCGPoint:location]];
        
    }
//    [self setNeedsDisplay];
    
}

//-(void)setLineColor:(UIColor *)lineColor
//{
//    _lineColor = lineColor;
//}


@end
