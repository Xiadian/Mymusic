


//
//  WelcomeViewController.m
//  Music
//
//  Created by XiaDian on 15/12/23.
//  Copyright © 2015年 xue. All rights reserved.
//

#import "WelcomeViewController.h"
#import "XDCollectionViewCell.h"
#import "XDlayout.h"
#import "XDRectlayout.h"
#import "WelcomeModel.h"
#import "MusicViewController.h"
#import "RDVTabBarController.h"
@interface WelcomeViewController ()<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@end
@implementation WelcomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self creatUI];
    [_collectionView registerNib:[UINib nibWithNibName:@"XDCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"Xd"];
}
-(void)creatUI{
    UIImageView *image=[[UIImageView alloc]initWithFrame:[UIScreen mainScreen].bounds];
    image.image=[UIImage imageNamed:@"welcome.jpg"];
    _collectionView.backgroundView=image;
    image.userInteractionEnabled=YES;
    UITapGestureRecognizer *tap=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapShow:)];
    [image addGestureRecognizer:tap];
    XDRectlayout *lay=[XDRectlayout new];
    _collectionView.userInteractionEnabled=YES;
    _collectionView.collectionViewLayout=lay;
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    XDCollectionViewCell *cell=[collectionView dequeueReusableCellWithReuseIdentifier:@"Xd" forIndexPath:indexPath];
     WelcomeModel *model=[WelcomeModel new];
    cell.image.image=[UIImage imageNamed:model.imageArr[indexPath.row]];
    cell.label.text=model.labelArr[indexPath.row];
    return cell;
}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 7;
}
- (void)tapShow:(UIGestureRecognizer *)tap {
    if ([self.collectionView.collectionViewLayout isKindOfClass:[XDRectlayout class]]) {

        [self.collectionView setCollectionViewLayout:[[XDlayout alloc] init] animated:YES];

    } else {
        [self.collectionView setCollectionViewLayout:[[XDRectlayout alloc] init] animated:YES];
        
    }
}
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    MusicViewController *mu=[MusicViewController new];
    WelcomeModel *model=[WelcomeModel new];
    mu.index=indexPath.row;
    mu.navigationItem.title= model.labelArr[indexPath.row];
    
    [self.navigationController pushViewController:mu animated:YES];
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
