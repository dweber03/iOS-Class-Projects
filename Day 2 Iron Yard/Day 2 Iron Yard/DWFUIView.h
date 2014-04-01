//
//  DWFUIView.h
//  Day 2 Iron Yard
//
//  Created by Derek Weber on 4/1/14.
//  Copyright (c) 2014 Derek Weber. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DWFUIView : UIView

@property (nonatomic) NSString *uiView;

+ (NSNumber *)randomNumber;

- (NSString *)whatIsMyTitle;
- (void)changeTitleWithName:(NSString *)name andSomething:(NSString *)something; 

@end
