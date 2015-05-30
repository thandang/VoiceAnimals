//
//  NSDictionary+NotNullValue.h
//  Metermaid
//
//  Created by Dang Thanh Than on 1/26/15.
//  Copyright (c) 2015 Apide. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (NotNullValue)

- (id) stringNotNullForKey:(id)key;
- (id) dictionaryNotNullForKey:(id)key;
- (id) arrayNotNullForKey:(id)key;
- (id) objectNotNullForKey:(id)key;

@end
