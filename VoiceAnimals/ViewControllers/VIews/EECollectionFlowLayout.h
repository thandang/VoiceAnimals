//
//  EECollectionFlowLayout.h
//  EasyELife
//
//  Created by Than Dang on 4/25/15.
//  Copyright (c) 2015 Than Dang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EECollectionFlowLayout : UICollectionViewFlowLayout

@property (nonatomic, assign) UICollectionViewScrollDirection scrollDirection;

- (UICollectionViewScrollDirection) scrollDirection;

@end
