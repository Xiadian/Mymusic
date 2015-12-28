//
//  XDCache.h
//  Music
//
//  Created by XiaDian on 15/12/24.
//  Copyright © 2015年 xue. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XDCache : NSObject
@property(nonatomic,copy)NSString *mid;
+(instancetype)defoultXDCahe;
-(BOOL)writeToFileWith:(NSString *)mid withData:(NSData *)data;
-(NSData *)getFromDataWith:(NSString *)mid;
-(void)deleteCache;
-(NSUInteger)getCacheSize;
@end
