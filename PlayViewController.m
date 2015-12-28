


//
//  PlayViewController.m
//  Music
//
//  Created by XiaDian on 15/12/23.
//  Copyright © 2015年 xue. All rights reserved.
//

#import "PlayViewController.h"
#import "AFNetworking.h"
#import <AVFoundation/AVFoundation.h>
#import "Netinterface.h"
#import "LoveViewController.h"
#import "XDCache.h"
#import "Mymusic.h"
#import "Mymusic+CoreDataProperties.h"
@interface PlayViewController ()<AVAudioPlayerDelegate>{
    NSString *_url;
    NSURL *_CDurl;
     AVAudioPlayer* _player;    
}
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@property (weak, nonatomic) IBOutlet UIProgressView *progress;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UIView *baView;
@property (weak, nonatomic) IBOutlet UIButton *Lovebutton;
@property (weak, nonatomic) IBOutlet UILabel *alerLabel;
@property(nonatomic,copy)NSString *tCdid;
@property (strong) NSString* tCDname;
@property (strong) NSString* tAuthor;

@property(nonatomic,strong)NSTimer *timer;
@property (weak, nonatomic) IBOutlet UILabel *sizeLabel;
@end
@implementation PlayViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.Lovebutton.enabled=NO;
    self.activeView.hidden=YES;
    self.Lovebutton.layer.cornerRadius=10;
    // Do any additional setup after loading the view from its nib.
    _baView.backgroundColor=[[UIColor blackColor]colorWithAlphaComponent:0.6];
     [NSTimer scheduledTimerWithTimeInterval:15 target:self selector:@selector(decletcircle) userInfo:nil repeats:YES];
    XDCache *Manager=[XDCache defoultXDCahe];
    self.sizeLabel.text=@"0KB";
    NSString *size=[NSString stringWithFormat:@"%lu",(unsigned long)[Manager getCacheSize]-68];
    self.sizeLabel.text=[NSString stringWithFormat:@"缓存大小：%@KB",size];
}
- (IBAction)clearCache:(id)sender {
    XDCache *Manager=[XDCache defoultXDCahe];
    [Manager deleteCache];
    NSString *size=[NSString stringWithFormat:@"%lu",(unsigned long)[Manager getCacheSize]-68];
    self.sizeLabel.text=[NSString stringWithFormat:@"缓存大小：%@KB",size];
}
-(void)changeCD{
    _url=[NSString stringWithFormat:KMusicInfoURL,self.Cdid];
    XDCache *Manager=[XDCache defoultXDCahe];
    if ([Manager getFromDataWith:self.Cdid]) {
        _data=[Manager getFromDataWith:self.Cdid];
        [self play];
    }
    else{
        [self Net];
    }
}
-(void)playCD{
[UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
    self.activeView.hidden=NO;
 dispatch_async(dispatch_get_global_queue(0, 0), ^{
          self.Lovebutton.enabled=NO;
      XDCache *Manager=[XDCache defoultXDCahe];
     _data=[NSData dataWithContentsOfURL:_CDurl];
     [Manager writeToFileWith:self.Cdid withData:_data];
     dispatch_async(dispatch_get_main_queue(),^{
         [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
         self.activeView.hidden=YES;
         self.CDname=   self.tCDname;
         self.Cdid=self.tCdid;
         self.Author=self.tAuthor;
         [self play];
     });
 });
}
-(void)updateCD{
    
    NSTimeInterval allTime = _player.duration;
    // 获取当前播放器播放音频的当前进度
    NSTimeInterval curretnTime = _player.currentTime;
    // 设定显示条的当前进度
    _progress.progress= curretnTime/allTime;
    int mm = (int)curretnTime/60;
    int ss = (int)curretnTime%60;
    NSString* currTimeString = [NSString stringWithFormat:@"%.2d:%.2d",mm,ss];
    
    int MM = (int)allTime/60;
    int SS = (int)allTime%60;
    NSString* durationTimeString = [NSString stringWithFormat:@"%.2d:%.2d",MM,SS];
    // 拼接一个包含当前播放时间和总时间的字符串
    NSString* resultString = [currTimeString stringByAppendingPathComponent:durationTimeString];
    _timeLabel.text = resultString;
    _nameLabel.text=self.CDname;
    NSMutableArray *pathArr=[NSMutableArray new];
    for (int i=0; i<10; i++) {
        CGPoint pastLocation =CGPointMake(arc4random()%(NSInteger)([UIScreen mainScreen].bounds.size.width), arc4random()%(NSInteger)([UIScreen mainScreen].bounds.size.height*3/4));
        NSValue *pastpoint=[NSValue valueWithCGPoint:pastLocation];
        [pathArr addObject:pastpoint];
    }
    UIButton *btn=[UIButton buttonWithType:UIButtonTypeSystem];
    btn.backgroundColor=[UIColor colorWithRed:arc4random()%255/255.0 green:arc4random()%255/255.0 blue:arc4random()%255/255.0 alpha:1];
    btn.frame=CGRectMake(arc4random()%(NSInteger)([UIScreen mainScreen].bounds.size.width), arc4random()%(NSInteger)([UIScreen mainScreen].bounds.size.height), 30, 30);
    btn.layer.cornerRadius=15;
    btn.clipsToBounds=YES;
    [self.view addSubview:btn];
    CAKeyframeAnimation *an=[CAKeyframeAnimation animation];
    an.keyPath=@"position";
    an.values=pathArr;
    an.duration=10;
    an.delegate=self;
    an.removedOnCompletion=NO;
    an.fillMode=kCAFillModeForwards;
    [btn.layer addAnimation:an forKey:nil];
}
-(void)decletcircle{
    NSArray *arr=[self.view subviews];
    for (UIView *v in arr) {
        if ([v isKindOfClass:[UIButton class]]) {
            [v removeFromSuperview];
        }
    }
}
-(void)play{
    
    XDCache *Manager=[XDCache defoultXDCahe];
    NSString *size=[NSString stringWithFormat:@"%lu",(unsigned long)[Manager getCacheSize]-68];
    self.sizeLabel.text=[NSString stringWithFormat:@"缓存大小：%@KB",size];
     _timeLabel.text=@"00:00/00:00";
    if(_player){
        _player=nil;
    }
   _player= [[AVAudioPlayer alloc]initWithData:_data error:nil];
    self.Lovebutton.enabled=YES;
    // 设置音频播放器委托
    _player.delegate = self;
    [_player setNumberOfLoops:-1];
    // 加载本地资源到内存
    [_player prepareToPlay];
    [self.timer invalidate];
    self.timer=nil;
   self.timer=[NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(updateCD) userInfo:nil repeats:YES];
    [_player play];
}
-(void)Net{
   AFHTTPRequestOperationManager * _manager=[AFHTTPRequestOperationManager manager];
    _manager.responseSerializer=[AFHTTPResponseSerializer serializer];
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
    self.activeView.hidden=NO;
    self.Lovebutton.enabled=NO;
    [_manager GET:_url parameters:nil success:^(AFHTTPRequestOperation * _Nonnull operation, id  _Nonnull responseObject) {
        self.activeView.hidden=YES;
        [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
        NSDictionary *dic=[NSJSONSerialization JSONObjectWithData:responseObject options:0 error:nil];
        _CDurl=[NSURL URLWithString:dic[@"object"][@"dc_musicurl"]];
        self.tCDname=dic[@"object"][@"dc_musicname"];
        self.tCdid=dic[@"object"][@"dc_musiccode"];
        self.tAuthor=dic[@"object"][@"dc_singername"];
        [self playCD];

    } failure:^(AFHTTPRequestOperation * _Nonnull operation, NSError * _Nonnull error) {
        NSLog(@"%@",error);
        [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
    }];
}
- (IBAction)play:(id)sender {
    [_player play];
    [self.timer invalidate];
    self.timer=nil;
     self.timer=[NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(updateCD) userInfo:nil repeats:YES];
}
- (IBAction)pause:(id)sender {
    [_player pause];
    [self decletcircle];
    [self.timer invalidate];
    
}
- (IBAction)loveCD:(id)sender {
    UINavigationController *p=self.navigationController.rdv_tabBarController.viewControllers[2];
    LoveViewController  *play=p.viewControllers[0];
    NSError *erro=nil;
    [self prepareForCoreData];
    for (Mymusic *mmc in _CoredataArr) {
        if ([mmc.mid isEqualToString:self.Cdid]) {
            self.alerLabel.text=@"已收藏！";
            self.alerLabel.hidden=NO;
            [self performSelector:@selector(disapp) withObject:self afterDelay:2];
            return;
        }
    }
    Mymusic  *mc=[NSEntityDescription insertNewObjectForEntityForName:@"Mymusic" inManagedObjectContext:_context];
    mc.cd=_data;
    mc.title=self.CDname;
    mc.author=self.Author;
    mc.mid=self.Cdid;
    BOOL isinset=[_context save:&erro];
    if (isinset) {
          [play insertMymusic];
        [self prepareForCoreData];
        self.alerLabel.text=@"收藏成功！！！";
        self.alerLabel.hidden=NO;
        [self performSelector:@selector(disapp) withObject:self afterDelay:2];
    }else{
        NSLog(@"%@",erro);
    }
}
-(void)disapp{
[UIView animateWithDuration:2 animations:^{
    self.alerLabel.hidden=YES;
}];
}
@end
