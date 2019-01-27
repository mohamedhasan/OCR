//
//  DigitsReader.m
//  OCR
//
//  Created by Mohamed Hassan on 1/25/19.
//  Copyright © 2019 Hassan. All rights reserved.
//

#import "DigitsReader.h"
#import "Utilities.h"
#import "DataBase.h"

@interface DigitsReader()
{
  NSString *_currentString;
  NSDictionary *_charMapping;
}
@end

@implementation DigitsReader

static DigitsReader *g_sharedInstance = nil;

+ (instancetype)sharedInstance
{
  static dispatch_once_t onceToken;
  dispatch_once(&onceToken, ^{
    if (!g_sharedInstance) {
      g_sharedInstance = [[self alloc] init];
    }
  });
  return g_sharedInstance;
}

- (void)readDefaultSettings
{
  self.digitWidth = 3;
  self.linePerDigit = 3;
  self.delimits = 1;
  self.errorMessage = @"Error in data";
  self.allowedNameSpace = @" _I";
  _charMapping = [[DataBase sharedInstance] numberCharMapping];
}

- (NSString *)readDigitsFromString:(NSString *)string
{
  _currentString = string;
  NSArray *fileLines = [self extractLinesFromString:_currentString];
  NSArray *digitLines = [Utilities splitList:fileLines bySize:self.linePerDigit];
  
  NSString *result = @"";
  for (NSArray *line in digitLines) {
    
    NSString *printedLine;
    NSArray *lineDigits = [self extractDigitsFromLine:line];
    if (lineDigits) {
      printedLine = [self digitLineToString:lineDigits];
    } else {
      printedLine = self.errorMessage;
    }
    
    result = [result stringByAppendingString:printedLine];
    result = [result stringByAppendingString:@"\n"];
  }
  
  return result;
}

- (NSString *)digitLineToString:(NSArray *)line
{
  NSString *printedLine = @"";
  for (Digit *digit in line) {
    NSNumber *number = [[DataBase sharedInstance] searchDigitsForMatrix:digit.matrixNumberRepresesntation];
    if (!number || digit.error) {
      return self.errorMessage;
    }
    printedLine = [printedLine stringByAppendingString:[NSString stringWithFormat:@"%@",number]];
  }
  return printedLine;
}

- (NSArray *)extractDigitsFromLine:(NSArray *)line
{
  NSMutableArray *digits = [NSMutableArray new];
  int lineLength = 0;
  
  while (lineLength <= [line.firstObject length]) {
    Digit *digit = [Digit digitWithWidth:self.digitWidth height:self.linePerDigit nameSpace:self.allowedNameSpace];
    digit.delegate = self;
    for (int i = 0; i < line.count; i++) {
      
      NSString *digitLine = line[i];
      //In case of a corrupted file multiple lines would be with different lengthes
      if (digitLine.length != [line.firstObject length]) {
        return nil;
      }
      NSString *digitSubString = [digitLine substringWithRange:NSMakeRange(lineLength, self.digitWidth)];
      
      //Create Digital number Matrix
      [digit addDigitData:digitSubString verticalIndex:i];
    }
    
    [digits addObject:digit];
    lineLength += self.digitWidth + self.delimits;
  }
  return digits;
}

- (NSArray *)extractLinesFromString:(NSString *)string
{
  return [string componentsSeparatedByString:@"\n"];
}

# pragma mark DigitCharacterMappingProtocol

- (NSNumber *)numberForDigit:(NSString *)charDigit
{
  return _charMapping[charDigit];
}

@end
