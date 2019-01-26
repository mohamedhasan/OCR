//
//  main.m
//  OCR
//
//  Created by Mohamed Hassan on 1/25/19.
//  Copyright © 2019 Hassan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UserIO.h"
#import "DigitsReader.h"

int main(int argc, const char * argv[]) {
  @autoreleasepool {
    
//    [UserIO printMessage:@"Please enter ASCII File Name... \n"];
//    NSString *userInput = [UserIO readInput];

    NSString *filepath = @"/Users/mohamedhassan/Desktop/ocr.txt";
    NSError *error;
    NSString *userInput = [NSString stringWithContentsOfFile:filepath encoding:NSUTF8StringEncoding error:&error];
    
    if (error)
      NSLog(@"Error reading file: %@", error.localizedDescription);

    
    [[DigitsReader sharedInstance] readDefaultSettings];
    [[DigitsReader sharedInstance] readDigitsFromString:userInput];
  }
  return 0;
}
