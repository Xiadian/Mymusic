




//
//  LoveViewController.m
//  Music
//
//  Created by XiaDian on 15/12/23.
//  Copyright © 2015年 xue. All rights reserved.
//

#import "LoveViewController.h"
#import "Mymusic.h"
#import "PlayViewController.h"
@interface LoveViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@end
@implementation LoveViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
}

#pragma mark tabelview
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"xd"];
    if (!cell) {
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"xd"];
    }
    Mymusic *mu=_CoredataArr[indexPath.row];
    cell.detailTextLabel.text=mu.author;
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
    return _CoredataArr.count;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    UINavigationController *p=self.navigationController.rdv_tabBarController.viewControllers[3];
    PlayViewController *play=p.viewControllers[0];
    Mymusic *mu=_CoredataArr[indexPath.row];
    play.Cdid=mu.mid;
    play.CDname=mu.title;
    play.data=mu.cd;
     play.Author=mu.author;
    [play play];
   
    self.navigationController.rdv_tabBarController.selectedIndex=3;
}
-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    Mymusic *mc=_CoredataArr[indexPath.row];
    [_context deleteObject:mc];
    [_context save:nil];
    [self prepareForCoreData];
    [self.tableView reloadData];
}
#pragma mark coredata
-(void)insertMymusic{
   [self prepareForCoreData];
    NSLog(@"%lu",(unsigned long)_CoredataArr.count);
    [self.tableView reloadData];
}
@end
