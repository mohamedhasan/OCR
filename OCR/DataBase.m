//
//  DataBase.m
//  OCR
//
//  Created by Mohamed Hassan on 1/26/19.
//  Copyright © 2019 Hassan. All rights reserved.
//

#import "DataBase.h"
#import "Resources.h"

@interface DataBase ()
{
  NSDictionary *_preDefinedDigits;
  NSDictionary *_charMapping;
}
@end

@implementation DataBase

static DataBase *g_sharedInstance = nil;

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

- (instancetype)init
{
  self = [super init];
  if (self) {
    _preDefinedDigits = DB_Digits;
    _charMapping = DB_Mapping;
  }
  return self;
}

- (NSDictionary *)numberCharMapping
{
  return _charMapping;
}

- (NSNumber *)searchDigitsForMatrix:(NSNumber *)serializedMatrix
{
  return _preDefinedDigits[serializedMatrix];
}
@end
