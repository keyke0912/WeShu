//
//  MainPageView.m
//  WeShu
//
//  Created by Key ke on 2023/6/22.
//

#import "MainPageView.h"
#import "Masonry.h"
@interface MainPageView ()

@property (nonatomic, strong) UILabel *lab;


@end

@implementation MainPageView

- (instancetype)init {
    self = [super init];
    if (self) {
        [self addSubview:self.lab];
        self.backgroundColor = [UIColor whiteColor];
        [self.lab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self).offset(50);
            make.top.equalTo(self).offset(100);
            make.width.offset(100);
            make.height.offset(60);
                    
        }];
    }
    return self;
}

#pragma mark Lazy
- (UILabel *)lab {
    if (_lab == nil) {
        _lab = [[UILabel alloc] init];
        _lab.backgroundColor = [UIColor grayColor];
    }
    return _lab;
}

@end
