//
//  ZKAlertManager.h
//  SSAI
//
//  Created by zhangkeqin on 2023/12/21.
//  Copyright © 2021 ZK. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZKAlertManager : NSObject


+ (ZKAlertManager*)shared;


/// - Parameters:
///   - title: 标题 可以是NSString或NSMutableAttributedString类型 可不传
///   - message: 内容 可以是NSString或NSMutableAttributedString类型 可不传
///   - cancelText: 取消按钮文案 可不传
///   - cancelColor: 取消按钮颜色 可不传 默认灰色
///   - doneText: 确定按钮文案
///   - doneColor: 取消按钮颜色 可不传 默认黑色
///   - controller: 需要弹出的控制器
///   - cancelButtonHandler: 取消按钮的回调
///   - doneButtonHandler: 确定按钮的回调
-(void)showWithTitle:(id)title message:(id)message cancelText:(NSString *)cancelText cancelColor:(id)cancelColor doneText:(NSString *)doneText doneColor:(id)doneColor controller:(UIViewController *)controller cancelButtonHandler:(void (^)(void))cancelButtonHandler doneButtonHandler:(void (^)(void))doneButtonHandler;


@end
