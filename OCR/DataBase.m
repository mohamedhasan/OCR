//
//  DataBase.m
//  OCR
//
//  Created by Mohamed Hassan on 1/26/19.
//  Copyright © 2019 Hassan. All rights reserved.
//

#import "DataBase.h"

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
    _preDefinedDigits =
    @{
      @131212232 : @0,
      @111112112 : @1,
      @131132231 : @2,
      @131132132 : @3,
      @111232112 : @4,
      @131231132 : @5,
      @131231232 : @6,
      @131112112 : @7,
      @131232232 : @8,
      @131232132 : @9
              };
    _charMapping = @{@" ":@1,@"I":@2,@"_":@3};
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
