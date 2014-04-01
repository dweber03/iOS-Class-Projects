//
//  DWFUIView.m
//  Day 2 Iron Yard
//
//  Created by Derek Weber on 4/1/14.
//  Copyright (c) 2014 Derek Weber. All rights reserved.
//

#import "DWFUIView.h"

@implementation DWFUIView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

+ (NSNumber *)randomNumber
{
    NSNumber *num = [NSNumber numberWithInt:0];
    
    num = @5;
    
    return num;
}

- (NSString *)whatIsMyTitle
{ return self.uiView;
}

- (void)changeTitleWithName:(NSString *)name andSomething:(NSString *)something

{
    self.uiView = [NSString stringWithFormat:@"%@ %@", name, something];
}


@end
