//
//  NSString+Util.m
//  AlphaOmega
//
//  Created by Dang Thanh Than on 6/24/14.
//  Copyright (c) 2014 Apide Inc. All rights reserved.
//

#import "NSString+Util.h"
#import "NSData+Util.h"
#import <CommonCrypto/CommonDigest.h>

@implementation NSString(Util)

//Base64
+ (NSString *)stringWithBase64EncodedString:(NSString *)string
{
    NSData *data = [NSData dataWithBase64EncodedString:string];
    if (data)
    {
        return [[self alloc] initWithData:data encoding:NSUTF8StringEncoding];
    }
    return nil;
}

- (NSString *)base64EncodedStringWithWrapWidth:(NSUInteger)wrapWidth
{
    NSData *data = [self dataUsingEncoding:NSUTF8StringEncoding allowLossyConversion:YES];
    return [data base64EncodedStringWithWrapWidth:wrapWidth];
}

- (NSString *)base64EncodedString
{
    NSData *data = [self dataUsingEncoding:NSUTF8StringEncoding allowLossyConversion:YES];
    return [data base64EncodedString];
}

- (NSString *)base64DecodedString
{
    return [NSString stringWithBase64EncodedString:self];
}

- (NSData *)base64DecodedData
{
    return [NSData dataWithBase64EncodedString:self];
}

- (NSString *)escapeString {
    CFStringRef refString = CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault,
                                                                    (CFStringRef)self,
                                                                    NULL,
                                                                    (CFStringRef)@"!*'();:@&=+$,/?%#[]",
                                                                    kCFStringEncodingUTF8);
    NSString *escapedString = [NSString stringWithString:(__bridge NSString*)refString];
    CFRelease(refString);
    return escapedString;
    
}

- (NSString *) trimmingStringByCharacterInSet {
//    return [self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    return [self stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
}

- (NSString *) removeSpace {
    return [self stringByReplacingOccurrencesOfString:@" " withString:@""];
}

- (NSString *) escapeStringFromUrlEncoded {
    NSString *work = [self escapeString];
    return [work stringByReplacingOccurrencesOfString:@"%20" withString:@"+"];
}

- (NSString *) trimString {
    NSCharacterSet *charsToTrim = [NSCharacterSet characterSetWithCharactersInString:@" \n"];
    return [self stringByTrimmingCharactersInSet:charsToTrim];
}


- (NSUInteger)characterCount {
    NSUInteger cnt = 0;
    NSUInteger index = 0;
    while (index < self.length) {
        NSRange range = [self rangeOfComposedCharacterSequenceAtIndex:index];
        cnt++;
        index += range.length;
    }
    
    return cnt;
}

- (NSUInteger)byteCount {
    return [self lengthOfBytesUsingEncoding:NSUTF8StringEncoding];
}

- (NSString *) md5 {
    const char *cStr = [self UTF8String];
    unsigned char result[16];
    CC_MD5( cStr, (unsigned int)strlen(cStr), result ); // This is the md5 call
    return [NSString stringWithFormat:
            @"%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x",
            result[0], result[1], result[2], result[3],
            result[4], result[5], result[6], result[7],
            result[8], result[9], result[10], result[11],
            result[12], result[13], result[14], result[15]
            ];
}



@end
