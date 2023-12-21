//
//  ZKAlertManager.m
//  SSAI
//
//  Created by zhangkeqin on 2023/12/21.
//  Copyright © 2021 ZK. All rights reserved.
//

#import "ZKAlertManager.h"

@interface ZKAlertManager()

@property (nonatomic, copy) void(^cancelButtonHandler)(void);

@property (nonatomic, copy) void(^doneButtonHandler)(void);

@end

@implementation ZKAlertManager

+ (ZKAlertManager*)shared{
    static dispatch_once_t once;
    static ZKAlertManager *shared;
    dispatch_once(&once, ^ {
        shared = [[ZKAlertManager alloc] init];
        
    });
    return shared;
}

-(void)showWithTitle:(id)title message:(id)message cancelText:(NSString *)cancelText cancelColor:(id)cancelColor doneText:(NSString *)doneText doneColor:(id)doneColor controller:(UIViewController *)controller cancelButtonHandler:(void (^)(void))cancelButtonHandler doneButtonHandler:(void (^)(void))doneButtonHandler{
    self.cancelButtonHandler = cancelButtonHandler;
    self.doneButtonHandler = doneButtonHandler;
    
    
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"" message:@"" preferredStyle:(UIAlertControllerStyleAlert)];
    
    //标题
    if ([title isKindOfClass:[NSString class]]) {
        NSString *titleString = (NSString *)title;
        [alertController setValue:titleString forKey:@"title"];
    } else if ([title isKindOfClass:[NSMutableAttributedString class]]) {
        NSMutableAttributedString *attributedTitle = (NSMutableAttributedString *)title;
        [alertController setValue:attributedTitle forKey:@"attributedTitle"];
    }
    
    //内容
    if ([message isKindOfClass:[NSString class]]) {
        NSString *messageString = (NSString *)message;
        [alertController setValue:messageString forKey:@"message"];
    } else if ([message isKindOfClass:[NSMutableAttributedString class]]) {
        NSMutableAttributedString *attributedMessage = (NSMutableAttributedString *)message;
        [alertController setValue:attributedMessage forKey:@"attributedMessage"];
    }
    
    
    //取消按钮
    if(cancelText.length){
        UIAlertAction *cancleAction = [UIAlertAction actionWithTitle:cancelText style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            if(self.cancelButtonHandler){
                self.cancelButtonHandler();
            }
        }];
        if([cancelColor isKindOfClass:[UIColor class]]){
            [cancleAction setValue:cancelColor forKey:@"titleTextColor"];
        }else{
            [cancleAction setValue:[UIColor grayColor] forKey:@"titleTextColor"];
        }
        
        [alertController addAction:cancleAction];
    }
    
    
    //确定按钮
    UIAlertAction *sureAction = [UIAlertAction actionWithTitle:doneText style:(UIAlertActionStyleDefault) handler:^(UIAlertAction * _Nonnull action) {
        if(self.doneButtonHandler){
            self.doneButtonHandler();
        }
    }];
    if([doneColor isKindOfClass:[UIColor class]]){
        [sureAction setValue:doneColor forKey:@"titleTextColor"];
    }else{
        [sureAction setValue:[UIColor blackColor] forKey:@"titleTextColor"];
    }
    
    [alertController addAction:sureAction];
    [controller presentViewController:alertController animated:YES completion:nil];
    
}

@end
