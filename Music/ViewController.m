//
//  ViewController.m
//  Music
//
//  Created by XiaDian on 15/12/23.
//  Copyright © 2015年 xue. All rights reserved.
//

#import "ViewController.h"
#import "RDVTabBarItem.h"
#import "RDVTabBar.h"
#import "LoveViewController.h"
#import "WelcomeViewController.h"
#import "HotViewController.h"
#import "PlayViewController.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self getFrame];

}
-(void)getFrame{
    WelcomeViewController *firtbar=[[WelcomeViewController alloc]init];
    
    UINavigationController *firstNavigationController = [[UINavigationController alloc]
                                                         initWithRootViewController:firtbar];
    firtbar.navigationItem.title=@"欢迎";
   
    HotViewController *secondViewController = [[HotViewController alloc] init];
    UINavigationController *secondNavigationController = [[UINavigationController alloc]
                                                          initWithRootViewController:secondViewController];
    secondViewController.navigationItem.title=@"热榜";

    LoveViewController *thirdViewController = [[LoveViewController alloc] init];
    UINavigationController *thirdNavigationController = [[UINavigationController alloc]
                                                         initWithRootViewController:thirdViewController];
    thirdViewController.navigationItem.title=@"收藏";

    
    PlayViewController *fourthViewController = [[PlayViewController alloc] init];
    UINavigationController *fourthNavigationController = [[UINavigationController alloc]
                                                          initWithRootViewController:fourthViewController];
    fourthViewController.navigationItem.title=@"播放";
    [self setViewControllers:@[firstNavigationController, secondNavigationController,
                               thirdNavigationController,fourthNavigationController]];
    
    [self customizeTabBarForController:self];
    
}
-(UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleLightContent;
}

- (void)customizeTabBarForController:(RDVTabBarController *)tabBarController
{
    // tabBar图片
    NSArray *tabBarItemImages = @[@"tab_welcome", @"tab_hot", @"tab_save",@"tab_play"];
    
      NSInteger index = 0;
      [[tabBarController tabBar] setHeight:50];
    [tabBarController tabBar].backgroundColor=[UIColor redColor];
    
    for (RDVTabBarItem *item in [[tabBarController tabBar] items])
    {   item.imagePositionAdjustment=UIOffsetMake(0, 0);
             UIImage *selectedimage = [UIImage imageNamed:[NSString stringWithFormat:@"%@_hl",
                                                      [tabBarItemImages objectAtIndex:index]]];
        
        UIImage *unselectedimage = [UIImage imageNamed:[NSString stringWithFormat:@"%@",
                                                        [tabBarItemImages objectAtIndex:index]]];
        [item setFinishedSelectedImage:selectedimage withFinishedUnselectedImage:unselectedimage];
        index++;
    }
    
}


@end
