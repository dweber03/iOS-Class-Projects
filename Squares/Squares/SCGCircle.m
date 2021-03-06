//
//  SCGCircle.m
//  Squares
//
//  Created by Derek Weber on 4/11/14.
//  Copyright (c) 2014 Derek Weber. All rights reserved.
//

#import "SCGCircle.h"

@implementation SCGCircle
{
    UIColor * dotColor;
    float dotWidth;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        
        self.backgroundColor = [UIColor clearColor];
        
        dotColor = [UIColor colorWithRed:0.8 green: 0.1 blue: 0.1  alpha:0.5];
        dotWidth= frame.size.width / 5;
    }
    return self;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.


- (void)drawRect:(CGRect)rect
{
    // Drawing code
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    [dotColor set];
    float dotXY = (self.frame.size.width - dotWidth) / 2;
    CGContextAddEllipseInRect(context, CGRectMake(dotXY, dotXY, dotWidth, dotWidth));
    CGContextFillPath(context);
    
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{

//    asks for color from VC while giving the position of tapped circle
    dotColor = [self.delegate circleTappedWithPosition:self.position];
    
//    redraws layer with the -drawRect method above 
    [self setNeedsDisplay];
    NSLog(@"my postition is col %d, row %d", (int)self.position.x, (int)self.position.y);
}

@end
