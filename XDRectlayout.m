
//
//  XDRectlayout.m
//  Music
//
//  Created by XiaDian on 15/12/23.
//  Copyright © 2015年 xue. All rights reserved.
//

#import "XDRectlayout.h"
#define XDcircle(x) x * M_PI / 90.0
@implementation XDRectlayout
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
    attrs.size = CGSizeMake(180, 200);
    attrs.center = CGPointMake(self.collectionView.frame.size.width * 0.5, self.collectionView.frame.size.height * 0.3);
    NSInteger index = indexPath.item;
    CGFloat angles[] ={0,15,30,45,60};
    NSInteger count = [self.collectionView numberOfItemsInSection:0];
    if (index >= 5) {
        attrs.hidden = YES;
    } else {
        attrs.transform = CGAffineTransformMakeRotation(XDcircle(angles[index]));
        attrs.zIndex = count - index;
    }
    return attrs;
}
@end
