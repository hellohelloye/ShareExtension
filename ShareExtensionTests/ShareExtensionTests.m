//
//  ShareExtensionTests.m
//  ShareExtensionTests
//
//  Created by yye on 3/18/15.
//  Copyright (c) 2015 Yukui Ye. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>

@interface ShareExtensionTests : XCTestCase

@end

@implementation ShareExtensionTests

- (void)setUp {
    [super setUp];
    
    XCTAssertTrue(@"hiiii");
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
    XCTAssertTrue(@"eeeeee");
}

- (void)testCard {
    // This is an example of a functional test case.
    XCTAssert(YES, @"Pass");
    
    XCTAssertTrue(@"aaaaaa");
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
