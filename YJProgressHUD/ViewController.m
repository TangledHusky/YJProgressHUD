//
//  ViewController.m
//  YJProgressHUD
//
//  Created by 李亚军 on 16/8/30.
//  Copyright © 2016年 zyyj. All rights reserved.
//

#import "ViewController.h"
#import "YJProgressHUD.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UIView *test = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 200, 200)];
    test.center = self.view.center;
    test.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:test];
    
    UIButton *btn1 = [[UIButton alloc] initWithFrame:CGRectMake(15, 10, 150, 20)];
    [btn1 addTarget:self action:@selector(btnTest:) forControlEvents:UIControlEventTouchUpInside];
    [btn1 setTitle:@"提示消息" forState:UIControlStateNormal];
    btn1.tag=1001;
    [test addSubview:btn1];
    
    UIButton *btn2 = [[UIButton alloc] initWithFrame:CGRectMake(15, 40, 150, 20)];
    [btn2 addTarget:self action:@selector(btnTest:) forControlEvents:UIControlEventTouchUpInside];
    [btn2 setTitle:@"加载成功" forState:UIControlStateNormal];
    btn2.tag=1002;
    [test addSubview:btn2];
    
    UIButton *btn3 = [[UIButton alloc] initWithFrame:CGRectMake(15, 70, 150, 20)];
    [btn3 addTarget:self action:@selector(btnTest:) forControlEvents:UIControlEventTouchUpInside];
    [btn3 setTitle:@"加载中" forState:UIControlStateNormal];
    btn3.tag=1003;
    [test addSubview:btn3];
    
    UIButton *btn4 = [[UIButton alloc] initWithFrame:CGRectMake(15, 100, 150, 20)];
    [btn4 addTarget:self action:@selector(btnTest:) forControlEvents:UIControlEventTouchUpInside];
    [btn4 setTitle:@"提示消息，1秒隐藏" forState:UIControlStateNormal];
    btn4.tag=1004;
    [test addSubview:btn4];
    
    UIButton *btn5 = [[UIButton alloc] initWithFrame:CGRectMake(15, 130, 150, 20)];
    [btn5 addTarget:self action:@selector(btnTest:) forControlEvents:UIControlEventTouchUpInside];
    [btn5 setTitle:@"提示消息(最上层)" forState:UIControlStateNormal];
    btn5.tag=1005;
    [test addSubview:btn5];
    
}


-(void)btnTest:(UIButton *)sender{
    switch (sender.tag) {
        case 1001:{
            
            [YJProgressHUD showMessage:@"只显示文字" inView:self.view];
            break;
        }
        case 1002:{
            [YJProgressHUD showSuccess:@"加载成功" inview:self.view];
            break;
        }
        case 1003:{
            [YJProgressHUD showProgress:@"加载中..." inView:self.view];
            break;
        }
        case 1004:{
            [YJProgressHUD showMessage:@"请输入xxx" inView:self.view afterDelayTime:2.0];
            break;
        }
        case 1005:{
            [YJProgressHUD showMsgWithoutView:@"显示在最上层"];
            break;
        }
        default:
            break;
    }
    
    
    //用于关闭当前提示
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [YJProgressHUD hide];

    });
}


@end
