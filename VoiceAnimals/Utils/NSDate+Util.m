//
//  NSDate+Util.m
//  AlphaOmega
//
//  Created by Dang Thanh Than on 8/26/14.
//  Copyright (c) 2014 Apide Inc. All rights reserved.
//

#import "NSDate+Util.h"

@implementation NSDate (Util)


- (NSDate *) toLocalTime {
    NSTimeZone *tz = [NSTimeZone localTimeZone];
    NSInteger seconds = [tz secondsFromGMTForDate: self];
    return [NSDate dateWithTimeInterval: seconds sinceDate: self];
}

- (NSDate *) toGlobalTime {
    NSTimeZone *tz = [NSTimeZone localTimeZone];
    NSInteger seconds = -[tz secondsFromGMTForDate: self];
    return [NSDate dateWithTimeInterval: seconds sinceDate: self];
}

@end
