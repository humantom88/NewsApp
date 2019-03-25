//
//  NewsAppTests.m
//  NewsAppTests
//
//  Created by Tom Belov on 16/03/2019.
//  Copyright © 2019 Tom Belov. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "NWSNewsInteractorUtils.h"

@interface NewsAppTests : XCTestCase

@end

@implementation NewsAppTests

- (void)setUp
{
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown
{
    // Put teardown code here. This method is called after the invocation of each test method in the class.
}

- (void)testInteractorUtils
{
    NSString *content = @"The end of special text to te… [+6786 chars]";
    NSString *result = [NWSNewsInteractorUtils removeRemainingCharCountFromContent:content];
    NSString *expectedResult = @"The end of special text to te… ";

    XCTAssertTrue([result isEqualToString:expectedResult]);
    
    NSString *dateString = @"2019-03-21T09:33:45Z"
    NSString *resultDate = [NWSNewsInteractorUtils parsePublishedAtDate:dateString];
    NSString *expectedDateResult = [resultDate ]
}

@end
