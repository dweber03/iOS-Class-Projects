//
//  SLFTableViewController.m
//  Selfy
//
//  Created by Derek Weber on 4/21/14.
//  Copyright (c) 2014 Derek Weber. All rights reserved.
//

#import "SLFTableViewController.h"
#import "SLFTableViewCell.h"

@interface SLFTableViewController ()
{
NSArray * listImages;
}

@end

@implementation SLFTableViewController

{
    UIButton * settingsButton;
    UIButton * addNewButton;
    
}
- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self)
    {
        NSLog(@"hehy look derek");
        
        
        
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSLog(@"hehy i'm adding a header seriously ");
    
    UIView * headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.tableView.frame.size.width, 60)];
    headerView.backgroundColor = [UIColor darkGrayColor];
    self.tableView.tableHeaderView = headerView;
    
    
    UILabel * appTitle = [[UILabel alloc] initWithFrame:CGRectMake(60, 0, self.tableView.frame.size.width - 120, 60)];
    appTitle.text = @"Selfy";
    appTitle.textAlignment = NSTextAlignmentCenter;
    
    appTitle.backgroundColor = [UIColor darkGrayColor];
    [headerView addSubview:appTitle];
    
    settingsButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 60, 60)];
//    [settingsButton setTitle:@"Settings" forState:UIControlStateNormal];
    settingsButton.backgroundColor = [UIColor blueColor];
    [settingsButton addTarget:self action:@selector(settings) forControlEvents:UIControlEventTouchUpInside];
    [settingsButton setImage:[UIImage imageNamed:@"settings"] forState:UIControlStateNormal];
    
    [headerView addSubview:settingsButton];
    
    addNewButton = [[UIButton alloc] initWithFrame:CGRectMake(260, 0, 60, 60)];
    //    [settingsButton setTitle:@"Settings" forState:UIControlStateNormal];
    addNewButton.backgroundColor = [UIColor blueColor];
    [addNewButton addTarget:self action:@selector(new) forControlEvents:UIControlEventTouchUpInside];
    [addNewButton setImage:[UIImage imageNamed:@"addnew"] forState:UIControlStateNormal];
    
    [headerView addSubview: addNewButton];

    
    
    

    
//    settingsButton.backgroundColor = [UIColor blackColor];
//    [settingsButton addTarget:self action:@selector(addNewListItem:) forControlEvents:UIControlEventTouchUpInside];
    
    
    
    
    
    
    
  
    

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

#pragma mark - Table view data source



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return 0;
}

/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/

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
- (BOOL)prefersStatusBarHidden {return YES;
}

@end
