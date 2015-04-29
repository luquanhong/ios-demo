//
//  FirstViewController.m
//  CoreDemo
//
//  Created by 卢泉鸿 on 15/4/29.
//  Copyright (c) 2015年 卢泉鸿. All rights reserved.
//

#import "FirstViewController.h"
#import "AppDelegate.h"
#import "Person.h"
#import <CoreData/CoreData.h>

@interface FirstViewController ()

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title = @"CoreDemo";
    self.navigationItem.leftBarButtonItem = self.editButtonItem;
    UIBarButtonItem *addBtn = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addNewPerson)];
    self.navigationItem.rightBarButtonItem = addBtn;
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

- (AppDelegate*)getAppDelegate{
    return (AppDelegate*)[UIApplication sharedApplication].delegate;
}

- (void)dummy{
    for (int i = 0; i < 10; i++) {
        Person *person = [NSEntityDescription insertNewObjectForEntityForName:@"Person" inManagedObjectContext:[self getAppDelegate].managedObjectContext];
        person.firstname = [NSString stringWithFormat:@"==%d==", i];
        person.lastname = [NSString stringWithFormat:@"-%d-", i];
        person.vip = [NSNumber numberWithBool:YES];
    }
    
    NSError *error = nil;
    if (![[self getAppDelegate].managedObjectContext save:&error]) {
        //
    }
}

- (void)loadPeople{

    if (people) {
        people = nil;
    }
    people = [[NSMutableArray alloc] init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Person"
                                               inManagedObjectContext:[self getAppDelegate].managedObjectContext];
                                   
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    [fetchRequest setEntity:entity];
    
    NSError *error = nil;
    NSArray *fecthObjects = [[self getAppDelegate].managedObjectContext executeFetchRequest:fetchRequest error:&error];
    
    for (int i= 0; i < [fecthObjects count]; i++) {
        Person *obj = (Person*)[fecthObjects objectAtIndex:i];
        [people addObject:obj];
    }
    
    [_mTableView reloadData];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [people count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"AddPerson"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"AddPerson"];
    }
    
    Person *person = [people objectAtIndex:indexPath.row];
    cell.textLabel.text = person.firstname;
    cell.detailTextLabel.text = person.lastname;
    
    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath{

    return YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{

    if (editingStyle == UITableViewCellEditingStyleDelete) {
        Person *person = [people objectAtIndex:indexPath.row];
        [[self getAppDelegate].managedObjectContext deleteObject:person];
        NSError *error = nil;
        if (![[self getAppDelegate].managedObjectContext save:&error]) {
            //
        }
        
        [self loadPeople];
    }
}


- (void)addNewPerson:(id)sender{


}

- (void)setEditing:(BOOL)editing animated:(BOOL)animated{
    [super setEditing:editing animated:animated];
    if (editing) {
        [self setUpUndoManager];
    }else{
        if (![[self getAppDelegate].managedObjectContext save:nil]) {
            //
        }
    }
}
         
 - (void)setUpUndoManager {
     if ([self getAppDelegate].managedObjectContext.undoManager == nil) {
         self.thisUndoManager = [[NSUndoManager alloc] init];
         [self.thisUndoManager setLevelsOfUndo:3];
         [self getAppDelegate].managedObjectContext.undoManager = self.thisUndoManager;
     }
     
     
     NSNotificationCenter *dnc = [NSNotificationCenter defaultCenter];
     [dnc addObserver:self selector:@selector(undoManagerDidUndo:) name:NSUndoManagerDidUndoChangeNotification object:self.thisUndoManager];
     [dnc addObserver:self selector:@selector(undoManagerDidRedo:) name:NSUndoManagerDidRedoChangeNotification object:self.thisUndoManager];
     
 }
 
 
 - (void)cleanUpUndoManager {
     [[NSNotificationCenter defaultCenter] removeObserver:self];
     if ([self getAppDelegate].managedObjectContext.undoManager == self.thisUndoManager) {
         [self getAppDelegate].managedObjectContext.undoManager = nil;
         self.thisUndoManager = nil;
     }
     
 }
 
 - (void)undoManagerDidUndo:(NSNotification *)notification {
     
     [self.thisUndoManager undo];
     //update the UI like reloading UITableView or setting Edit/Undo/Redo buttons
 }
 
 
 - (void)undoManagerDidRedo:(NSNotification *)notification {
     
     [self.thisUndoManager redo];
     //update the UI like reloading UITableView or setting Edit/Undo/Redo buttons
 }

@end
