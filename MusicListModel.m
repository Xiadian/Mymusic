



//
//  MusicListModel.m
//  Music
//
//  Created by XiaDian on 15/12/24.
//  Copyright © 2015年 xue. All rights reserved.
//

#import "MusicListModel.h"

@implementation MusicListModel

-(instancetype)initWith:(NSDictionary *)dic{
    self = [super init];
    if (self) {
        self.artist=dic[@"artist"];
        self.mid=dic[@"mid"];
        self.title=dic[@"title"];
        self.version=[(NSNumber *)dic[@"version"] stringValue];
    }
    return self;


}
@end
