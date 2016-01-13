//
//  AppDelegate.m
//  Property
//
//  Created by 张齐朴 on 15/6/3.
//  Copyright (c) 2015年 张齐朴. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@property (weak) IBOutlet NSWindow *window;

@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // Insert code here to initialize your application
    
    
}

- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}

- (IBAction)buttonAction:(id)sender
{
    self.textView.string = @"123";
    
    [self generateCode];
}

- (void)generateCode
{
    NSMutableString *ms = [NSMutableString stringWithString:@""];
    NSString *source = self.textViewSource.string;
    
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:[source dataUsingEncoding:NSUTF8StringEncoding] options:NSJSONReadingMutableContainers error:nil];
    
    [dic enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
       
        
        NSString *className = [obj className];
        NSString *type1 = nil;
        NSString *type2 = nil;
        
        if ([className containsString:@"NSArray"])
        {
            type1 = @"NSArray *";
            type2 = @"strong";
        }
        else if ([className containsString:@"NSDictionary"])
        {
            type1 = @"NSDictionary *";
            type2 = @"strong";
        }
        
        else if ([className containsString:@"Number"])
        {
            type1 = @"NSNumber *";
            type2 = @"assign";
        }
        else if ([className containsString:@"Boolean"])
        {
            type1 = @"BOOL ";
            type2 = @"assign";
        }
        else
        {
            type1 = @"NSString *";
            type2 = @"copy";
        }
        
        /* @property (nonatomic, copy) NSString *ii; */
        [ms appendFormat:@"\n@property (nonatomic, %@) ", type2];
        [ms appendFormat:@"%@%@;", type1, key];
        
        NSLog(@"key : %@ ---- value type : %@", key, [obj className]);
        
    }];
    
    self.textView.string = ms;
}

@end
