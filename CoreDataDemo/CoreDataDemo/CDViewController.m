//
//  CDViewController.m
//  CoreDataDemo
//
//  Created by 卢泉鸿 on 15/2/4.
//  Copyright (c) 2015年 卢泉鸿. All rights reserved.
//

#import "CDViewController.h"
#import "AppDelegate.h"

@interface CDViewController ()<NSFetchedResultsControllerDelegate>

@end

@implementation CDViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.title = @"CoreDataDemo";
    self.navigationItem.leftBarButtonItem = self.editButtonItem;
    
    UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addPerson)];
    self.navigationItem.rightBarButtonItem = addButton;
    
    [self dummy];
    [self loadPeople];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (AppDelegate*)appDelegate{
    return (AppDelegate*)[[UIApplication sharedApplication] delegate];
}

- (void)dummy{

    for (int i = 0; i < 10; i++) {
        Person* person = [NSEntityDescription insertNewObjectForEntityForName:@"Person" inManagedObjectContext:[self appDelegate].managedObjectContext];
        person.firstname = [NSString stringWithFormat:@"first %d", i];
        person.lastname = [NSString stringWithFormat:@"last %d", i];
        person.vip = [NSNumber numberWithBool:NO];
    }
    
    NSError* error = nil;
    if(![[self appDelegate].managedObjectContext save:&error]){
    
    }
}

- (void)loadPeople{

    if(people) people = nil;
    
    people = [[NSMutableArray alloc] init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Person" inManagedObjectContext:[self appDelegate].managedObjectContext];
    
    NSFetchRequest* fetchRequest = [[NSFetchRequest alloc] init];
    [fetchRequest setEntity:entity];
    NSError* error = nil;
    NSArray* fecthedObjects =[[self appDelegate].managedObjectContext executeFetchRequest:fetchRequest error:&error];
    for (int i = 0; i < [fecthedObjects count]; i++) {
        Person* obj = (Person*)[fecthedObjects objectAtIndex:i];
        [people addObject:obj];
    }
    
    [self.mTableView reloadData];
}

#pragma mark - button

- (void)addPerson{

}

#pragma mark - fetch request delegate

- (void)controllerDidChangeContent:(NSFetchedResultsController *)controller{
    [self.mTableView reloadData];
}

#pragma mark - tableview


@end
