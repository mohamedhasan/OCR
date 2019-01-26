//
//  Utilities.h
//  OCR
//
//  Created by Mohamed Hassan on 1/25/19.
//  Copyright © 2019 Hassan. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Utilities : NSObject

+ (NSArray *)splitList:(NSArray *)list bySize:(NSInteger)size;
+ (NSArray *)stringToArray:(NSString *)string;

@end

NS_ASSUME_NONNULL_END
