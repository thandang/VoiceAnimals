//
//  NSString+Util.h
//  AlphaOmega
//
//  Created by Dang Thanh Than on 6/24/14.
//  Copyright (c) 2014 Apide Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString(Util)
+ (NSString *)stringWithBase64EncodedString:(NSString *)string;
- (NSString *)base64EncodedStringWithWrapWidth:(NSUInteger)wrapWidth;
- (NSString *)base64EncodedString;
- (NSString *)base64DecodedString;
- (NSData *)base64DecodedData;
- (NSString *) trimmingStringByCharacterInSet;

- (NSString *) removeSpace;

- (NSString *)escapeString;
- (NSString *)escapeStringFromUrlEncoded;
- (NSString *)trimString;

- (NSUInteger)characterCount;
- (NSUInteger)byteCount;

- (NSString *) md5;



@end
