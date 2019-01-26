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
    
    [UserIO printMessage:@"Please enter ASCII File Name... \n"];
    NSString *userInput = [UserIO readInput];
    NSString *filepath;
    if (userInput.length > 0) {
      filepath = userInput;
    } else {
      filepath = @"/Users/mohamedhassan/Desktop/ocr.txt";
    }
    
    NSError *error;
    NSString *fileInput = [NSString stringWithContentsOfFile:filepath encoding:NSUTF8StringEncoding error:&error];
    
    if (error)
      NSLog(@"Error reading file: %@", error.localizedDescription);

    [[DigitsReader sharedInstance] readDefaultSettings];
    NSString *result = [[DigitsReader sharedInstance] readDigitsFromString:fileInput];
    [UserIO printMessage:result];
  }
  return 0;
}
