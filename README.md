# ZKAlertManager
使用系统UIAlertController封装一个可自定义的弹窗管理器  

标题及内容可以传入富文本展示

不需要富文本的话直接传入string即可

可修改按钮文字及颜色

如果只想要一个按钮，按钮的text传空字符串或nil即可

使用方法：

    NSString *title = @"这是标题";
    NSMutableAttributedString *attributedTitle = [[NSMutableAttributedString alloc] initWithString:title];
    [attributedTitle addAttribute:NSForegroundColorAttributeName value:[UIColor blueColor] range:NSMakeRange(0, attributedTitle.length)];
    [attributedTitle addAttribute:NSFontAttributeName value:[UIFont boldSystemFontOfSize:17] range:NSMakeRange(0, attributedTitle.length)];

    NSString *message = @"这是内容";
    NSMutableAttributedString *attributedMessage = [[NSMutableAttributedString alloc] initWithString:message];
    [attributedMessage addAttribute:NSForegroundColorAttributeName value:[UIColor redColor] range:NSMakeRange(0, attributedMessage.length)];
    [attributedMessage addAttribute:NSFontAttributeName value:[UIFont boldSystemFontOfSize:14] range:NSMakeRange(0, attributedMessage.length)];


    [[ZKAlertManager shared] showWithTitle:attributedTitle message:attributedMessage cancelText:@"" cancelColor:nil doneText:@"确定" doneColor:[UIColor redColor] controller:self cancelButtonHandler:^{
        NSLog(@"点击了取消");
    } doneButtonHandler:^{
        NSLog(@"点击了确定");
    }];
