# YJProgressHUD

详细图文教程：http://www.cnblogs.com/yajunLi/p/5822702.html

MBProgressHUD的使用，临时总结了几款最常用的使用场景：

1、提示消息



用法：

[YJProgressHUD showOnlyText:@"只显示文字" inView:self.view];

 

2、加载成功



用法：

[YJProgressHUD showSuccess:@"加载成功" inview:self.view];

 

3、加载中

 

用法：

[YJProgressHUD showProgress:@"加载中..." inView:self.view];

 

4、提示消息，N秒隐藏（比1多了设置n秒自动消失）



用法：

[YJProgressHUD showMessage:@"请输入xxx" inView:self.view afterDelayTime:2.0];

 

5、提示消息(最上层，无需指定显示view)



用法：

 [YJProgressHUD showMsgWithoutView:@"显示在最上层"];

 
6、自定义动画（序列帧实现）

 [YJProgressHUD showCustomAnimation:@"随机动画" withImgArry:imgArry inview:self.view];

 

 

比较简单的几种场景，用起来直接一句话就可搞定。

另外：还有隐藏提示框等方法：

[YJProgressHUD hide];

