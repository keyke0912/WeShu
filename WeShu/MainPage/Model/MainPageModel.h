//
//  MainPageModel.h
//  WeShu
//
//  Created by Key ke on 2023/6/22.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface MainPageModel : NSObject

@property (nonatomic, copy) NSString *name;

@property (nonatomic, copy) NSString *text;

@property (nonatomic, copy) NSString *image;

@property (nonatomic, copy) NSString *date;

/// 是否屏蔽此人消息
//@property (nonatomic) NSNumber *bell;

/// 字典转模型
/// @param dic 字典
- (instancetype)MainPageModelWithDic:(NSDictionary *)dic;

@end

NS_ASSUME_NONNULL_END
