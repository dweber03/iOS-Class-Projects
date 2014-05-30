//
//  GLACollectionVC.m
//  GridLayout
//
//  Created by Derek Weber on 5/30/14.
//  Copyright (c) 2014 Derek Weber. All rights reserved.
//

#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height

#import "GLACollectionVC.h"

@interface GLACollectionVC () <UICollectionViewDelegate>

@end

@implementation GLACollectionVC
{
    NSArray * movies;
}

-(id)initWithCollectionViewLayout:(UICollectionViewFlowLayout *)layout
{
    self = [super initWithCollectionViewLayout:layout];
    if (self)
    {
        [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
        
        self.collectionView.contentInset = UIEdgeInsetsMake(10, 10, 10, 10);
        
        layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        
        movies = @[
                   @"Congo",
                   @"Tombstone",
                   @"Big"
                   ];
        

    }
    return self;
    
}


-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return [movies count];
}

-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake((SCREEN_WIDTH - 30) / 3.0, (SCREEN_HEIGHT - 30) / 4.0);
}


-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath

{
    
    UICollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    
    UILabel * title = [[UILabel alloc]initWithFrame:CGRectMake(10, 10, cell.frame.size.width - 20, 30)];
    title.textColor = [UIColor darkGrayColor];
    
    title.text = movies[indexPath.row];
    
    [cell.contentView addSubview:title];
    
    cell.backgroundColor = [UIColor whiteColor];
    
    return cell;
    
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}


@end
