//
//  UnitTest.m
//  UnitTest
//
//  Created by 尤坤 on 2023/2/9.
//

#import <XCTest/XCTest.h>
#import "Example1.h"

@interface UnitTest1 : XCTestCase

@property (nonatomic, strong) Calculator *testObj;

@end

@implementation UnitTest1

- (void)setUp {
    self.testObj = [Calculator new];
}

- (void)testExample {
    NSInteger val1 = 1;
    NSInteger val2 = 2;
    NSInteger result = [self.testObj add:val1 with:val2];
    XCTAssertEqual(result, 3);
    
    val1 = -1;
    val2 = 1;
    result = [self.testObj add:val1 with:val2];
    XCTAssertEqual(result, 0);
    
    val1 = 0;
    val2 = 0;
    result = [self.testObj add:val1 with:val2];
    XCTAssertEqual(result, 0);
}



@end
