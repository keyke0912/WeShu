//
//  MainPageViewController.m
//  WeShu
//
//  Created by Key ke on 2023/6/22.
//

#import "MainPageViewController.h"
#import "MainPageCustomTopView.h"
#import "Masonry.h"
#import "MainPageModel.h"
#import "MainPageTableViewCell.h"
#import <MobileCoreServices/MobileCoreServices.h>

@interface MainPageViewController ()
<
    UITableViewDelegate,
    UITableViewDataSource,
    UIImagePickerControllerDelegate,
    UINavigationControllerDelegate
>


@property (nonatomic, strong) NSArray<MainPageModel *> *dataArray;
@property (nonatomic, strong) UITableView *mainPageTableView;
@property (nonatomic, strong) MainPageCustomTopView *topView;


@end

@implementation MainPageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    [self.view addSubview:self.mainPageview];
    [self.view addSubview:self.topView];
    [self.view addSubview:self.mainPageTableView];
    self.view.backgroundColor = [UIColor whiteColor];
//    [self.mainPageview mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.size.equalTo(self.view);
//    }];
    [self.topView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(self.view).mas_offset(70);
        make.left.mas_equalTo(self.view).mas_offset(0);
        make.width.mas_equalTo(self.view.mas_width).mas_offset(0);
        make.height.mas_offset(55);
        
    }];
    [self.mainPageTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.topView.mas_bottom).mas_offset(0); //参数设置为的高度可以实现紧贴
        make.left.mas_equalTo(self.view).mas_offset(0);
        make.width.mas_equalTo(self.view).mas_offset(0);
        make.height.mas_equalTo(self.view).mas_offset(0);
    }];
}
#pragma mark UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArray.count;
}

- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView         cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    MainPageModel *dataModel = self.dataArray[indexPath.row];
    // 复用
    MainPageTableViewCell *mainCell = [tableView dequeueReusableCellWithIdentifier:MainPageTableViewCellReuseIdentifier];
    if (mainCell == nil) {
        mainCell = [[MainPageTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:MainPageTableViewCellReuseIdentifier];
    }
        // VC把从Model那里拿到的数据给View展示
    mainCell.nameStr = dataModel.name;
    mainCell.messageStr= dataModel.text;
//    mainCell.imageName = dataModel.image;
    mainCell.avatar.image = [UIImage imageNamed:dataModel.image];
    mainCell.dateStr = dataModel.date;
    [mainCell setSelectionStyle:UITableViewCellSelectionStyleNone];
    
    return mainCell;
}



#pragma mark UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 62;
}
//// header的行高，这里设为0，减少对UI效果的影响
//- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
//    return 0;
//}
//- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
//    return 0.0000001f;
//}

#pragma mark clicked
- (void) avatarButtonClicked: (UIButton *)sender {
    NSLog(@"avatar按钮被点击了！");
    // 创建UIImagePickerController实例
    UIImagePickerController *imagePicker = [[UIImagePickerController alloc] init];
    imagePicker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    imagePicker.delegate = self;
    imagePicker.mediaTypes = @[(NSString *)kUTTypeImage];
    
    // 显示UIImagePickerController
    [self presentViewController:imagePicker animated:YES completion:nil];
    
}

#pragma mark - UIImagePickerControllerDelegate

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<UIImagePickerControllerInfoKey, id> *)info {
    // 从选取的媒体中获取图片
    UIImage *selectedImage = info[UIImagePickerControllerOriginalImage];
    
    // 将选中的照片设置为头像按钮的图像
    [self.topView.avatarBtn setBackgroundImage:selectedImage forState:UIControlStateNormal];
    CAShapeLayer *maskLayer = [CAShapeLayer layer];
    maskLayer.frame = self.topView.avatarBtn.bounds;

    // 创建圆形路径
    UIBezierPath *maskPath = [UIBezierPath bezierPathWithOvalInRect:maskLayer.bounds];
    maskLayer.path = maskPath.CGPath;

    // 将遮罩层设置为头像按钮的图层的遮罩
    self.topView.avatarBtn.layer.mask = maskLayer;

}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    // 关闭UIImagePickerController
    [picker dismissViewControllerAnimated:YES completion:nil];
}


#pragma mark Lazy
- (UITableView *)mainPageTableView {
//    if (_mainPageview == nil) {
//        _mainPageview = [[MainPageView alloc] init];
//        _mainPageview.mainPageTableView.delegate = self;
//    }
    if (_mainPageTableView == nil) {
        _mainPageTableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        _mainPageTableView.dataSource = self;
        _mainPageTableView.delegate = self;
        _mainPageTableView.estimatedSectionFooterHeight = 0;
        _mainPageTableView.estimatedSectionHeaderHeight = 0;
        _mainPageTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _mainPageTableView.showsVerticalScrollIndicator = NO;
        _mainPageTableView.contentInset = UIEdgeInsetsZero;
        [_mainPageTableView registerClass:MainPageTableViewCell.class forCellReuseIdentifier:MainPageTableViewCellReuseIdentifier];
    }
    return _mainPageTableView;
}


- (NSArray<MainPageModel *> *)dataArray {
    if (_dataArray == nil) {
        // 从plist文件中加载
        NSString *path = [[NSBundle mainBundle] pathForResource:@"mainPageData.plist" ofType:nil];
        NSArray *dataOriginArray = [NSArray arrayWithContentsOfFile:path];
        NSMutableArray *ma = [NSMutableArray array];
        // 数据转模型
        for (NSDictionary *dic in dataOriginArray) {
            MainPageModel *model = [[MainPageModel alloc] init];
            // VC与Model通信，原始数组，字典数据，转化为模型
            [model MainPageModelWithDic:dic];
            [ma addObject:model];
        }
        _dataArray = ma;
    }
    return _dataArray;
}
- (MainPageCustomTopView *)topView {
    if (_topView == nil) {
        
        _topView = [[MainPageCustomTopView alloc] init];
        [_topView.avatarBtn addTarget:self action:@selector(avatarButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
        
    }
    return _topView;
}
@end
