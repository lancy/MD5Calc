//
//  AppDelegate.m
//  test
//
//  Created by Lancy on 8/10/12.
//  Copyright (c) 2012 Lancy. All rights reserved.
//

#import "AppDelegate.h"
#import "NSString+MD5Calculator.h"

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    // Insert code here to initialize your application
}

- (IBAction)pushButton:(id)sender {
    NSData *data = [self.inputTextView.textStorage.string dataUsingEncoding:NSUTF8StringEncoding];
    
    [self.systemTextView setString:[NSString MD5StringFromData:data]];
    [self.myTextView setString:[NSString MD5StringFromDataUseMyImplementation:data]];
}


@end
