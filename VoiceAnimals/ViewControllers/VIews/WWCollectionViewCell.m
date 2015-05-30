//
//  WWCollectionViewCell.m
//  WhereWeWere
//
//  Created by Than Dang on 5/26/15.
//  Copyright (c) 2015 Than Dang. All rights reserved.
//

#import "WWCollectionViewCell.h"
#import "WWPhoto.h"

@interface WWCollectionViewCell() {
    __weak UIImageView  *_img;
    __weak UILabel  *_lblName;
}

@end

@implementation WWCollectionViewCell

- (instancetype) initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        if (!_img) {
            UIImageView *img = [[UIImageView alloc] initWithFrame:CGRectMake(0.0, 0.0, frame.size.width, frame.size.height)];
            [self addSubview:img];
            _img = img;
        }
        
        if (!_lblName) {
            UILabel *lbl = [[UILabel alloc] initWithFrame:CGRectMake(0.0, (frame.size.height - 21.0), frame.size.width, 21.0)];
            lbl.textAlignment = NSTextAlignmentCenter;
            lbl.font = kDefaultFont;
            lbl.textColor = kColor_Name;
            [self addSubview:lbl];
            _lblName = lbl;
        }
    }
    return self;
}

- (void) configPhoto:(WWPhoto *)photo {
    if (photo.name) {
        _lblName.text = photo.name;
        UIImage *image = [WWUtils imageWithName:photo.name];
        [_img setImage:image];
        photo.image = image;
    }
}

@end
