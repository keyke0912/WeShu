//
//  LogInView.h
//  WeShu
//
//  Created by Key ke on 2023/6/15.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol LogInViewDelegate <NSObject>

- (void)logInButtonTapped;

@end

@interface LogInView : UIView

@property (nonatomic, copy)NSString *userId;
@property (nonatomic, copy)NSString *passcode;

@property (nonatomic, weak) id<LogInViewDelegate> delegate;

@end

NS_ASSUME_NONNULL_END
