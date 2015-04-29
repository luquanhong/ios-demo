//
//  SecondViewController.m
//  CoreDemo
//
//  Created by 卢泉鸿 on 15/4/29.
//  Copyright (c) 2015年 卢泉鸿. All rights reserved.
//

#import "SecondViewController.h"
#import <CoreData/CoreData.h>
#import "AppDelegate.h"
#import "Continent.h"
#import "ThreedViewController.h"

@interface SecondViewController ()

@end

@implementation SecondViewController

- (AppDelegate*)getAppDelegate{
    return (AppDelegate*)[UIApplication sharedApplication].delegate;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self loadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)loadData{
    
    if (continents) {
        continents = nil;
    }
    continents = [[NSMutableArray alloc] init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Continent"
                                              inManagedObjectContext:[self getAppDelegate].managedObjectContext];
    
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    [fetchRequest setEntity:entity];
    
    NSError *error = nil;
    NSArray *fecthObjects = [[self getAppDelegate].managedObjectContext executeFetchRequest:fetchRequest error:&error];
    
    for (int i= 0; i < [fecthObjects count]; i++) {
        Continent *obj = (Continent*)[fecthObjects objectAtIndex:i];
        [continents addObject:obj];
    }
    
    [_mTableView reloadData];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [continents count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"AddContinent"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"AddContinent"];
    }
    
    Continent *continent = [continents objectAtIndex:indexPath.row];
    cell.textLabel.text = continent.name;

    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

    ThreedViewController *threedVC = [[ThreedViewController alloc] initWithNibName:@"ThreedViewController" bundle:nil];
    [threedVC setContinent: [continents objectAtIndex:indexPath.row]];
    [self.navigationController pushViewController:threedVC animated:YES];
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        Continent *continent = [continents objectAtIndex:indexPath.row];
        [[self getAppDelegate].managedObjectContext deleteObject:continent];
        NSError *error = nil;
        if (![[self getAppDelegate].managedObjectContext save:&error]) {
            //
        }
        
        [self loadData];
    }
}

@end
