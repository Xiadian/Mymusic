


//
//  XDCache.m
//  Music
//
//  Created by XiaDian on 15/12/24.
//  Copyright © 2015年 xue. All rights reserved.
//

#import "XDCache.h"

@implementation XDCache
+(instancetype)defoultXDCahe{
  static  XDCache *cache=nil;
    static dispatch_once_t Xdcache;
    dispatch_once(&Xdcache, ^{
      cache=[XDCache new];
    });
    return cache;
}
-(BOOL)writeToFileWith:(NSString *)mid withData:(NSData *)data{
    NSString *path=[NSHomeDirectory() stringByAppendingFormat:@"/Documents/CDCache/"];
    NSFileManager *manager = [NSFileManager defaultManager];
    if(![manager createDirectoryAtPath:path withIntermediateDirectories:YES attributes:nil error:0]){
        NSLog(@"创建路径失败");
        return NO;
    };
     NSString *CDPath = [NSString stringWithFormat:@"%@%@.txt",path,mid];
    return  [data writeToFile:CDPath atomically:YES];
}
-(NSData *)getFromDataWith:(NSString *)mid{

    NSString *path=[NSHomeDirectory() stringByAppendingFormat:@"/Documents/CDCache/%@.txt",mid];
    NSData *data = [NSData dataWithContentsOfFile:path];
    return data;
}
-(NSUInteger)getCacheSize{
    NSString *path=[NSHomeDirectory() stringByAppendingFormat:@"/Documents/CDCache"];
    NSFileManager *manager = [NSFileManager defaultManager];
    return (NSUInteger)[[manager attributesOfItemAtPath:path error:nil] fileSize];
}
-(void)deleteCache{
    NSString *path=[NSHomeDirectory() stringByAppendingFormat:@"/Documents/CDCache"];
    NSFileManager *manager = [NSFileManager defaultManager];
    NSArray *arr=[manager contentsOfDirectoryAtPath:path error:nil];
    for (NSString *mcStr in arr) {
        [manager removeItemAtPath:[NSString stringWithFormat:@"%@/%@",path,mcStr] error:nil];
    }
}
@end
