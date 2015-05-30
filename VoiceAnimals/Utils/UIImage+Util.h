//
//  UIImage+Util.h
//  AlphaOmega
//
//  Created by Dang Thanh Than on 8/12/14.
//  Copyright (c) 2014 Apide Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Util)

- (CGRect)convertCropRect:(CGRect)cropRect;
- (UIImage *)croppedImage:(CGRect)cropRect;
- (UIImage *)resizedImage:(CGSize)size imageOrientation:(UIImageOrientation)imageOrientation;

@end
