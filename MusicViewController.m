//
//  MusicViewController.m
//  Music
//
//  Created by XiaDian on 15/12/23.
//  Copyright © 2015年 xue. All rights reserved.
//
#import "MusicViewController.h"
#import "WelcomeModel.h"
#import "Netinterface.h"
#import "AFNetworking.h"
#import "MusicListModel.h"
#import "XDtableView.h"
#import "RDVTabBarController.h"
#import "PlayViewController.h"
@interface MusicViewController ()<UITableViewDataSource,UITableViewDelegate>{
    NSString *_urlArr;
    NSArray *_dataArr;
}
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@end
@implementation MusicViewController
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    XDtableView *cell=[tableView dequeueReusableCellWithIdentifier:@"xd" forIndexPath:indexPath];
    MusicListModel *mu=_dataArr[indexPath.row];
    cell.songName.text=mu.title;
    cell.author.text=mu.artist;
    cell.mid=mu.mid;
  cell.contentView.backgroundColor=[[UIColor blackColor]colorWithAlphaComponent:0.5];
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 70;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _dataArr.count;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    WelcomeModel *model=[WelcomeModel new];
    // Do any additional setup after loading the view from its nib.
    self.bgImage.image=[UIImage imageNamed:model.bgImageArr[self.index]];
    _urlArr=model.urlArr[self.index];
    self.navigationItem.leftBarButtonItem=[self backBarbutttonWithTarget:self action:@selector(backbutton:)];
    [_tableView registerNib:[UINib nibWithNibName:@"XDtableView" bundle:nil] forCellReuseIdentifier:@"xd"];
    [self Net];
}
-(void)Net{
    AFHTTPRequestOperationManager *manager=[AFHTTPRequestOperationManager manager];
    manager.responseSerializer=[AFHTTPResponseSerializer serializer];
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
   [manager GET:_urlArr parameters:nil success:^(AFHTTPRequestOperation * _Nonnull operation, id  _Nonnull responseObject) {
       [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
       NSDictionary *dic=[NSJSONSerialization JSONObjectWithData:responseObject options:0 error:nil];
       NSArray *arr=dic[@"response"][@"data"];
       NSMutableArray *arrDic=[[NSMutableArray alloc]init];
       for (NSDictionary *dicmid in arr) {
           MusicListModel *mu=[[MusicListModel alloc]initWith:dicmid[@"context"][@"media"]];
           [arrDic addObject:mu];
       }
       _dataArr=arrDic;
       [_tableView reloadData];
   } failure:^(AFHTTPRequestOperation * _Nonnull operation, NSError * _Nonnull error) {
       NSLog(@"%@",error);
       [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;

   }];
}
#pragma mark 返回页面
-(void)backbutton:(UIButton *)btn{
    [self.navigationController popViewControllerAnimated:YES];
}
-(UIBarButtonItem *)backBarbutttonWithTarget:(id)target action:(SEL)action{
    
    UIButton *btn=[UIButton buttonWithType:UIButtonTypeSystem];
    [btn setTitle:@"<" forState:UIControlStateNormal];
    btn.titleLabel.font=[UIFont systemFontOfSize:30 weight:1];
    btn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
     btn.titleEdgeInsets = UIEdgeInsetsMake(0,5, 0, 0);
    [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    btn.frame=CGRectMake(0, 0,100, 44);
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *barbtn=[[UIBarButtonItem alloc]initWithCustomView:btn];
    return barbtn;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    XDtableView *cell=[tableView cellForRowAtIndexPath:indexPath];
     UINavigationController *p=self.navigationController.rdv_tabBarController.viewControllers[3];
     PlayViewController *play=p.viewControllers[0];
    play.Cdid=cell.mid;
    play.CDname=cell.songName.text;
    [play changeCD];
    play.Author=cell.author.text;
    self.navigationController.rdv_tabBarController.selectedIndex=3;
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
