//
//  BaseController.h
//  Music
//
//  Created by XiaDian on 15/12/23.
//  Copyright © 2015年 xue. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Netinterface.h"
#import "AFNetworking.h"
#import "MusicListModel.h"
#import "XDtableView.h"
#import "RDVTabBarController.h"
@interface BaseController : UIViewController
{
    NSManagedObjectContext *_context;
    NSMutableArray *_CoredataArr;
}
-(UIBarButtonItem *)backBarbutttonWithTarget:(id)target action:(SEL)action;
-(void)backbutton:(UIButton *)btn;
-(void)prepareForCoreData;
@end
