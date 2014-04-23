//
//  TLATableViewCell.m
//  TweetLike
//
//  Created by Derek Weber on 4/23/14.
//  Copyright (c) 2014 Derek Weber. All rights reserved.
//

#import "TLATableViewCell.h"

@implementation TLATableViewCell
{
    
UILabel * likesLabel;
UILabel * textLabel;
    
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        UIImageView * heart = [[UIImageView alloc] initWithFrame:CGRectMake(20, 30, 20, 20)];
        heart.image = [UIImage imageNamed:@"heart"];
        
        [self.contentView addSubview:heart];
        
        
        likesLabel = [[UILabel alloc] initWithFrame:CGRectMake(40, 30, 60, 20)];
        
        likesLabel.text = @"1000";
        likesLabel.textAlignment = NSTextAlignmentCenter;
        
        [self.contentView addSubview:likesLabel];
        
        textLabel = [[UILabel alloc] initWithFrame:CGRectMake(100, 0, 200, 80)];
        
        textLabel.text = @"some text will go to the very next line and wrap around..............";
        
        textLabel.lineBreakMode = NSLineBreakByWordWrapping;
        textLabel.numberOfLines = 0;
        textLabel.font = [UIFont systemFontOfSize:13];
        
        [self.contentView addSubview:textLabel];
        
        
        
        
        
    }
    return self;
}
// setTweet is a 'SETTER'
- (void)setTweet:(NSDictionary *)tweet
{
    _tweet = tweet;
    
    likesLabel.text = [tweet[@"likes"] stringValue];
    
    textLabel.text = tweet[@"text"];
    
}

- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
