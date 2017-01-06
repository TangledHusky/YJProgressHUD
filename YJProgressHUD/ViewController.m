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

@implementation ViewController{
     MBProgressHUD *HUD;
    float pro;
}

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
    [btn3 setTitle:@"加载中（菊花）" forState:UIControlStateNormal];
    btn3.tag=1003;
    [test addSubview:btn3];
    
    UIButton *btn4 = [[UIButton alloc] initWithFrame:CGRectMake(15, 100, 150, 20)];
    [btn4 addTarget:self action:@selector(btnTest:) forControlEvents:UIControlEventTouchUpInside];
    [btn4 setTitle:@"加载中（转圈）" forState:UIControlStateNormal];
    btn4.tag=1004;
    [test addSubview:btn4];
    
    UIButton *btn5 = [[UIButton alloc] initWithFrame:CGRectMake(15, 130, 150, 20)];
    [btn5 addTarget:self action:@selector(btnTest:) forControlEvents:UIControlEventTouchUpInside];
    [btn5 setTitle:@"提示消息(最上层)" forState:UIControlStateNormal];
    btn5.tag=1005;
    [test addSubview:btn5];
    
    UIButton *btn6 = [[UIButton alloc] initWithFrame:CGRectMake(15, 160, 150, 20)];
    [btn6 addTarget:self action:@selector(btnTest:) forControlEvents:UIControlEventTouchUpInside];
    [btn6 setTitle:@"随机动画" forState:UIControlStateNormal];
    btn6.tag=1006;
    [test addSubview:btn6];
    
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
            HUD = [YJProgressHUD showProgressCircle:@"Loading..." inView:nil];
            
            //用定时器模拟数据
            pro = 0.01;
            [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(updateProgress) userInfo:nil repeats:YES];
            
            
            break;
        }
        case 1005:{
            [YJProgressHUD showMsgWithoutView:@"显示在最上层"];
            break;
        }
        case 1006:{
            //使用这种，必须保证Assets里，添加了图片组，这里提示内容不写（用@""），就只显示动画，写了内容，是一起显示
            [YJProgressHUD showCustomAnimation:@"" withImgArry:[self getRandomImgArry] inview:self.view];
            break;
        }
        default:
            break;
    }
    
    
    
    
    //下面是设置
    if (sender.tag == 1004) {
        return;
    }
    
    
    //这里是我手动设置的停止动画，实际使用时，可以在数据请求结束时，用 [YJProgressHUD hide]; 结束动画
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [YJProgressHUD hide];

    });
}

-(void)updateProgress{
    if (pro>=1) {
        [HUD hideAnimated:YES];
        HUD = nil;
    }
    
    pro = pro + 0.01;
    HUD.progress = pro;
    
    
}


/**
 自己构造随机一种动画，实际使用，不用这样

 @return <#return value description#>
 */
-(NSArray *)getRandomImgArry{
    NSMutableArray *imageArr = [NSMutableArray array];
    //1 - 8 的随机数
    int y = (arc4random() % 8) + 1;
    
    int I = 0;
    
    if (y == 1) {
        
        I = 12 + 1;
        
    } else if (y == 2) {
        
        I = 8 + 1;
        
    }else if (y == 3) {
        
        I = 16 + 1;
        
    }else if (y == 4) {
        
        I = 50 + 1;
        
    }else if (y == 5) {
        
        I = 23 + 1;
        
    }else if (y == 6) {
        
        I = 13 + 1;
        
    }else if (y == 7) {
        
        I = 22 + 1;
        
    }else if (y == 8) {
        
        I = 70 + 1;
    }
    
    
    for (int i = 1; i < I; i ++ ) {
        
        [imageArr addObject:[UIImage imageNamed:[NSString stringWithFormat:@"loading_%d_%d",y,i]]];
    }
    
    return [imageArr copy];
}
@end
