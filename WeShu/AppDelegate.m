//
//  AppDelegate.m
//  WeShu
//
//  Created by Key ke on 2023/6/6.
//

#import "AppDelegate.h"
#import "LogInViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    ///以vc为根控制器实现不同视图控制器之间的跳转
    LogInViewController *logInViewcontroller = [[LogInViewController alloc]init];
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:logInViewcontroller];

    self.window.rootViewController = navigationController;
    [self.window makeKeyAndVisible];
    //使应用的主窗口可见，并将其设置为关键窗口，即成为处理用户交互的主要窗口。
    return YES;
}




@end
