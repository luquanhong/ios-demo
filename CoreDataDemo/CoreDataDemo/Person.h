//
//  Person.h
//  CoreDataDemo
//
//  Created by 卢泉鸿 on 15/2/4.
//  Copyright (c) 2015年 卢泉鸿. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Person : NSManagedObject

@property (nonatomic, retain) NSString * firstname;
@property (nonatomic, retain) NSString * lastname;
@property (nonatomic, retain) NSNumber * vip;

@end
