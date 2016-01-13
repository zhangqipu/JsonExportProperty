//
//  AppDelegate.h
//  Property
//
//  Created by 张齐朴 on 15/6/3.
//  Copyright (c) 2015年 张齐朴. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface AppDelegate : NSObject <NSApplicationDelegate>

@property (unsafe_unretained) IBOutlet NSTextView *textViewSource;
@property (unsafe_unretained) IBOutlet NSTextView *textView;
- (IBAction)buttonAction:(id)sender;

@end

