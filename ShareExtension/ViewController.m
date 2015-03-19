//
//  ViewController.m
//  ShareExtension
//
//  Created by yye on 3/18/15.
//  Copyright (c) 2015 Yukui Ye. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (id)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super initWithCoder:aDecoder]) {
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(userDefaultsDidChange:)
                                                     name:NSUserDefaultsDidChangeNotification
                                                   object:nil];
    }
    return self;
}

- (void)userDefaultsDidChange:(NSNotification *)notification {
    [self updateShareContent];
}

- (void)updateShareContent {
    NSUserDefaults *sharedDefaults = [[NSUserDefaults alloc] initWithSuiteName:@"group.shareExtension.YE"];
    NSString *sharedText = [sharedDefaults objectForKey:@"stringKey"];
    
    NSLog(@"shared context: %@", sharedText);//purpuse: to get current user's permalink from shareAction inside soundCloud app.
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self updateShareContent];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
