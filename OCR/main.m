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
    NSString *filepath = [UserIO readInput];
    
    NSError *error;
    NSString *fileInput = [NSString stringWithContentsOfFile:filepath encoding:NSUTF8StringEncoding error:&error];
    
    if (error) {
      [UserIO printMessage:[NSString stringWithFormat:@"Error reading file: %@", error.localizedDescription]];
      return 0;
    }

    [[DigitsReader sharedInstance] readDefaultSettings];
    NSString *result = [[DigitsReader sharedInstance] readDigitsFromString:fileInput];
    [UserIO printMessage:result];
  }
  return 0;
}
