//
//  DataBase.h
//  OCR
//
//  Created by Mohamed Hassan on 1/26/19.
//  Copyright © 2019 Hassan. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN


@interface DataBase : NSObject

+ (instancetype)sharedInstance;

- (NSDictionary *)numberCharMapping;
- (NSNumber *)searchDigitsForMatrix:(NSNumber *)serializedMatrix;

@end

NS_ASSUME_NONNULL_END
