//
//  DigitsReader.m
//  OCR
//
//  Created by Mohamed Hassan on 1/25/19.
//  Copyright © 2019 Hassan. All rights reserved.
//

#import "DigitsReader.h"
#import "Utilities.h"
#import "Digit.h"

@interface DigitsReader()
{
  NSString *_currentString;
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
  self.allowedNameSpace = @" _I";
}

- (NSString *)readDigitsFromString:(NSString *)string
{
  _currentString = string;
  
  NSArray *fileLines = [self extractLinesFromString:_currentString];
  NSArray *digitLines = [Utilities splitList:fileLines bySize:self.linePerDigit];
  
  NSMutableArray *digits = [NSMutableArray new];
  for (NSArray *line in digitLines) {
    [digits addObjectsFromArray:[self extractDigitsFromLine:line]];
  }
  return @"";
}

- (NSArray *)extractDigitsFromLine:(NSArray *)line
{
  NSString *firstLine = line.firstObject;
  NSMutableArray *digits = [NSMutableArray new];
  int len = 0;
  while (len <= firstLine.length) {
    Digit *digit = [Digit digitWithWidth:self.digitWidth height:self.linePerDigit];
    
    for (int i = 0; i < line.count; i++) {
      NSString *digitLine = line[i];
      NSString *digitSubString = [digitLine substringWithRange:NSMakeRange(len, self.digitWidth)];
      [digit addDigitData:digitSubString verticalIndex:i];
    }
    
    [digits addObject:digit];
    len += self.digitWidth + self.delimits;
  }
  return digits;
}

- (NSArray *)extractLinesFromString:(NSString *)string
{
  return [string componentsSeparatedByString:@"\n"];
}

@end
