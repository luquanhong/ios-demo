//
//  CollectionViewController.m
//  CollectionDemo
//
//  Created by 卢泉鸿 on 15/2/7.
//  Copyright (c) 2015年 卢泉鸿. All rights reserved.
//

#import "CollectionViewController.h"
#import "MultipleCell.h"

@interface CollectionViewController () <UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>{

    IBOutlet UICollectionView *collectionView_;
    NSArray *items;
}

@end

@implementation CollectionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    NSLog(@"%f", [[UIScreen mainScreen] bounds].size.width);
    
    //  设置布局
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    //UICollectionViewLayoutAttributes *flowLayout=[[UICollectionViewLayoutAttributes alloc]init];
    //每个cell的大小
    [flowLayout setItemSize:CGSizeMake(155,150)];
    
    //设置方向（向下还是向右）垂直Vertical  水平Horizontal
    [flowLayout setScrollDirection:UICollectionViewScrollDirectionHorizontal];
    
    //设置距离边框的高度
    flowLayout.sectionInset = UIEdgeInsetsMake(10, 0, 0, 0);//top、lef、bottom、right
    
    collectionView_  = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, 320, 460) collectionViewLayout:flowLayout];
    [self.view addSubview:collectionView_];
    collectionView_.backgroundColor = [UIColor redColor];
    collectionView_.delegate = self;
    collectionView_.dataSource = self;
    
    [collectionView_ registerClass:[MultipleCell class] forCellWithReuseIdentifier:@"simpleCell"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"simpleCell";
    MultipleCell *cell = (MultipleCell *)[collectionView dequeueReusableCellWithReuseIdentifier:cellIdentifier forIndexPath:indexPath];
    
    if(cell == nil)
    {
        cell = [[MultipleCell alloc] initWithFrame:CGRectMake(0, 0, 40, 40)];
    }
    cell.imgView.image = [UIImage imageNamed:@"01.png"];
    cell.nameLabel.text = @"Weico";
    cell.detailLabel.text = @"许士彦";
    cell.markLabel.text =[NSString stringWithFormat:@"%d",indexPath.row];
    //点击后背景图片
    cell.selectedBackgroundView=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"01"]];
    
    return cell;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{  
    return 20;  
}

@end
