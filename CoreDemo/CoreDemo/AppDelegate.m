//
//  AppDelegate.m
//  CoreDemo
//
//  Created by 卢泉鸿 on 15/4/29.
//  Copyright (c) 2015年 卢泉鸿. All rights reserved.
//

#import "AppDelegate.h"
#import "FirstViewController.h"
#import "Continent.h"
#import "Country.h"
#import "SecondViewController.h"

@interface AppDelegate ()


@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    _managedObjectContext = [self appContext];
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    SecondViewController *viewController = [[SecondViewController alloc] initWithNibName:@"SecondViewController" bundle:nil];
    self.navigationController = [[UINavigationController alloc] initWithRootViewController:viewController];
    self.window.rootViewController =  self.navigationController;
    [self setupSomeData];
    [self.window makeKeyAndVisible];
    
    return YES;
}

-(void)setupSomeData
{
    
    Continent* continent = [NSEntityDescription
                            insertNewObjectForEntityForName:@"Continent" inManagedObjectContext:_managedObjectContext];
    continent.name = @"Europe";
    
    Country* france = [NSEntityDescription
                       insertNewObjectForEntityForName:@"Country" inManagedObjectContext:_managedObjectContext];
    france.name = @"France";
    //here we set the relationship
    france.cont = continent;
    //another country
    Country* spain = [NSEntityDescription
                      insertNewObjectForEntityForName:@"Country" inManagedObjectContext:_managedObjectContext];
    spain.name = @"Spain";
    //here we set the relationship
    spain.cont = continent;
    //and one more
    Country* unitedkingdom = [NSEntityDescription
                              insertNewObjectForEntityForName:@"Country" inManagedObjectContext:_managedObjectContext];
    unitedkingdom.name = @"United Kingdom";
    //here we set the relationship
    unitedkingdom.cont = continent;
    //Save them
    NSError *error = nil;
    if (![_managedObjectContext save:&error]) {
        //handle error
    }
    
    
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    [self saveContext];
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    [self saveContext];
}

- (void)saveContext{

    NSError *error = nil;
    
    NSManagedObjectContext *managedObjectContext = self.managedObjectContext;
    if (managedObjectContext) {
        if ([self.managedObjectContext hasChanges] && ![self.managedObjectContext save:&error]) {
            abort();
        }
    }
}


- (NSPersistentStoreCoordinator*)appStoreCoordinator{
    if (self.persistentStoreCoordinator != nil) {
        return self.persistentStoreCoordinator;
    }
    
    NSURL *storeURL = [[self applicationDocumentsDirectory] URLByAppendingPathComponent:@"demo1.sqlite"];
    NSError *error = nil;
    _persistentStoreCoordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:[self appModel]];
    if (![self.persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:storeURL options:nil error:&error]) {
        abort();
    }
    return self.persistentStoreCoordinator;
}

-(NSURL*)applicationDocumentsDirectory{
    return [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
}

- (NSManagedObjectModel*)appModel{

    if (self.managedOjectModel) {
        return self.managedOjectModel;
    }
    
    NSURL *modelURL = [[NSBundle mainBundle] URLForResource:@"World" withExtension:@"momd"];
    _managedOjectModel = [[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL];
    return _managedOjectModel;
}

- (NSManagedObjectContext*)appContext{
    if (self.managedObjectContext) {
        return self.managedObjectContext;
    }
    
    NSPersistentStoreCoordinator *coordinator = [self appStoreCoordinator];
    if (coordinator != nil) {
        _managedObjectContext  = [[NSManagedObjectContext alloc] init];
        [_managedObjectContext setUndoManager:nil];
        [_managedObjectContext setPersistentStoreCoordinator:coordinator];
    }
    
    return _managedObjectContext;
}

@end
