



//
//  HotViewController.m
//  Music
//
//  Created by XiaDian on 15/12/23.
//  Copyright © 2015年 xue. All rights reserved.
//

#import "HotViewController.h"
#import "PlayViewController.h"
@interface HotViewController ()<UITableViewDataSource,UITableViewDelegate>
{   NSString *_urlArr;
    NSArray *_dataArr;
}
@property (weak, nonatomic) IBOutlet UITableView *tableview;
@end
@implementation HotViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self Net];
}
-(void)Net{
    AFHTTPRequestOperationManager *manager=[AFHTTPRequestOperationManager manager];
    manager.responseSerializer=[AFHTTPResponseSerializer serializer];
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
    [manager GET: KHotURL parameters:nil success:^(AFHTTPRequestOperation * _Nonnull operation, id  _Nonnull responseObject) {
        [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
        NSDictionary *dic=[NSJSONSerialization JSONObjectWithData:responseObject options:0 error:nil];
        NSArray *arr=dic[@"response"][@"data"];
        NSMutableArray *arrDic=[[NSMutableArray alloc]init];
        for (NSDictionary *dicmid in arr) {
            MusicListModel *mu=[[MusicListModel alloc]initWith:dicmid[@"context"][@"media"]];
            [arrDic addObject:mu];
        }
        _dataArr=arrDic;
        [_tableview reloadData];
    } failure:^(AFHTTPRequestOperation * _Nonnull operation, NSError * _Nonnull error) {
        NSLog(@"%@",error);
        [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
    }];
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"xd"];
    if (!cell) {
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"xd"];
    }
    MusicListModel *mu=_dataArr[indexPath.row];
    cell.detailTextLabel.text=mu.artist;
    cell.detailTextLabel.textColor=[UIColor whiteColor];
    cell.detailTextLabel.highlightedTextColor=[UIColor blackColor];
    cell.textLabel.text=mu.title;
    cell.textLabel.textColor=[UIColor whiteColor];
    cell.textLabel.highlightedTextColor=[UIColor blackColor];
    cell.imageView.image=[UIImage imageNamed:@"CD"];
    cell.backgroundColor=[UIColor clearColor];
    cell.contentView.backgroundColor=[[UIColor blackColor]colorWithAlphaComponent:0.5];
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 70;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _dataArr.count;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    UINavigationController *p=self.navigationController.rdv_tabBarController.viewControllers[3];
    PlayViewController *play=p.viewControllers[0];
     MusicListModel *mu=_dataArr[indexPath.row];
    play.Cdid=mu.mid;
    play.CDname=mu.title;
    [play changeCD];
    play.Author=mu.artist;
    self.navigationController.rdv_tabBarController.selectedIndex=3;
}
@end
