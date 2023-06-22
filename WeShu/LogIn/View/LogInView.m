//
//  LogInView.m
//  WeShu
//
//  Created by Key ke on 2023/6/15.
//

#import "LogInView.h"
#import "Masonry.h"
#import "KeychainManager.h"
#import "LogInViewController.h"
#import "MainPageViewController.h"

@interface LogInView ()

@property (nonatomic, strong)UITextField *idTextField;
@property (nonatomic, strong)UITextField *passcodeTextField;
@property (nonatomic, strong)UIButton *logButton;
@property (nonatomic, strong)UILabel *logLabel;
@property (nonatomic, strong)UILabel *hintIdLabel;
@property (nonatomic, strong)UILabel *hintPasscodeLabel;



@end
@implementation LogInView
#pragma mark init
-(instancetype)init {
    self = [super init];
    if (self) {
        [self addSubview:self.logLabel];
        [self addSubview:self.idTextField];
        [self addSubview:self.passcodeTextField];
        [self addSubview:self.logButton];
        [self addSubview:self.hintIdLabel];
        [self addSubview:self.hintPasscodeLabel];
        
        [self.logLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self);
            make.top.equalTo(self).offset(100);
            make.width.offset(150);
            make.height.offset(60);
        }];
        
        [self.idTextField mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.logLabel).offset(100);
            make.left.equalTo(self.logLabel);
            make.width.offset(150);
            make.height.offset(60);
        }];
        
        [self.passcodeTextField mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.idTextField).offset(60);
            make.left.equalTo(self.idTextField).offset(0);
            make.width.offset(500);
            make.height.offset(60);
        }];
        
        [self.logButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.passcodeTextField).offset(300);
            make.left.equalTo(self.logLabel).offset(0);
            make.width.offset(150);
            make.height.offset(60);
        }];
        
        [self.hintIdLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.idTextField);
            make.right.equalTo(self.idTextField.mas_left);
            make.left.equalTo(self);
            make.height.equalTo(self.idTextField);
        }];
        
        [self.hintPasscodeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.passcodeTextField);
            make.right.equalTo(self.passcodeTextField.mas_left);
            make.left.equalTo(self);
            make.height.equalTo(self.passcodeTextField);
        }];
    }
    return self;
}

#pragma mark Lazy
-(UILabel *)logLabel {
    if (_logLabel == nil) {
        _logLabel = [[UILabel alloc] init];
        _logLabel.text = @"登录";
        _logLabel.textColor = [UIColor blackColor];
        _logLabel.textAlignment = NSTextAlignmentCenter;
        _logLabel.font = [UIFont systemFontOfSize:30];
        
    }
    return _logLabel;
}

-(UITextField *)idTextField {
    if (_idTextField == nil) {
        _idTextField = [[UITextField alloc] init];
        _idTextField.backgroundColor = [UIColor whiteColor];
        _idTextField.textColor = [UIColor blackColor];
        _idTextField.placeholder = @"请输入您的账号";
    }
    return _idTextField;
}

-(UITextField *)passcodeTextField {
    if (_passcodeTextField == nil) {
        _passcodeTextField = [[UITextField alloc] init];
        _passcodeTextField.backgroundColor = [UIColor whiteColor];
        _passcodeTextField.placeholder = @"请您的输入密码";
        _passcodeTextField.textColor = [UIColor blackColor];
        
    }
    return _passcodeTextField;
}
-(UIButton *)logButton {
    if (_logButton == nil) {
        _logButton = [[UIButton alloc] init];
        _logButton.backgroundColor = [[UIColor greenColor] init];
        [_logButton setTitle:@"登录" forState:UIControlStateNormal];
        [_logButton addTarget:self action:@selector(logIn:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _logButton;
}
-(UILabel *)hintIdLabel {
    if (_hintIdLabel == nil) {
        _hintIdLabel = [[UILabel alloc] init];
        _hintIdLabel.text = @"账号";
        _hintIdLabel.font = [UIFont systemFontOfSize:20];
        _hintIdLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _hintIdLabel;
}
-(UILabel *)hintPasscodeLabel {
    if (_hintPasscodeLabel == nil) {
        _hintPasscodeLabel = [[UILabel alloc] init];
        _hintPasscodeLabel.text = @"密码";
        _hintPasscodeLabel.font = [UIFont systemFontOfSize:20];
        _hintPasscodeLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _hintPasscodeLabel;
}
#pragma mark ActionForBtn
-(void)logIn: (UIButton *)button {
    NSLog(@"0");
    [self.delegate logInButtonTapped];
}
#pragma mark Getter
-(NSString *)userId {
    return self.idTextField.text;
}
-(NSString *)passcode {
    return self.passcodeTextField.text;
}
@end
