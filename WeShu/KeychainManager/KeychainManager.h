//
//  KeychainManager.h
//  WeShu
//
//  Created by Key ke on 2023/6/22.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface KeychainManager : NSObject

+ (void)storeUserId:(NSString *)userId passcode:(NSString *)passcode;
+ (BOOL)retrieveStoredCredentials;
+ (void)clearStoredCredentials;

@end

NS_ASSUME_NONNULL_END
