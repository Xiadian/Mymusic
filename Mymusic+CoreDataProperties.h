//
//  Mymusic+CoreDataProperties.h
//  Music
//
//  Created by XiaDian on 15/12/25.
//  Copyright © 2015年 xue. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "Mymusic.h"

NS_ASSUME_NONNULL_BEGIN

@interface Mymusic (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *author;
@property (nullable, nonatomic, retain) NSString *mid;
@property (nullable, nonatomic, retain) NSString *title;
@property (nullable, nonatomic, retain) NSData *cd;

@end

NS_ASSUME_NONNULL_END
