//
//  TDLTableViewCell.m
//  Todo
//
//  Created by Derek Weber on 4/3/14.
//  Copyright (c) 2014 Derek Weber. All rights reserved.
//

#import "TDLTableViewCell.h"
#import "TDLSingleton.h"

@implementation TDLTableViewCell
{
    UIImageView * profileImage;
    UILabel * profileName;
    UILabel * profileURL;
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    
    {
        profileImage = [[UIImageView alloc] initWithFrame:CGRectMake(20, 20, 60, 60)];
        
        profileImage.layer.cornerRadius = 30;
        profileImage.layer.masksToBounds = YES;
        
        [self.contentView addSubview:profileImage];
        
        profileName = [[UILabel alloc] initWithFrame:CGRectMake(100, 20, 200,30)];
        
        profileName.textColor = [UIColor darkGrayColor];
        profileName.font = [UIFont systemFontOfSize:30];
        
        [self.contentView addSubview:profileName];
        
        profileURL = [[UILabel alloc] initWithFrame:CGRectMake(100, 50, 200,30)];
        
        profileURL.textColor = [UIColor lightGrayColor];
        profileURL.font = [UIFont systemFontOfSize:16];
        
        [self.contentView addSubview:profileURL];



    }
    return self;
}

-(void)setIndex:(NSInteger)index
{
    _index = index;
    
    NSDictionary * profileInfo = [[TDLSingleton sharedSingleton] allListItems][index];
    
    
    NSData * imageData = [NSData dataWithContentsOfURL:[NSURL URLWithString:profileInfo[@"image"]]];
    UIImage * image = [UIImage imageWithData:imageData];
    
    profileImage.image = image;
    
    profileName.text = profileInfo[@"name"];
    profileURL.text = profileInfo[@"github"];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}


@end
