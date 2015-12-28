




//
//  BaseController.m
//  Music
//
//  Created by XiaDian on 15/12/23.
//  Copyright © 2015年 xue. All rights reserved.
//

#import "BaseController.h"
#import "Mymusic.h"
@interface BaseController ()
@end

@implementation BaseController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _CoredataArr=[[NSMutableArray alloc]init];
   [self prepareForCoreData];
//    for (Mymusic *mc in _CoredataArr) {
//         [_context deleteObject:mc];
//        [_context save:nil];
//    }
}
-(void)prepareForCoreData{
    NSString *path=[[NSBundle mainBundle]pathForResource:@"MyCD" ofType:@"momd"];
    //加载url模型
    NSManagedObjectModel *model=[[NSManagedObjectModel alloc]initWithContentsOfURL:[NSURL fileURLWithPath:path]];
    //持久化存储协调器,可以操作model
    NSPersistentStoreCoordinator *coordinator=[[NSPersistentStoreCoordinator alloc]initWithManagedObjectModel:model];
    NSString *sqlPath=[NSHomeDirectory() stringByAppendingPathComponent:@"Documents/MyCD.sqlite"];
    NSError *err=nil;
    //通过协调器将模型和一个数据库协调起来 返回值用来判断是否关联成功 如果store为空关联失败
    NSPersistentStore *store=[coordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:[NSURL fileURLWithPath:sqlPath] options:nil error:&err];
    if (!store) {
        NSLog(@"%@",err);
    }
    _context=[[NSManagedObjectContext alloc]init];
    _context.persistentStoreCoordinator=coordinator;
    NSFetchRequest *requst=[NSFetchRequest fetchRequestWithEntityName:@"Mymusic"];
    err=nil;
    NSArray *arr=[_context executeFetchRequest:requst error:&err];
    if (err) {
        NSLog(@"%@",err);
    }else{
        _CoredataArr=nil;
        _CoredataArr=[NSMutableArray arrayWithArray:arr];
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
