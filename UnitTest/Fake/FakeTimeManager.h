//
//  FakeTimeManager.h
//  UnitTestDemo
//
//  Created by 尤坤 on 2023/2/10.
//

#import <Foundation/Foundation.h>
#import "Example3.h"

NS_ASSUME_NONNULL_BEGIN

@interface FakeTimeManager : NSObject<TimerManagerProtocol>

@property (nonatomic, assign) TimeOfDay fakeTimeOfDay;

@end

NS_ASSUME_NONNULL_END
