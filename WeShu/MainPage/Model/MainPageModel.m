//
//  MainPageModel.m
//  WeShu
//
//  Created by Key ke on 2023/6/22.
//

#import "MainPageModel.h"

@implementation MainPageModel

- (instancetype)MainPageModelWithDic:(NSDictionary *)dic {
    self.name = dic[@"name"];
    self.text = dic[@"text"];
    self.image = dic[@"image"];
    self.date = dic[@"date"];
    //self.bell = dic[@"bell"];
    return self;
}

@end
