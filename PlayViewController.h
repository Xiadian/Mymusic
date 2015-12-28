//
//  PlayViewController.h
//  Music
//
//  Created by XiaDian on 15/12/23.
//  Copyright © 2015年 xue. All rights reserved.
//

#import "BaseController.h"
@interface PlayViewController : BaseController
@property(nonatomic,copy)NSString *Cdid;
@property (strong) NSString* CDname;
@property (strong) NSString* Author;
@property(nonatomic,strong)NSData *data;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activeView;
-(void)changeCD;
-(void)play;
@end
