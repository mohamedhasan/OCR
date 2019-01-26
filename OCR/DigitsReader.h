//
//  DigitsReader.h
//  OCR
//
//  Created by Mohamed Hassan on 1/25/19.
//  Copyright © 2019 Hassan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Digit.h"

NS_ASSUME_NONNULL_BEGIN

@interface DigitsReader : NSObject <DigitCharacterMappingProtocol>

@property (nonatomic) NSInteger digitWidth;
@property (nonatomic) NSInteger linePerDigit;
@property (nonatomic) NSInteger delimits;
@property (nonatomic) NSString *allowedNameSpace;
@property (nonatomic) NSString *errorMessage;

+ (instancetype)sharedInstance;
- (void)readDefaultSettings;
- (NSString *)readDigitsFromString:(NSString *)string;

@end

NS_ASSUME_NONNULL_END
