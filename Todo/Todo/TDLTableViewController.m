//
//  TDLTableViewController.m
//  Todo
//
//  Created by Derek Weber on 4/2/14.
//  Copyright (c) 2014 Derek Weber. All rights reserved.
//

#import "TDLTableViewController.h"
#import "TDLTableViewCell.h"
#import "TDLGitHubRequest.h"
#import "TDLSingleton.h"

@implementation TDLTableViewController

{
//    NSMutableArray *listItems;
    
    UITextField * nameField;
    
    NSArray *listImages;
   
//    UINavigationController * navController;
    
}

//- (void)toggleEdit
//{
//    [self.tableView setEditing: !self.tableView.editing animated:YES];

    

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    
    if (self)
    {
//        UIWindow * window = UIApplication.sharedApplication.windows.firstObject;
//        navController = (UINavigationController *)window.rootViewController;
        
        
//        UIBarButtonItem * editButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemEdit target:self action:@selector(toggleEdit)];
//        self.navigationItem.rightBarButtonItem = editButton;
        
        //Hard Way  listItems = [[NSArray alloc] initWithObjects:@"Monday", @"Tuesday",@"Wednesday", nil];
        
        //Easy way of Listing Items without the NSArray alloc & initWithObjects
        //listItems = @[@"Jon Fox", @"Ali Houshmand", @"Savitha Reddy", @"TJ Mercer", @"Just a Girl Coding", @"Ashby", @"Jisha Obukwelu", @"Austen Johnson", @"John Yam", @"Jeff King", @"Jeffery Moulds", @"Teddy Conyers"];
   
        
        //  NSDictionary * list = [NSDictionary alloc] initWithObjects:<#(NSArray *)#> forKeys:<#(NSArray *)#>
        
//        listItems = [@[
//                       @{@"name" : @"Jon Fox", @"image" : [UIImage imageNamed: @"jonfox"], @"github": @"https://github.com/foxjon"},
//                       @{@"name" : @"Ali Houshmand", @"image" : [UIImage imageNamed: @"alihoushmand"], @"github": @"https://github.com/HoushmandA06"},
//                       @{@"name" : @"Savitha Reddy", @"image" : [UIImage imageNamed: @"savithareddy"], @"github": @"https://github.com/savithareddy"},
//                       @{@"name" : @"TJ Mercer", @"image" : [UIImage imageNamed: @"tjmercer"], @"github": @"https://github.com/gwanunig14"},
//                       @{@"name" : @"Just a Girl Coding", @"image" : [UIImage imageNamed: @"justagirlcoding"], @"github": @"https://github.com/justagirlcoding"},
//                       @{@"name" : @"Ashby", @"image" : [UIImage imageNamed: @"ashby"], @"github": @"https://github.com/athornwell"},
//                       @{@"name" : @"Jisha Obukwelu", @"image" : [UIImage imageNamed: @"jishaobukwelu"], @"github": @"https://github.com/Jiobu"},
//                       @{@"name" : @"Austen Johnson", @"image" : [UIImage imageNamed: @"austenjohnson"], @"github": @"https://github.com/ajohnson21"},
//                       @{@"name" : @"John Yam", @"image" : [UIImage imageNamed: @"johnyam"], @"github": @"https://github.com/yamski"},
//                       @{@"name" : @"Jeff King", @"image" : [UIImage imageNamed: @"jeffking"], @"github": @"https://github.com/rampis"},
//                       @{@"name" : @"Jeffery Moulds", @"image" : [UIImage imageNamed: @"jefferymoulds"], @"github": @"https://github.com/jdmgithub"},
//                       @{@"name" : @"Teddy Conyers", @"image" : [UIImage imageNamed: @"teddyconyers"], @"github": @"https://github.com/talented76"}] mutableCopy];
        
//        listItems = [@[
//                       @{@"name":  @"Derek Weber",
//                         @"image": @"https://avatars0.githubusercontent.com/u/6764483?s=460",
//                         @"github": @"https://github.com/derekweber"
//                         }
//                       ] mutableCopy];
        
        
        
        //
        //        listImages = @[
        //                       [UIImage imageNamed: @"jonfox"],
        //                       [UIImage imageNamed: @"teddyconyers"],];
        //
        
        self.tableView.contentInset = UIEdgeInsetsMake(50, 0, 0, 0);
        self.tableView.rowHeight = 100;
//        self.tableView.editing = YES;
        
        UIView * header = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 100)];
        header.backgroundColor = [UIColor darkGrayColor];
        self.tableView.tableHeaderView = header;
        
        //        UILabel * titleHeader = [[UILabel alloc] initWithFrame:CGRectMake(10, 10, 300, 30)];
        //        titleHeader.text = @"Contacts";
        //        titleHeader.textColor = [UIColor whiteColor];
        //        [header addSubview:titleHeader];
        
        nameField = [[UITextField alloc] initWithFrame:CGRectMake(20, 20, 160, 30)];
        nameField.backgroundColor = [UIColor colorWithWhite:0.0 alpha:.05];
        nameField.layer.cornerRadius = 6;
        nameField.leftView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 10, 30)];
        nameField.leftViewMode = UITextFieldViewModeAlways;
        
        
        nameField.delegate = self;
        
        [header addSubview:nameField];
        
        UIButton * submitButton = [[UIButton alloc] initWithFrame:CGRectMake(200, 20, 100, 30)];
        [submitButton setTitle:@"New User" forState:UIControlStateNormal];
        submitButton.titleLabel.font = [UIFont systemFontOfSize:12];
        submitButton.backgroundColor = [UIColor darkGrayColor];
        [submitButton addTarget:self action:@selector(newUser) forControlEvents:UIControlEventTouchUpInside];
        
        
        [header addSubview:submitButton];
        
        UILabel * titleHeader = [[UILabel alloc] initWithFrame:CGRectMake(20, 70, 280, 30)];
        titleHeader.text = @"GitHub Users";
        titleHeader.textColor = [UIColor lightGrayColor];
        titleHeader.font = [UIFont systemFontOfSize:26];
        [header addSubview:titleHeader];
        
        
        UIView * footer = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 50)];
        footer.backgroundColor = [UIColor darkGrayColor];
        self.tableView.tableFooterView = footer;
        
        //[self.tableView setTableHeaderView:header];
        
        
//        NSLog(@"listItems : %@ ....%@", listItems, listItems[0]);
        
    }
    return self;
}



- (void) newUser
{
    NSString * username = nameField.text;
    
    nameField.text = @"";
    
    NSDictionary * userInfo = [TDLGitHubRequest getUserWithUsername:username];
    
    if ([[userInfo allKeys] count] == 3)
    {
        [[TDLSingleton sharedSingleton] addListItem:userInfo];
        
//        [listItems addObject:userInfo];
    }
    else {
        
    NSLog(@"not enough data");
        
        UIAlertView * alertView = [[UIAlertView alloc] initWithTitle:@"Bad Information" message:@"Unable to Add User" delegate:self cancelButtonTitle:@"Try Again" otherButtonTitles:nil];
        
        [alertView show];
        
    }
    
    
//    [listItems addObject:@{@"name" : username,
//                           //@"image" : [UIImage imageNamed: @"new_user"],
//                           @"github":[NSString stringWithFormat: @"https://github.com/%@", username]}];
    
    [nameField resignFirstResponder];
    [self.tableView reloadData];
   
    
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField;
{
    [self newUser];
    
    return YES;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [[[TDLSingleton sharedSingleton] allListItems] count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    TDLTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    if (cell == nil) cell = [[TDLTableViewCell alloc] initWithStyle: UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    
    cell.tag = indexPath.row;
 
    
    return cell;
}


- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSDictionary * listItem = [[TDLSingleton sharedSingleton] allListItems][indexPath.row];
    
    UIViewController * webController = [[UIViewController alloc] init];
    
    UIWebView *webView = [[UIWebView alloc] init];
    
    webController.view = webView;
    
    [self.navigationController pushViewController:webController animated:YES];
    [webView loadRequest:[NSURLRequest requestWithURL: [NSURL URLWithString:listItem[@"github"]]]];
    
}

- (BOOL)tableView: (UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath;
{
    return YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath;
{

    [[TDLSingleton sharedSingleton] removeListItemAtIndex:indexPath.row];
    
    [self.tableView reloadData];
    
}

- (BOOL)tableView: (UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}

//- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath *)destinationIndexPath
//{
//    if (sourceIndexPath == destinationIndexPath) return;
//    
//    NSDictionary * sourceItem = [self getListItem:sourceIndexPath.row];
//    
//    NSDictionary * toItem = [self getListItem:destinationIndexPath.row];
//    
//    [listItems removeObjectIdenticalTo:sourceItem];
//    [listItems insertObject:sourceItem atIndex:[listItems indexOfObject:toItem]];
//    
//    [self saveData];
//    
//}



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

@end
