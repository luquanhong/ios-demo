//
//  DiaryListViewController.m
//  MyDiary
//
//  Created by luquanhong on 14-8-19.
//  Copyright (c) 2014年 yy. All rights reserved.
//

#import "DiaryListViewController.h"
#import "DetailDiaryViewController.h"
#import "Diary.h"

@interface DiaryListViewController ()

@end

@implementation DiaryListViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle: style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    NSLog(@"diary list view viewdidload enter");
    
    
    Diary *a = [[Diary alloc] initWithTitle:@"the First Diary" content:@"the first diary content" ];
    Diary *b = [[Diary alloc] initWithTitle:@"the Second Diary" content:@"the second diary content" ];
    Diary *c = [[Diary alloc] initWithTitle:@"the Third Diary" content:@"the third diary content" ];
    Diary *d = [[Diary alloc] initWithTitle:@"the Forth Diary" content:@"the forth diary content" ];
    Diary *e = [[Diary alloc] initWithTitle:@"the Five Diary" content:@"the five diary content" ];
    
    self.diaries = [NSMutableArray arrayWithObjects:a, b, c, d, e, nil];
    
    
    UIBarButtonItem* bbi = [[ UIBarButtonItem alloc] initWithBarButtonSystemItem: UIBarButtonSystemItemAdd target: self  action: @selector(addNewDiary:) ];
    
    [[self navigationItem] setRightBarButtonItem: bbi];
    
    [[self navigationItem] setTitle:@"Diary List"];
    
    [[self navigationItem] setLeftBarButtonItem:[self editButtonItem]];
    
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

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{

    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

    // Return the number of rows in the section.
    return self.diaries.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"DiaryCell" ];
    //NSLog(@"table view cell is %@ indexPath.row is %d ", cell, indexPath.row );
    
    if (cell == nil) {
        
        NSLog(@"table view cell is nil, we would create a new cell with initWithStyle:reuseIdentifier");
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"DiaryCell"];
    }
    
    // Configure the cell...
    
//    cell.textLabel.text = @"first cell";
//    cell.detailTextLabel.text = @"this is the cell description";
    Diary *diary = [self.diaries objectAtIndex:indexPath.row];
    cell.textLabel.text = [diary title];
    cell.detailTextLabel.text = [[diary dateCreate] description];
    
    
    return cell;
}


//- (void)tableView:(UITableView*)tableView didSelectRowAtIndexPath:(NSIndexPath*)indexPath
//{
//
//    NSLog(@"table view the %d row is pushed by customer", indexPath.row);
//    
//    NSString* messageString = [NSString  stringWithFormat:@"the user check the %d row", indexPath.row];
//    
//    
//    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"user check button" message:messageString delegate:nil
//                     cancelButtonTitle:@"sure" otherButtonTitles: @"other",  nil];
//    
//    [alert show];
//}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
    NSInteger row = [indexPath row];
    
    NSLog(@" selected the row %d", row);
    
    DetailDiaryViewController* detailDiaryViewController = (DetailDiaryViewController*)[segue destinationViewController];
    
//    detailDiaryViewController.title = @"first cell";
//    detailDiaryViewController.content = @"this is the cell description";
    
    Diary *diary = [self.diaries objectAtIndex:row];
    detailDiaryViewController.diary = diary;
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


- (void)addNewDiary:(id)sender
{
    NSLog(@"addNewDiary");
}

@end
