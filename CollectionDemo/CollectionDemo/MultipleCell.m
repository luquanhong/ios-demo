//
//  MultipleCell.m
//  CollectionDemo
//
//  Created by 卢泉鸿 on 15/2/7.
//  Copyright (c) 2015年 卢泉鸿. All rights reserved.
//

#import "MultipleCell.h"



@implementation MultipleCell

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        _imgView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 90, 90)];
        [self addSubview:_imgView];
        
        
        _nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 90, 90, 30)];
        _nameLabel.backgroundColor = [UIColor clearColor];
        [self addSubview:_nameLabel];
        
        
        _detailLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 120, 60, 30)];
        _detailLabel.backgroundColor = [UIColor clearColor];
        [self addSubview:_detailLabel];
        
        
        _markLabel = [[UILabel alloc] initWithFrame:CGRectMake(60, 120, 30, 30)];
        _markLabel.backgroundColor = [UIColor clearColor];
        _markLabel.textColor = [UIColor greenColor];
        [self addSubview:_markLabel];
    }
    return self;  
}

@end
