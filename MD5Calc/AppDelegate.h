//
//  AppDelegate.h
//  test
//
//  Created by Lancy on 8/10/12.
//  Copyright (c) 2012 Lancy. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface AppDelegate : NSObject <NSApplicationDelegate>

@property (assign) IBOutlet NSWindow *window;

@property (unsafe_unretained) IBOutlet NSTextView *inputTextView;
@property (unsafe_unretained) IBOutlet NSTextView *systemTextView;
@property (unsafe_unretained) IBOutlet NSTextView *myTextView;


- (IBAction)pushButton:(id)sender;

@end
