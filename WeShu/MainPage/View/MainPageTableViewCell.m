//
//  MainPageTableViewCell.m
//  WeShu
//
//  Created by Key ke on 2023/6/24.
//

#import "MainPageTableViewCell.h"
#import "Masonry.h"

NSString *MainPageTableViewCellReuseIdentifier = @"MainPageTableViewCell";

@interface MainPageTableViewCell ()


@property (nonatomic, strong) UILabel *name;
@property (nonatomic, strong) UILabel *message;
@property (nonatomic, strong) UILabel *date;

@end
@implementation MainPageTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self.contentView addSubview:self.avatar];
        [self.contentView addSubview:self.name];
        [self.contentView addSubview:self.message];
        [self.contentView addSubview:self.date];
        [self.avatar mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.top.mas_equalTo(self.contentView).mas_offset(0);
            make.centerY.mas_equalTo(self.contentView.mas_centerY).mas_offset(0);
            make.left.mas_equalTo(self.contentView.mas_left).mas_offset(18);
            make.width.mas_equalTo(self.avatar.mas_height);
            make.height.mas_equalTo(self.contentView).mas_offset(-15);

        }];
        [self.name mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.contentView).mas_offset(5);
            make.left.mas_equalTo(self.avatar).mas_offset(60);
            make.width.mas_equalTo(self.contentView).mas_offset(-100);
            make.height.mas_offset(30);
        }];
        
        [self.message mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.name.mas_bottom).mas_offset(0);
            make.left.mas_equalTo(self.name).mas_offset(0);
            make.width.mas_equalTo(self.name).mas_offset(0);
            make.height.mas_offset(20);
        }];
        
        [self.date mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.name).mas_offset(0);
            make.right.mas_equalTo(self).mas_offset(0);
            make.width.mas_offset(50);
            make.height.mas_equalTo(self.name).mas_offset(0);
        }];
    }
    return self;
}
#pragma mark Lazy
-(UIImageView *)avatar {
    if (_avatar == nil) {
        _avatar = [[UIImageView alloc] init];
        //_avatar.contentMode = UIViewContentModeScaleAspectFill;
        _avatar.layer.cornerRadius = 4;
        _avatar.clipsToBounds = YES; // 裁剪超出边界的部分
    }
    return _avatar;
}

-(UILabel *)name {
    if (_name == nil) {
        _name = [[UILabel alloc] init];
        _name.textColor = [UIColor blackColor];
        _name.font = [UIFont boldSystemFontOfSize:17];
    }
    return _name;
}

-(UILabel *)message {
    if (_message == nil) {
        _message = [[UILabel alloc] init];
        _message.textColor = [UIColor grayColor];
        _message.font = [UIFont systemFontOfSize:13];
    }
    return _message;
}

-(UILabel *)date {
    if (_date == nil) {
        _date = [[UILabel alloc] init];
        _date.textColor = [UIColor grayColor];
        _date.font = [UIFont systemFontOfSize:13];
    }
    return _date;
}

#pragma mark Setter

//-(void)setImageName:(NSString *)imageName {
//    _imageName = imageName.copy;
//    self.imageView.image = [UIImage imageNamed:imageName];
//    
//}
-(void)setNameStr:(NSString *)nameStr {
    self.name.text = nameStr.copy;
}
-(void)setMessageStr:(NSString *)messageStr {
    self.message.text = messageStr.copy;
}
-(void)setDateStr:(NSString *)dateStr {
    self.date.text = dateStr.copy;
}

@end
