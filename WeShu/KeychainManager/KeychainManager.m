//
//  KeychainManager.m
//  WeShu
//
//  Created by Key ke on 2023/6/22.
//

#import "KeychainManager.h"
#import <Security/Security.h>
@implementation KeychainManager

// 定义 Keychain 中存储账户密码的标识符
static NSString * const kKeychainIdentifier = @"com.example.app.login0";

// 存储账户密码到 Keychain
+ (void)storeUserId:(NSString *)userId passcode:(NSString *)passcode {
    // 创建一个字典用于配置 Keychain 记录的属性
    NSDictionary *attributes = @{
        (__bridge id)kSecClass: (__bridge id)kSecClassGenericPassword,
        (__bridge id)kSecAttrService: kKeychainIdentifier,
        (__bridge id)kSecAttrAccount: userId,
        (__bridge id)kSecValueData: [passcode dataUsingEncoding:NSUTF8StringEncoding]
    };
    
    // 将账户密码存储到 Keychain
    OSStatus status = SecItemAdd((__bridge CFDictionaryRef)attributes, NULL);
    NSLog(@"keychainUserId%@", userId);
    NSLog(@"keychainPasscode%@", passcode);
    if (status != errSecSuccess) {
        NSLog(@"Failed to store password in Keychain: %d", (int)status);
    }
}

// 从 Keychain 读取账户密码
+ (BOOL)retrieveStoredCredentials {
    // 创建一个查询字典用于搜索 Keychain 中的记录
    NSDictionary *query = @{
        (__bridge id)kSecClass: (__bridge id)kSecClassGenericPassword,
        (__bridge id)kSecAttrService: kKeychainIdentifier,
        (__bridge id)kSecReturnAttributes: (__bridge id)kCFBooleanTrue,
        (__bridge id)kSecMatchLimit: (__bridge id)kSecMatchLimitOne
    };
    
    // 查询 Keychain 中的记录
    CFTypeRef result = NULL;
    OSStatus status = SecItemCopyMatching((__bridge CFDictionaryRef)query, &result);
    if (status == errSecSuccess && result != NULL) {
        NSDictionary *credentials = (__bridge_transfer NSDictionary *)result;
        NSString *userId = credentials[(__bridge id)kSecAttrAccount];
        NSData *passcodeData = credentials[(__bridge id)kSecValueData];
        NSString *passcode = [[NSString alloc] initWithData:(NSData *)passcodeData encoding:NSUTF8StringEncoding];
        NSLog(@"userId%@",userId);
        NSLog(@"passcode%@",passcode);
        NSLog(@"%@",@{userId:passcode});
        return YES;
    }
    
    return NO;
}

// 清除 Keychain 中的账户密码
+ (void)clearStoredCredentials {
    // 创建一个查询字典用于搜索 Keychain 中的记录并删除
    NSDictionary *query = @{
        (__bridge id)kSecClass: (__bridge id)kSecClassGenericPassword,
        (__bridge id)kSecAttrService: kKeychainIdentifier
    };
    
    // 删除 Keychain 中的记录
    OSStatus status = SecItemDelete((__bridge CFDictionaryRef)query);
    if (status != errSecSuccess) {
        NSLog(@"Failed to clear stored credentials in Keychain: %d", (int)status);
    }
}


@end
