//
//  NSDictionary+NotNullValue.m
//  Metermaid
//
//  Created by Dang Thanh Than on 1/26/15.
//  Copyright (c) 2015 Apide. All rights reserved.
//

#import "NSDictionary+NotNullValue.h"

@implementation NSDictionary (NotNullValue)

- (id) stringNotNullForKey:(id)key { //Return string value
    id string = [self objectForKey:key];
    if (!string || ![string isKindOfClass:[NSString class]]) {
        return @"";
    }
    return string;
}

- (id) dictionaryNotNullForKey:(id)key { //Return dictionary
    id dict = [self objectForKey:key];
    if (!dict || ![dict isKindOfClass:[NSDictionary class]]) {
        return nil;
    }
    return dict;
}

- (id) arrayNotNullForKey:(id)key { //Return array
    id array = [self objectForKey:key];
    if (!array || ![array isKindOfClass:[NSArray class]]) {
        return nil;
    }
    return array;
}

- (id) objectNotNullForKey:(id)key { //Return an object
    id object = self[key];
    if ([object isKindOfClass:[NSNull class]]) {
        return nil;
    }
    return object;
}

@end
