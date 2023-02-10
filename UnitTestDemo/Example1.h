//
//  Example1.h
//  UnitTestDemo
//
//  Created by 尤坤 on 2023/2/9.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN


//简单demo 单元测试：通过给定一组特定的输入，判断输出结果是否符合预期

@interface Calculator : NSObject

- (NSInteger)add:(NSInteger)val1 with:(NSInteger)val2;

@end

NS_ASSUME_NONNULL_END
