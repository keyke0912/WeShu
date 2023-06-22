//
//  MainPageViewController.m
//  WeShu
//
//  Created by Key ke on 2023/6/22.
//

#import "MainPageViewController.h"
#import "MainPageView.h"
#import "Masonry.h"
@interface MainPageViewController ()

@property (nonatomic, strong) MainPageView *mainPageview;

@end

@implementation MainPageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.mainPageview];
    self.view.backgroundColor = [UIColor whiteColor];
    [self.mainPageview mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.equalTo(self.view);
    }];
}

#pragma mark Lazy
- (MainPageView *)mainPageview {
    if (_mainPageview == nil) {
        _mainPageview = [[MainPageView alloc] init];
    }
    return _mainPageview;
}

@end
