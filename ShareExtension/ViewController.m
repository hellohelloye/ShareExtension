//
//  ViewController.m
//  ShareExtension
//
//  Created by yye on 3/18/15.
//  Copyright (c) 2015 Yukui Ye. All rights reserved.
//

#import "ViewController.h"
#import "ServiceManager.h"

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
    
    NSLog(@"shared context: %@", sharedText);//purpuse: to get current user's permalink from shareAction inside soundCloud app.  between string "by" - "on"
    
    [[ServiceManager sharedSingleton] updateDataFromURL:sharedText];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self updateShareContent];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
