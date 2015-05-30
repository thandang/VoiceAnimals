//
//  Util.h
//  AlphaOmega
//
//  Created by Dang Thanh Than on 6/24/14.
//  Copyright (c) 2014 Apide Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSData(Util)
+ (NSData *)dataWithBase64EncodedString:(NSString *)string;
- (NSString *)base64EncodedStringWithWrapWidth:(NSUInteger)wrapWidth;
- (NSString *)base64EncodedString;

@end
