//
//  MainPageTableViewCell.h
//  WeShu
//
//  Created by Key ke on 2023/6/24.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

UIKIT_EXTERN NSString *MainPageTableViewCellReuseIdentifier;

@interface MainPageTableViewCell : UITableViewCell

@property (nonatomic, copy) NSString *nameStr;
@property (nonatomic, copy) NSString *messageStr;
@property (nonatomic, copy) NSString *imageName;
@property (nonatomic, copy) NSString *dateStr;

@property (nonatomic, strong) UIImageView *avatar;
@end

NS_ASSUME_NONNULL_END
