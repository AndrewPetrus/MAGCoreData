//
//  MAGCoreDataTests.m
//  MAGCoreDataTests
//
//  Created by Dakhno Aleksandr on 5/24/14.
//  Copyright (c) 2014 MadAppGang. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "MAGCoreData.h"

@interface MAGCoreDataTests : XCTestCase

@end

@implementation MAGCoreDataTests

- (void)setUp
{
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown
{
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testSingeltonCanBeCreated {
    id instance = [MAGCoreData instance];

    XCTAssertNotNil(instance, @"instnce did create");
}

@end