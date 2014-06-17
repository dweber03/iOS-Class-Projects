//
//  WTFAnimal.m
//  Why Tests Fail
//
//  Created by Derek Weber on 6/17/14.
//  Copyright (c) 2014 Derek Weber. All rights reserved.
//

#import "WTFAnimal.h"

@implementation WTFAnimal

- (void)setAmountOfLegs:(int)amountOfLegs
{
    _amountOfLegs = amountOfLegs;
    
    self.crawling = (amountOfLegs >2);
    
}

@end
