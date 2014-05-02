//
//  PLAFilterController.h
//  PullaPic
//
//  Created by Derek Weber on 5/1/14.
//  Copyright (c) 2014 Derek Weber. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol PLAFilterControllerDelegate;

@interface PLAFilterController : UIViewController

@property (nonatomic, assign) id<PLAFilterControllerDelegate> delegate;

@property (nonatomic) UIImage * imageToFilter;

@end

@protocol PLAFilterControllerDelegate <NSObject>

-(void)updateCurrentImageWithFilteredImage: (UIImage *)image;

@end

