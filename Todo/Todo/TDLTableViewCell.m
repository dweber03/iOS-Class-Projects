//
//  TDLTableViewCell.m
//  Todo
//
//  Created by Derek Weber on 4/3/14.
//  Copyright (c) 2014 Derek Weber. All rights reserved.
//

#import "TDLTableViewCell.h"

@implementation TDLTableViewCell


- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    
    {
        
    }
    return self;
}



- (void)setProfileInfo:(NSDictionary *)profileInfo

{
    UIImageView * imageView = [[UIImageView alloc] initWithFrame:CGRectMake(20, 20, 60, 60)];
    
    imageView.image = profileInfo[@"image"];
    imageView.layer.cornerRadius = 30;
    imageView.layer.masksToBounds = YES;
                                                                 
    [self.contentView addSubview:imageView];
    _profileInfo = profileInfo;
}

-(void) awakeFromNib
{
    
}



@end
