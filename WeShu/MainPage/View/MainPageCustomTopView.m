//
//  MainPageCustomTopView.m
//  DailyNews
//
//  Created by Key ke on 2023/4/25.
//

#import "MainPageCustomTopView.h"
#import "Masonry.h"

@interface MainPageCustomTopView()

@property (nonatomic, strong) UILabel *nameLab;
@property (nonatomic, strong) UIButton *searchBtn;
@property (nonatomic, strong) UIButton *moreBtn;

@end

@implementation MainPageCustomTopView

//这里一开始用的是initWithFrame,想到后面添加这个自定义view给主界面可能会出现适配问题故后面改为init结合masonry

- (instancetype)init {
    self = [super init];
    
    if (self) {
    
        [self addSubview:self.avatarBtn];
        [self addSubview:self.nameLab];
        [self addSubview:self.moreBtn];
        [self addSubview:self.searchBtn];
        self.backgroundColor = [UIColor whiteColor];
       
        [self.avatarBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.top.mas_equalTo(self).mas_offset(12);
            make.left.mas_equalTo(self).mas_offset(18);
            make.width.mas_offset(36);
            make.height.mas_offset(36);
            //_avatarBtn.layer.cornerRadius = _avatarBtn.frame.size.width/2; //将button的形状设置为圆形
            
        }];
        [self.nameLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.avatarBtn).mas_offset(0);
            make.left.mas_equalTo(self.avatarBtn.mas_right).mas_offset(8);
            make.width.mas_offset(80);
            make.height.mas_equalTo(self.avatarBtn).mas_offset(0);
        }];
        [self.moreBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.mas_equalTo(self.avatarBtn).mas_offset(0);
            make.right.mas_equalTo(self).mas_offset(-20);
            make.width.mas_offset(25);
            make.height.mas_equalTo(self.moreBtn.mas_width).mas_offset(0);
        }];
        [self.searchBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.mas_equalTo(self.avatarBtn).mas_offset(0);
            make.right.mas_equalTo(self.moreBtn).mas_offset(-50);
            make.width.mas_offset(30);
            make.height.mas_equalTo(self.searchBtn.mas_width).mas_offset(0);
        }];
    }
    
    return self;
}

#pragma mark -lazy

-(UIButton *)avatarBtn {
    if (_avatarBtn == nil) {
        _avatarBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_avatarBtn setBackgroundImage:[UIImage imageNamed:@"firstPageData0"] forState:UIControlStateNormal];
    }
    return _avatarBtn;
}
-(UILabel *)nameLab {
    if (_nameLab == nil) {
        _nameLab = [[UILabel alloc] init];
        _nameLab.text = @"keyke";
        _nameLab.font = [UIFont fontWithName:@"Arial-BoldMT" size:24.0];
    }
    return _nameLab;
}
-(UIButton *)searchBtn {
    if (_searchBtn == nil) {
        _searchBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_searchBtn setImage:[UIImage imageNamed:@"search"] forState:UIControlStateNormal];
    }
    return _searchBtn;
}
-(UIButton *)moreBtn {
    if (_moreBtn == nil) {
        _moreBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_moreBtn setImage:[UIImage imageNamed:@"more"] forState:UIControlStateNormal];
    }
    return _moreBtn;
}
@end
