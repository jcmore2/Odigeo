//
//  WSManagerTest.m
//  Odigeo
//
//  Created by Fernando Canon on 28/11/14.
//  Copyright (c) 2014 Fernando Canon. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>

#define HC_SHORTHAND
#import <OCHamcrestIOS/OCHamcrestIOS.h>

#define MOCKITO_SHORTHAND
#import <OCMockitoIOS/OCMockitoIOS.h>

//SUT
#import "WSManager.h"


//Dependecies for D. Inyection
@interface WSManagerTest : XCTestCase


@end

@implementation WSManagerTest

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {
    // This is an example of a functional test case.
    XCTAssert(YES, @"Pass");
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}
- (void)testGETWsManager
{
     // given
    WSManager *wsManager =[[WSManager alloc] init];

    XCTestExpectation *readJson = [self expectationWithDescription:@"http connexion"];

    // when
    NSURL *serviceURL =[NSURL URLWithString:OdigeServiceURL];
    [wsManager fetchFlightsforURL:serviceURL withCompletionBlock:^(NSArray *tickets, NSError *error) {
        
        XCTAssertNil(error,@"something fail");
        
        if (tickets) {
            XCTAssertFalse([readJson isKindOfClass:[NSArray class]],@"The service should return and arrar");
            [readJson fulfill];
        }
    }];
    // then
    [self waitForExpectationsWithTimeout:10 handler:^(NSError *error) {
       
        NSLog(@"Terminado testGETWsManager");
    }];
}


// Create an expectation object.
// This test only has one, but it's possible to wait on multiple expectations.


 


@end
