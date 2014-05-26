//
//  MAGCoreDataTests.m
//  MAGCoreDataExample
//
//  Created by Andrew Petrus on 26.05.14.
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


- (void)testMAGCoreDataInstance
{
    XCTAssertNotNil([MAGCoreData instance]);
}


- (void)testPrepareCoreDataWithModelName
{
    XCTAssertNil([MAGCoreData prepareCoreData]);
}


- (void)testContext
{
    [MAGCoreData instance];
    [MAGCoreData prepareCoreData];
    XCTAssertNotNil([MAGCoreData context]);
}


- (void)testContextAfterClose
{
    [MAGCoreData instance];
    [MAGCoreData prepareCoreData];
    [MAGCoreData deleteAll];
    XCTAssertNil([MAGCoreData context]);
}

@end
