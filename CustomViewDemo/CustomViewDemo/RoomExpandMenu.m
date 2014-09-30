//
//  RoomExpandMenu.m
//  CustomViewDemo
//
//  Created by luquanhong on 14-9-28.
//  Copyright (c) 2014年 yy. All rights reserved.
//

#import "RoomExpandMenu.h"

@interface RoomExpandMenu()

@end

@implementation RoomExpandMenu

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        
        //self.view.frame = CGRectMake(0, 0, 86, 50);
        //_blackView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, _, <#CGFloat height#>)]
       
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/
- (IBAction)firstAction:(id)sender {
    
    NSLog(@"first action");
}

- (void)awakeFromNib
{

    CGFloat top = 10; // 顶端盖高度
    CGFloat bottom = 25 ; // 底端盖高度
    CGFloat left = 10; // 左端盖宽度
    CGFloat right = 70; // 右端盖宽度
    UIEdgeInsets insets = UIEdgeInsetsMake(top, left, bottom, right);
    UIImage *image = [UIImage imageNamed:@"chatroom_bottom_menu_bg"];
    //image = [image resizableImageWithCapInsets:UIEdgeInsetsMake(floorf(image.size.height/2), floorf(image.size.width/2), floorf(image.size.height/2), floorf(image.size.width/2))];
    
    image = [image resizableImageWithCapInsets:insets];
    
    [_blackgroundImage setImage:image];
}

-  (void)showInView:(UIView*)view withType:(NSInteger)type
{

    if(type == RoomExpandMenuAdmin){
    
    }else if(type == RoomExpandMenuOther){
        
        _firstView.hidden = YES;
        //_secondView.hidden = YES;
        
        _secondImage setImage:[UIImage imageNamed:@"<#string#>"]
    }
}



@end
