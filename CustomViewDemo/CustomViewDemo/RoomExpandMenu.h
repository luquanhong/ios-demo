//
//  RoomExpandMenu.h
//  CustomViewDemo
//
//  Created by luquanhong on 14-9-28.
//  Copyright (c) 2014年 yy. All rights reserved.
//

#import <UIKit/UIKit.h>

@class RoomExpandMenu;

@protocol RoomExpandMenuDelegate <NSObject>

@optional

@end

typedef enum{
    RoomExpandMenuAdmin = 0,
    RoomExpandMenuOther
}RoomExpandMenuType;


@interface RoomExpandMenu : UIView
@property (weak, nonatomic) IBOutlet UIImageView *blackgroundImage;
@property (weak, nonatomic) IBOutlet UIView *blackView;
@property (weak, nonatomic) IBOutlet UIView *firstView;
@property (weak, nonatomic) IBOutlet UIView *secondView;
@property (weak, nonatomic) IBOutlet UIButton *firstButton;
@property (weak, nonatomic) IBOutlet UIImageView *firstImage;
@property (weak, nonatomic) IBOutlet UILabel *firstLabel;
@property (weak, nonatomic) IBOutlet UIButton *secondButton;
@property (weak, nonatomic) IBOutlet UIImageView *secondImage;
@property (weak, nonatomic) IBOutlet UILabel *secondLabel;
@property (weak, nonatomic) IBOutlet UIView *thirdView;
@property (weak, nonatomic) IBOutlet UIButton *thirdButton;
@property (weak, nonatomic) IBOutlet UIImageView *thirdImage;
@property (weak, nonatomic) IBOutlet UILabel *thirdLabel;


@property (nonatomic,weak) id<RoomExpandMenuDelegate> delegate;

- (void)showInView:(UIView*)view withType: (NSInteger)type;

@end
