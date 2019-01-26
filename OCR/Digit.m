//
//  Digit.m
//  OCR
//
//  Created by Mohamed Hassan on 1/25/19.
//  Copyright © 2019 Hassan. All rights reserved.
//

#import "Digit.h"
#import "Utilities.h"
#import "DataBase.h"

@interface Digit ()

@property (nonatomic)NSInteger width;
@property (nonatomic)NSInteger height;
@property (nonatomic)NSMutableArray *matrix;
@property (nonatomic) NSString *allowedNameSpace;

@end

@implementation Digit

+ (Digit *)digitWithWidth:(NSInteger)width height:(NSInteger)height nameSpace:(NSString *)nameSpace
{
  Digit *digit = [Digit new];
  digit.width = width;
  digit.height = height;
  digit.allowedNameSpace = nameSpace;
  
  //Create Matrix with (width x Height) dimension
  digit.matrix = [[NSMutableArray alloc] initWithCapacity:digit.height];
  
  for (NSInteger i = 0; i < digit.height; i++) {
    [digit.matrix addObject:[[NSMutableArray alloc] initWithCapacity:digit.width]];
  }
  
  return digit;
}

- (void)addDigitData:(NSString *)data verticalIndex:(NSInteger)index
{
  self.matrix[index] = [Utilities stringToArray:data];
}

- (NSNumber *)matrixNumberRepresesntation
{
  NSString *stringRepresesntation = @"";
  for (NSArray *row in self.matrix) {
    for (NSString *digit in row) {
      NSNumber *num = [self.delegate numberForDigit:digit];
      if (!num) {
        self.error = YES;
        return nil;
      }
      stringRepresesntation = [stringRepresesntation stringByAppendingString:[NSString stringWithFormat:@"%@",num]];
    }
  }
  return @(stringRepresesntation.doubleValue);
}
@end
