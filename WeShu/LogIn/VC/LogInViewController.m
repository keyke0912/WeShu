//
//  LogInViewController.m
//  WeShu
//
//  Created by Key ke on 2023/6/15.
//

#import "LogInViewController.h"
#import "LogInView.h"
#import "Masonry.h"
#import "LogInModel.h"
#import "MainPageViewController.h"
#import "KeychainManager.h"

@interface LogInViewController ()<LogInViewDelegate>

@property (nonatomic, strong) LogInView *logInView;

@end

@implementation LogInViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.logInView.delegate = self;
    if ([KeychainManager retrieveStoredCredentials]) {
        NSLog(@"yes");
        MainPageViewController *mainPageViewController = [[MainPageViewController alloc] init];
        [self.navigationController pushViewController:mainPageViewController animated:YES];
    }
    self.view.backgroundColor  = [UIColor whiteColor];
    self.navigationController.navigationBarHidden = YES;
    [self.view addSubview:self.logInView];
    [self.logInView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self.view);
    }];
}

#pragma mark Lazy
-(LogInView *)logInView {
    if (_logInView == nil) {
        _logInView = [[LogInView alloc] init];
        
    }
    return _logInView;
}

#pragma mark Delegate
-(void)logInButtonTapped {
    MainPageViewController *mainPageViewController = [[MainPageViewController alloc] init];
    [KeychainManager storeUserId:self.logInView.userId passcode:self.logInView.passcode];
    [self.navigationController pushViewController:mainPageViewController animated:YES];
    
}

@end
