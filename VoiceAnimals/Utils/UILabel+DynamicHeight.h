//
//  UILabel+DynamicHeight.h
//  AlphaOmega
//
//  Created by Dang Thanh Than on 30/10/14.
//  Copyright (c) 2014 Apide Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (DynamicHeight)
/**
 *  Returns the size of the Label
 *
 *  @param aLabel To be used to calculte the height
 *
 *  @return size of the Label
 */
- (CGSize) sizeOfMultiLineLabel;
@end
