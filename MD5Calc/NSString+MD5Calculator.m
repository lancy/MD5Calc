//
//  NSString+MD5Calculator.m
//  MD5 Calculator
//
//  Created by Lancy on 8/10/12.
//  Copyright (c) 2012 Lancy. All rights reserved.
//

#import "NSString+MD5Calculator.h"
#import <CommonCrypto/CommonDigest.h>


#define INIT_DATA_A (unsigned long)0x67452301L
#define INIT_DATA_B (unsigned long)0xefcdab89L
#define INIT_DATA_C (unsigned long)0x98badcfeL
#define INIT_DATA_D (unsigned long)0x10325476L

@implementation NSString (MD5Calculator)

+ (NSString *)MD5StringFromData:(NSData *)data
{
    unsigned char result[16];
    CC_MD5( data.bytes, (unsigned int)data.length, result ); // This is the md5 call
    return [NSString stringWithFormat:
            @"%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x",
            result[0], result[1], result[2], result[3],
            result[4], result[5], result[6], result[7],
            result[8], result[9], result[10], result[11],
            result[12], result[13], result[14], result[15]
            ];
}

+ (NSString *)MD5StringFromDataUseMyImplementation:(NSData *)data
{
    
    NSLog(@"Step 1 append padded");
    NSUInteger bitsLength = data.length * 8;
    NSUInteger appendLength = (448 - bitsLength % 512) / 8;
    NSMutableData *newData = [data mutableCopy];
    NSLog(@"before = %@", newData);
    
    if (appendLength != 0) {
        Byte begin[1] = {0b10000000};
        [newData increaseLengthBy:appendLength];
        
        NSRange range = {data.length, 1};
        [newData replaceBytesInRange:range withBytes:begin];
    }
    NSLog(@"After = %@", newData);
    
    NSLog(@"Step 2 append length");
    int64_t appendLengt = bitsLength;
    [newData appendBytes:&appendLength length:sizeof(int64_t)];
    NSLog(@"After = %@", newData);
    

    //r specifies the per-round shift amounts
    unsigned int r[64] = {
        7, 12, 17, 22,  7, 12, 17, 22,  7, 12, 17, 22,  7, 12, 17, 22,
        5,  9, 14, 20,  5,  9, 14, 20,  5,  9, 14, 20,  5,  9, 14, 20,
        4, 11, 16, 23,  4, 11, 16, 23,  4, 11, 16, 23,  4, 11, 16, 23,
        6, 10, 15, 21,  6, 10, 15, 21,  6, 10, 15, 21,  6, 10, 15, 21,
    };
    
    //Use binary integer part of the sines of integers as constants:
    unsigned int k[64] = {
        0xd76aa478, 0xe8c7b756, 0x242070db, 0xc1bdceee,
        0xf57c0faf, 0x4787c62a, 0xa8304613, 0xfd469501,
        0x698098d8, 0x8b44f7af, 0xffff5bb1, 0x895cd7be,
        0x6b901122, 0xfd987193, 0xa679438e, 0x49b40821,
        0xf61e2562, 0xc040b340, 0x265e5a51, 0xe9b6c7aa,
        0xd62f105d, 0x02441453, 0xd8a1e681, 0xe7d3fbc8,
        0x21e1cde6, 0xc33707d6, 0xf4d50d87, 0x455a14ed,
        0xa9e3e905, 0xfcefa3f8, 0x676f02d9, 0x8d2a4c8a,
        0xfffa3942, 0x8771f681, 0x6d9d6122, 0xfde5380c,
        0xa4beea44, 0x4bdecfa9, 0xf6bb4b60, 0xbebfbc70,
        0x289b7ec6, 0xeaa127fa, 0xd4ef3085, 0x04881d05,
        0xd9d4d039, 0xe6db99e5, 0x1fa27cf8, 0xc4ac5665,
        0xf4292244, 0x432aff97, 0xab9423a7, 0xfc93a039,
        0x655b59c3, 0x8f0ccc92, 0xffeff47d, 0x85845dd1,
        0x6fa87e4f, 0xfe2ce6e0, 0xa3014314, 0x4e0811a1,
        0xf7537e82, 0xbd3af235, 0x2ad7d2bb, 0xeb86d391
    };

    return [[NSString alloc] initWithData:newData encoding:NSStringEncodingConversionAllowLossy];
}



@end
