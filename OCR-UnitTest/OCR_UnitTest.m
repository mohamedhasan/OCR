//
//  OCR_UnitTest.m
//  OCR-UnitTest
//
//  Created by Mohamed Hassan on 1/26/19.
//  Copyright © 2019 Hassan. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "DigitsReader.h"
#import "Digit.h"

#define TEST_INPUT @" _ \
\nI_ \
\n _I"


@interface OCR_UnitTest : XCTestCase

@end

@implementation OCR_UnitTest

- (void)setUp
{
    // Put setup code here. This method is called before the invocation of each test method in the class.
  [[DigitsReader sharedInstance] readDefaultSettings];
}

- (void)tearDown
{
    // Put teardown code here. This method is called after the invocation of each test method in the class.
}

- (void) testMatrixNumberRepresesntation
{
  Digit *testDigit = [Digit digitWithWidth:[DigitsReader sharedInstance].digitWidth height:[DigitsReader sharedInstance].linePerDigit nameSpace:[DigitsReader sharedInstance].allowedNameSpace];
  testDigit.delegate = [DigitsReader sharedInstance];
  //Example on the digit 0(Zero)
  [testDigit addDigitData:@" _ " verticalIndex:0];
  [testDigit addDigitData:@"I I" verticalIndex:1];
  [testDigit addDigitData:@"I_I" verticalIndex:2];
  
  NSNumber *number = testDigit.matrixNumberRepresesntation;
  XCTAssertEqual(number.doubleValue, 131212232);
}

- (void) testReadDigitsFromString
{
  NSString *result = [[DigitsReader sharedInstance] readDigitsFromString:TEST_INPUT];
  XCTAssertEqual(5, result.integerValue);
}
@end
