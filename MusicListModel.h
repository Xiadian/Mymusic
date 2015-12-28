//
//  MusicListModel.h
//  Music
//
//  Created by XiaDian on 15/12/24.
//  Copyright © 2015年 xue. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MusicListModel : NSObject
@property(nonatomic,copy)NSString *artist;
@property(nonatomic,copy)NSString *mid;
@property(nonatomic,copy)NSString *title;
@property(nonatomic,copy)NSString *version;
@property(nonatomic,copy)NSString *dc_musicurl;
-(instancetype)initWith:(NSDictionary *)dic;
@end
