//
//  XDtableView.h
//  Music
//
//  Created by XiaDian on 15/12/24.
//  Copyright © 2015年 xue. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface XDtableView : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *songName;

@property (weak, nonatomic) IBOutlet UILabel *author;
@property (weak, nonatomic) IBOutlet UIImageView *iconView;
@property(nonatomic,copy)NSString *mid;
@end
