//
//  Utilities.m
//  OCR
//
//  Created by Mohamed Hassan on 1/25/19.
//  Copyright © 2019 Hassan. All rights reserved.
//

#import "Utilities.h"

@implementation Utilities

+ (NSArray *)splitList:(NSArray *)list bySize:(NSInteger)size
{
  NSMutableArray *result = [NSMutableArray array];
  
  NSUInteger remaining = [list count];
  int j = 0;
  
  while(remaining >= size) {
    NSRange range = NSMakeRange(j, size);
    NSArray *subarray = [list subarrayWithRange:range];
    [result addObject:subarray];
    remaining-=range.length;
    j+=range.length;
  }
  
  return [NSArray arrayWithArray:result];
}

+ (NSArray *)stringToArray:(NSString *)string
{
  NSMutableArray *array = [NSMutableArray new];
  const char *charList = string.UTF8String;
  for (int i = 0; i < string.length ; i++) {
    array[i] = [NSString stringWithFormat:@"%c",charList[i]];
  }
  return [NSArray arrayWithArray:array];
}

@end
