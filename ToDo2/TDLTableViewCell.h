//
//  TDLTableViewCell.h
//  ToDo2
//
//  Created by Derek Weber on 4/8/14.
//  Copyright (c) 2014 Derek Weber. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol TDLTableViewCellDelegate;

@interface TDLTableViewCell : UITableViewCell

@property (nonatomic,assign) id<TDLTableViewCellDelegate> delegate;

@property (nonatomic) UILabel * nameLabel;
@property (nonatomic) UIView * bgView;
@property (nonatomic) UIView * strikeThrough;
@property (nonatomic) UIButton * circleButton;

@property (nonatomic) BOOL swiped;

-(void) resetLayout; 

-(void)showCircleButtons;
-(void) hideCircleButtons;

-(void)showDeleteButton;
-(void)hideDeleteButton;

@end

@protocol TDLTableViewCellDelegate <NSObject>

-(void)deleteItem: (TDLTableViewCell *)cell;
-(void)setItemPriority: (int)priority withItem: (TDLTableViewCell *)cell;

@optional

-(void)optionalMethod;


@end

