//
//  UILabel+DynamicHeight.m
//  AlphaOmega
//
//  Created by Dang Thanh Than on 30/10/14.
//  Copyright (c) 2014 Apide Inc. All rights reserved.
//

#import "UILabel+DynamicHeight.h"

@implementation UILabel (DynamicHeight)

/**
 *  Returns the size of the Label
 *
 *  @param aLabel To be used to calculte the height
 *
 *  @return size of the Label
 */
- (CGSize) sizeOfMultiLineLabel{
    
    NSAssert(self, @"UILabel was nil");
    
    //Label text
    NSString *aLabelTextString = [self text];
    
    //Label font
    UIFont *aLabelFont = [self font];
    
    //Width of the Label
    CGFloat aLabelSizeWidth = self.frame.size.width;
    
    return [aLabelTextString boundingRectWithSize:CGSizeMake(aLabelSizeWidth, MAXFLOAT)
                                              options:NSStringDrawingUsesLineFragmentOrigin
                                           attributes:@{
                                                        NSFontAttributeName : aLabelFont
                                                        }
                                              context:nil].size;
        
    
    return [self bounds].size;
}

@end
