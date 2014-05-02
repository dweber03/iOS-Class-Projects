//
//  TLANavController.h
//  TweetLike
//
//  Created by Derek Weber on 4/23/14.
//  Copyright (c) 2014 Derek Weber. All rights reserved.
//

#import <UIKit/UIKit.h>

@class TLATableViewController;


@interface TLANavController : UINavigationController 

- (void)addTableViewController: (TLATableViewController *)viewController;


@end
