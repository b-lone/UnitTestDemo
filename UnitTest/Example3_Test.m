//
//  UnitTest
//
//  Created by 尤坤 on 2023/2/9.
//

#import <XCTest/XCTest.h>
#import "Example3.h"
#import "FakeTimeManager.h"

@interface UnitTest3 : XCTestCase

@property (nonatomic, strong) FakeTimeManager *fakeTimeManager;
@property (nonatomic, strong) WorkerV2 *testObj;

@end

@implementation UnitTest3

- (void)setUp {
    self.fakeTimeManager = [FakeTimeManager new];
    self.testObj = [[WorkerV2 alloc] initWith:self.fakeTimeManager];
}

- (void)testExample {
    self.fakeTimeManager.fakeTimeOfDay = TimeOfDayMorning;
    State result = [self.testObj getState];
    XCTAssertEqual(result, StateWork);

    self.fakeTimeManager.fakeTimeOfDay = TimeOfDayNoon;
    result = [self.testObj getState];
    XCTAssertEqual(result, StateWork);
    
    self.fakeTimeManager.fakeTimeOfDay = TimeOfDayEvening;
    result = [self.testObj getState];
    XCTAssertEqual(result, StateRest);
    
    self.fakeTimeManager.fakeTimeOfDay = TimeOfDayNight;
    result = [self.testObj getState];
    XCTAssertEqual(result, StateRest);
}

@end












@interface FakeScreen : NSObject <IScreen>

@property (nonatomic, assign) CGRect fakeFrame;

@end

@implementation FakeScreen

- (CGRect)frame {
    return self.fakeFrame;
}

@end

@interface UnitTest3_ : XCTestCase

@property (nonatomic, strong) FakeScreen *fakeScreen;
@property (nonatomic, strong) ScreenManagerV2 *testObj;

@end

@implementation UnitTest3_

- (void)setUp {
    self.fakeScreen = [FakeScreen new];
    self.testObj = [[ScreenManagerV2 alloc] initWith:self.fakeScreen];
}

- (void)testExample {
    self.fakeScreen.fakeFrame = CGRectMake(0, 0, 10, 10);
    CGFloat result = [self.testObj getScreenArea];
    XCTAssert(result == 100);

    self.fakeScreen.fakeFrame = CGRectMake(0, 0, 20, 20);
    result = [self.testObj getScreenArea];
    XCTAssert(result == 400);
}

@end
