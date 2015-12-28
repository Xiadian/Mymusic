



//
//  WelcomeModel.m
//  Music
//
//  Created by XiaDian on 15/12/23.
//  Copyright © 2015年 xue. All rights reserved.
//

#import "WelcomeModel.h"
#import "Netinterface.h"
@implementation WelcomeModel
- (instancetype)init
{
    self = [super init];
    if (self) {
        self.labelArr=@[@"起床",@"睡觉",@"在路上",@"工作",@"阅读",@"运动",@"下午茶"];
        self.imageArr=@[@"getUpButton",@"sleepButton",@"onTheWayButton",@"workButton",@"readButton",@"actionButton",@"afternoonButton"];
   self.bgImageArr=@[@"getUP_ls",@"sleep_ls",@"ontheway_ls",@"work_ls",@"read_ls",@"run_ls",@"afternoon_ls"];
        self.urlArr=@[KGetUpURL,KSleepURL,KOnTheWayURL,KWorkURL,KReadURL,KSportsURL,KAfternoonURL];
    }
    return self;
}
@end
