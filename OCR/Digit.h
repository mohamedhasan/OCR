//
//  Digit.h
//  OCR
//
//  Created by Mohamed Hassan on 1/25/19.
//  Copyright © 2019 Hassan. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol DigitCharacterMappingProtocol <NSObject>

- (NSNumber *)numberForDigit:(NSString *)charDigit;

@end

@interface Digit : NSObject

@property(weak) id <DigitCharacterMappingProtocol> delegate;
@property(nonatomic)BOOL error;

+ (Digit *)digitWithWidth:(NSInteger)width height:(NSInteger)height nameSpace:(NSString *)nameSpace;
- (void)addDigitData:(NSString *)data verticalIndex:(NSInteger)index;
- (NSNumber *)matrixNumberRepresesntation;

@end

NS_ASSUME_NONNULL_END
