//
//  TDLTableViewController.m
//  ToDo2
//
//  Created by Derek Weber on 4/8/14.
//  Copyright (c) 2014 Derek Weber. All rights reserved.
//

#import "TDLTableViewController.h"
//#import "TDLTableViewCell.h"
#import "MOVE.h"

@interface TDLTableViewController ()

@end

@implementation TDLTableViewController
{
    NSMutableArray * listItems;
    UITextField * listItemField;
    NSArray * priorityColors;
}
    UIButton * lowButton;
    UIButton * medButton;
    UIButton * highButton;

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self)
    {
        priorityColors = @[TAN_COLOR, YELLOW_COLOR, ORANGE_COLOR, RED_COLOR];
        
        
        
       
        listItems = [@[
                       @{@"name":@"Workshop App",
                         @"priority" : @3, @"constant" : @3
                         },
                       @{@"name": @"Add Class Twitter", @"priority": @2, @"constant" : @2},
                       @{@"name": @"Blog on Wordpress", @"priority": @1, @"constant" : @1},
                       @{@"name": @"Finish GitHub App", @"priority": @1, @"constant" : @1},
                       ] mutableCopy];
        
        self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        self.tableView.tableHeaderView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 60)];
        
        
//        UIView * header = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 300, 85)];
//        header.backgroundColor = [UIColor darkGrayColor];
//        self.tableView.tableHeaderView = header;
        
        listItemField= [[UITextField alloc] initWithFrame:CGRectMake(10, 10, 150, 40)];
        listItemField.placeholder = @"To Do Item";
        listItemField.backgroundColor = [UIColor whiteColor];
        listItemField.layer.cornerRadius = 6;
        listItemField.leftView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 10, 40)];
        listItemField.leftViewMode = UITextFieldViewModeAlways;
        listItemField.delegate = self;
        [self.tableView.tableHeaderView addSubview:listItemField];
        
        lowButton = [[UIButton alloc] initWithFrame:CGRectMake(180, 10, 40, 40)];
        lowButton.tag = 1;
        lowButton.backgroundColor = [UIColor yellowColor];
        lowButton.layer.cornerRadius = 20;
        [lowButton addTarget:self action:@selector(addNewListItem:) forControlEvents:UIControlEventTouchUpInside];
        [self.tableView.tableHeaderView addSubview:lowButton];
        
        medButton = [[UIButton alloc] initWithFrame:CGRectMake(225, 10, 40, 40)];
        medButton.tag = 2;
        medButton.backgroundColor = [UIColor orangeColor];
        medButton.layer.cornerRadius = 20;
        [medButton addTarget:self action:@selector(addNewListItem:) forControlEvents:UIControlEventTouchUpInside];
        [self.tableView.tableHeaderView addSubview:medButton];
        
        highButton = [[UIButton alloc] initWithFrame:CGRectMake(270, 10, 40, 40)];
        highButton.tag = 3;
        highButton.backgroundColor = [UIColor redColor];
        highButton.layer.cornerRadius = 20;
        [highButton addTarget:self action:@selector(addNewListItem:) forControlEvents:UIControlEventTouchUpInside];
        [self.tableView.tableHeaderView addSubview:highButton];


        
//        UILabel * titleHeader = [[UILabel alloc] initWithFrame:CGRectMake(10, 10, 300, 30)];
//        titleHeader.text = @"ToDo Item";
//        titleHeader.textColor = [UIColor whiteColor];
//        [header addSubview:titleHeader]
        
    }
    return self;
}

-(void)deleteItem:(TDLTableViewCell *)cell
{
    NSIndexPath * indexPath = [self.tableView indexPathForCell:cell];
    [listItems removeObjectAtIndex: indexPath.row];
    [self.tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade]; 
}

-(void)setItemPriority:(int)priority withItem:(TDLTableViewCell *)cell
{
    NSIndexPath * indexPath = [self.tableView indexPathForCell:cell];
    
    NSDictionary * listItem = listItems[indexPath.row];
    
    NSDictionary * updateListItem = @{
                                      @"name": listItem[@"name"],
                                        @"priority" : @(priority),
                                        @"constant" : @(priority)};
    
    [listItems removeObjectAtIndex: indexPath.row];
    [listItems insertObject:updateListItem atIndex:indexPath.row];
    cell.bgView.backgroundColor = priorityColors[priority];
    [MOVE animateView:cell.bgView properties:@{@"x":@10,@"duration":@0.5}];
    [cell hideCircleButtons];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    NSLog(@"Returned");
    [textField resignFirstResponder];
    return YES;
    

    
    
}

- (void)addNewListItem: (id)sender
{
//    if ([sender isEqual: highButton]) NSLog(@"highButton");
    
    UIButton * button = (UIButton *)sender;
    NSString * name = listItemField.text;
//    NSLog(@"%@", sender);
    
    if (![name isEqualToString:@""])
    {
        [listItems insertObject:@{@"name": name, @"priority" : @(button.tag),@"constant" : @(button.tag)} atIndex:0];
        
        // @(button.tag) = NSNumber numberWithInteger: button.tag We replaced NSNumber numberWithInteger: button.tag with @(button.tag)
    }
    [listItemField resignFirstResponder];
    
    [self.tableView reloadData];
    
}

- (void) textFieldDidBeginEditing:(UITextField *)textField
{
    textField.placeholder = @"";
}

-(void) textFieldDidEndEditing:(UITextField *)textField
{
    textField.placeholder = @"Enter New Item"; 
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

#pragma mark - Table view data source


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return [listItems count];
}

- (void) newUser
{
    
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    TDLTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    if (cell == nil) cell = [[TDLTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    
    [cell resetLayout];
    
    cell.selectionStyle = UITableViewCellEditingStyleNone;
    
    cell.delegate = self;
    
    NSDictionary * listItem = listItems[indexPath.row];
    
//    cell.backgroundColor = priorityColors[[listItem[@"priority"] intValue]];

    cell.bgView.backgroundColor = priorityColors[[listItem [@"priority"] intValue]];
    
    if([listItem[@"priority"] intValue] == 0)
    {
        cell.strikeThrough.alpha = 1;
        cell.circleButton.alpha = 0;}
    else {
        cell.strikeThrough.alpha = 0;
        cell.circleButton.alpha = 1;
    }
    
        
    cell.nameLabel.text = listItem[@"name"];
    
    UISwipeGestureRecognizer *swipeLeft = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipeCell:)];
    swipeLeft.direction = UISwipeGestureRecognizerDirectionLeft;
    [cell addGestureRecognizer:swipeLeft];
    
    UISwipeGestureRecognizer *swipeRight = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipeCell:)];
    swipeRight.direction = UISwipeGestureRecognizerDirectionRight;
    [cell addGestureRecognizer:swipeRight];
    
    
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    // get cell from tableView at row
    TDLTableViewCell *cell = (TDLTableViewCell*)[tableView cellForRowAtIndexPath:indexPath];
    
    NSDictionary * listItem = listItems[indexPath.row];
    
    if (cell.swiped) return;
    
    // NSInteger * index = [self.tableView indexPathForCell:cell].row;
    
    // if(slid over) return;
    
    // set cell background to the done color
    cell.bgView.backgroundColor = priorityColors[0];
    cell.strikeThrough.alpha = 1;
    cell.circleButton.alpha = 0; 
    
    //create new dictionary with the done priority
   
    NSDictionary * updateListItem = listItem;
    
    if  ([listItem[@"priority"] intValue])
    {
        cell.bgView.backgroundColor = priorityColors [0];
        cell.strikeThrough.alpha = 1;
        cell.circleButton.alpha = 0;
        updateListItem = @{
                           @"name": listItem [@"name"],
                           @"priority" :@0,
                           @"constant" : listItem [@"constant"]
                           };
    }
    
else
{
        cell.bgView.backgroundColor = priorityColors[[listItems [indexPath.row][@"constant"] intValue]];
        cell.strikeThrough.alpha = 0;
        cell.circleButton.alpha = 1;
        //create new dictionary with the done priority
    
    updateListItem = @{
                                          @"name": listItem [@"name"],
                                          @"priority" :listItem [@"constant"],
                                          @"constant" : listItem [@"constant"]
                                          };
    
        NSLog(@"working");
    
       
    }
    
    // remove old dictionary for cell
    [listItems removeObjectAtIndex:indexPath.row];
    
    // add new dictionary for cell
    [listItems insertObject: updateListItem atIndex:indexPath.row];
    
    
}


- (void)swipeCell:(UISwipeGestureRecognizer *)gesture
{
    NSLog(@"%@", gesture);
    
    TDLTableViewCell * cell = (TDLTableViewCell *)gesture.view;
    
    NSInteger index = [self.tableView indexPathForCell:cell].row;
    
    NSDictionary * listItem = listItems[index];
    
    // if gesture.direction == left : then 2 (if you swipe left then swipe equals 2)
    // if gesture.direction == right : then 1 (if you swipe right then swipe equals 1)
    // if gesture.direction == left && the priority == 0(strikethrough) : then 12
    // if gesture.direction == right && the priority == 0(strikethrough) : then 11
    
    int completed;
//    if([listItem[@"priority"] intValue] == 0)
//    {
//        completed = 1;
//    }
//    else
//    { completed = 0;
//    }
//    
    
    completed = ([listItem[@"priority"] intValue] == 0) ? 10 : 0;
    
    switch (gesture.direction + completed)
    
    {
       case 1: //right
//            NSLog(@"swiping right");
            [MOVE animateView:cell.bgView properties:@{@"x": @10, @"duration" : @.5}];
            [cell hideCircleButtons];
            cell.swiped = NO;
            break;
            
      case 2: //left
//            NSLog(@"swiping left");
            [MOVE animateView:cell.bgView properties:@{@"x" : @-140, @"duration" : @.5}];
            [cell showCircleButtons];
            cell.swiped = YES;
            break;
            
            case 11:
            [MOVE animateView:cell.bgView properties:@{@"x": @10, @"duration" : @.5}];
            [cell hideDeleteButton];
            cell.swiped = NO;
            break;
            
            case 12:
            [MOVE animateView:cell.bgView properties:@{@"x" : @-40, @"duration" : @.5}];
            [cell showDeleteButton];
            cell.swiped = YES;
            break;
            
    }
    

    
    //swipe right to show feed options
    //NFeedCell *view = (NFeedCell *) [[gesture view] viewWithTag: 100];
    //
    //NSString *x = ([view frame].origin.x == 10) ? @"60" : @"10";
    //x = @"10"; //override swipe
    //float distance = view.frame.origin.x + [x floatValue]; 
}

- (BOOL)prefersStatusBarHidden {return YES;}

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
