//
//  ThreedViewController.m
//  CoreDemo
//
//  Created by 卢泉鸿 on 15/4/29.
//  Copyright (c) 2015年 卢泉鸿. All rights reserved.
//

#import "ThreedViewController.h"
#import "Continent.h"
#import "AppDelegate.h"
#import <Foundation/Foundation.h>

@interface ThreedViewController ()

@end

@implementation ThreedViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self loadData];
    
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

- (void)loadData{
    
    if (contries) {
        contries = nil;
    }
    contries = [[NSMutableArray alloc] init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Country"
                                              inManagedObjectContext:[self getAppDelegate].managedObjectContext];
    
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    [fetchRequest setEntity:entity];
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"cont == %@", self.continent];
    [fetchRequest setPredicate:predicate];
    
    NSError *error = nil;
    NSArray *fecthObjects = [[self getAppDelegate].managedObjectContext executeFetchRequest:fetchRequest error:&error];
    
    for (int i= 0; i < [fecthObjects count]; i++) {
        Country  *obj = (Country*)[fecthObjects objectAtIndex:i];
        [contries addObject:obj];
    }
    
    [_mTableView reloadData];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [contries count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"AddCountry"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"AddCountry"];
    }
    
    Country *country = [contries objectAtIndex:indexPath.row];
    cell.textLabel.text = country.name;
    
    
    return cell;
}


@end
