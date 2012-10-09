//
//  NSString+MD5Calculator.h
//  MD5 Calculator
//
//  Created by Lancy on 8/10/12.
//  Copyright (c) 2012 Lancy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (MD5Calculator)

+ (NSString *)MD5StringFromData:(NSData *)data;

+ (NSString *)MD5StringFromDataUseMyImplementation:(NSData *)data;

@end
 