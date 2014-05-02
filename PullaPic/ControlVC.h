//
//  ControlVC.h
//  
//
//  Created by Derek Weber on 5/2/14.
//
//

#import <UIKit/UIKit.h>

@protocol ControlVCDelegate;

@interface ControlVC : UIViewController

@property (nonatomic, assign) id<ControlVCDelegate> delegate;

@property (nonatomic) UIImage * imageToFilter;

@end

@protocol ControlVCDelegate <NSObject>

-(void)updateCurrentImageWithFilteredImage: (UIImage *)image;

-(void)selectFilter: (UIButton *) button;

-(void)selecthsb: (UIButton *) button;

-(void)selectblur: (UIButton *) button;


@end
