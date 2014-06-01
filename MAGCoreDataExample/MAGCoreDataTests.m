//
//  MAGCoreDataTests.m
//  MAGCoreDataExample
//
//  Created by Andrew Petrus on 26.05.14.
//  Copyright (c) 2014 MadAppGang. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "MAGCoreData.h"
#import "NSManagedObjectContext+MAGCoreData.h"

#define EXP_SHORTHAND
#import "Expecta.h"

@interface MAGCoreDataTests : XCTestCase

@end

@implementation MAGCoreDataTests

- (void)setUp
{
    [super setUp];
    [MAGCoreData instance];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown
{
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
    [MAGCoreData deleteAll];
}


- (void)testMAGCoreDataInstance
{
    expect([MAGCoreData instance]).notTo.beNil();
}


- (void)testMAGCoreDataSingleton
{
    MAGCoreData *instance1 = [MAGCoreData instance];
    MAGCoreData *instance2 = [MAGCoreData instance];
    expect(instance1).to.beIdenticalTo(instance2);
}


- (void)testPrepareCoreDataWithModelName
{
    XCTAssertNil([MAGCoreData prepareCoreData]);
}


- (void)testContext
{
    [MAGCoreData prepareCoreData];
    XCTAssertNotNil([MAGCoreData context]);
}


- (void)testPersistentStore
{
    [MAGCoreData prepareCoreData];
    XCTAssertNotNil([[MAGCoreData instance] persistentStore]);
}


- (void)testContextAfterClose
{
    [MAGCoreData prepareCoreData];
    [MAGCoreData deleteAll];
    XCTAssertNil([MAGCoreData context]);
}


- (void)testBlockOperation
{
    NSManagedObjectContext *cntx = [MAGCoreData createPrivateContext];
    [cntx performBlock:^{
        sleep(1);
        expect(cntx).notTo.beNil();
    }];
}


- (void)testAsyncBlockOperation
{
    NSInteger __block a = 1;
    NSManagedObjectContext *cntx = [MAGCoreData createPrivateContext];
    [cntx performBlock:^{
        sleep(1);
        a = 2;
    }];
    expect(@(a)).will.beIdenticalTo(@(2));
}

@end
