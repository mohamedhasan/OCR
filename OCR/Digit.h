//
//  Digit.h
//  OCR
//
//  Created by Mohamed Hassan on 1/25/19.
//  Copyright © 2019 Hassan. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Digit : NSObject

+ (Digit *)digitWithWidth:(NSInteger)width height:(NSInteger)height nameSpace:(NSString *)nameSpace;
- (void)addDigitData:(NSString *)data verticalIndex:(NSInteger)index;
@end

NS_ASSUME_NONNULL_END
