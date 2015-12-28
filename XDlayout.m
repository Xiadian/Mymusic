




//
//  XDlayout.m
//  Music
//
//  Created by XiaDian on 15/12/23.
//  Copyright © 2015年 xue. All rights reserved.
//

#import "XDlayout.h"
#define XDcircle(x) x * M_PI / 90.0
@implementation XDlayout
-(NSArray<UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect{
    
    NSMutableArray *array = [NSMutableArray array];
    
    NSInteger count = [self.collectionView numberOfItemsInSection:0];
    for (int i=0; i<count; i++) {
        UICollectionViewLayoutAttributes *attrs = [self layoutAttributesForItemAtIndexPath:[NSIndexPath indexPathForItem:i inSection:0]];
        [array addObject:attrs];
    }
    return array;
    
}
-(UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath{
    UICollectionViewLayoutAttributes *attrs = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
    attrs.size = CGSizeMake(80,90);
    NSInteger index = indexPath.item;
    CGFloat radius = 120;
    // 圆心
    CGFloat circleX = self.collectionView.frame.size.width * 0.5;

    CGFloat circleY = self.collectionView.frame.size.height * 0.4;
   
    NSInteger count = [self.collectionView numberOfItemsInSection:0];

    CGFloat singleItemAngle = 360.0 / count;
    // 计算各个环绕的图片center
    attrs.center = CGPointMake(circleX + radius * cosf(XDcircle(singleItemAngle * index)), circleY - radius * sinf(XDcircle(singleItemAngle * index)));
    return attrs;
}

@end
