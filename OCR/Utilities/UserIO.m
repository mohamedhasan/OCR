//
//  UserIO.m
//  OCR
//
//  Created by Mohamed Hassan on 1/25/19.
//  Copyright © 2019 Hassan. All rights reserved.
//

#import "UserIO.h"

@implementation UserIO

+ (NSString *)readInput
{
  NSFileHandle *handle = [NSFileHandle fileHandleWithStandardInput];
  NSData *data = handle.availableData;
  NSString *input = [[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
  NSCharacterSet *set = [NSCharacterSet newlineCharacterSet];
  NSString *userInput = [input stringByTrimmingCharactersInSet:set];
  return userInput;
}

+ (void)printMessage:(NSString *)message
{
  NSData *data = [message dataUsingEncoding:NSUTF8StringEncoding];
  NSFileHandle *handle = [NSFileHandle fileHandleWithStandardOutput];
  [handle writeData:data];
}

@end
