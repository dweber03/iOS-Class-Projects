//
//  TLATableViewController.m
//  TweetLike
//
//  Created by Derek Weber on 4/23/14.
//  Copyright (c) 2014 Derek Weber. All rights reserved.
//

#import "TLATableViewController.h"
#import "TLATableViewCell.h"

@interface TLATableViewController ()

@end

@implementation TLATableViewController
{
//    UIButton * addNewButton;
//    NSMutableArray * tweetItems;
    
}
- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
       
//        UIView * headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.tableView.frame.size.width, 60)];
//        headerView.backgroundColor = [UIColor blueColor];
//        
//        self.tableView.tableHeaderView = headerView;
        
        self.tweetItems = [
                      // starts array
                      @[
//                     // starts dictionary at index 0
//                     @{
//                         
//                         @"text" : @"Tweet info!",
//                         @"likes" : @40
//                         }
                        ]
                   mutableCopy];
        
        
        
//        PFObject *testObject = [PFObject objectWithClassName:@"TestObject"];
//        testObject[@"foo"] = @"bar";
//        [testObject saveInBackground];
//        
//        PFUser * user = [PFUser currentUser];
//        
//        user.username = @"derekweber";
//        user.password = @"password";
//        
//        [user saveInBackground];
        
        self.tableView.separatorColor = [UIColor blueColor];
        self.tableView.separatorInset = UIEdgeInsetsMake(0, 0, 0, 0);
        self.tableView.rowHeight = 80;
        
//        addNewButton = [[UIButton alloc] initWithFrame:CGRectMake(110, 10, 100, 40)];
//        [addNewButton setTitle:@"Add New" forState:UIControlStateNormal];
//        addNewButton.backgroundColor = [UIColor whiteColor];
//        addNewButton.titleLabel.font = [UIFont systemFontOfSize:12];
//        addNewButton.titleLabel.textColor = [UIColor blueColor];
//        addNewButton.layer.cornerRadius = 6;
//        
        
//        [headerView addSubview: addNewButton];
        
        

    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

    return [self.tweetItems count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    TLATableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    if (cell == nil)
    {
        cell = [[TLATableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    
    
    cell.tweet = self.tweetItems[indexPath.row];

    

    return cell;
}

-(void)createNewTweet:(NSString *)tweet
{
    if ([tweet isEqualToString:@""]) return;
   
    [self.tweetItems insertObject:@{@"likes":@0,
                                  @"text": tweet
                                  } atIndex:0];
    
    [self.tableView reloadData];
    
}

-(BOOL)isTweetItemsEmpty
{
    return ([self.tweetItems count] == 0); 
}
/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (BOOL)prefersStatusBarHidden
{
    return YES;
}

@end
