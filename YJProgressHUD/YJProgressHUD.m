//
//  YJProgressHUD.m
//  PictureHouseKeeper
//
//  Created by 李亚军 on 16/8/19.
//  Copyright © 2016年 zyyj. All rights reserved.
//

#import "YJProgressHUD.h"

@implementation YJProgressHUD

+(instancetype)shareinstance{
    
    static YJProgressHUD *instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[YJProgressHUD alloc] init];
    });
    
    return instance;
    
}

+(void)show:(NSString *)msg inView:(UIView *)view mode:(YJProgressMode *)myMode{
    [self show:msg inView:view mode:myMode customImgView:nil];
}

+(void)show:(NSString *)msg inView:(UIView *)view mode:(YJProgressMode *)myMode customImgView:(UIImageView *)customImgView{
    //如果已有弹框，先消失
    if ([YJProgressHUD shareinstance].hud != nil) {
        [[YJProgressHUD shareinstance].hud hideAnimated:YES];
        [YJProgressHUD shareinstance].hud = nil;
    }
    
    //4\4s屏幕避免键盘存在时遮挡
    if ([UIScreen mainScreen].bounds.size.height == 480) {
        [view endEditing:YES];
    }
    
    [YJProgressHUD shareinstance].hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    //[YJProgressHUD shareinstance].hud.dimBackground = YES;    //是否显示透明背景
    
    //是否设置黑色背景，这两句配合使用
    [YJProgressHUD shareinstance].hud.color = [UIColor blackColor];
    [YJProgressHUD shareinstance].hud.contentColor = [UIColor whiteColor];
    
    [[YJProgressHUD shareinstance].hud setMargin:10];
    [[YJProgressHUD shareinstance].hud setRemoveFromSuperViewOnHide:YES];
    [YJProgressHUD shareinstance].hud.detailsLabel.text = msg;

    [YJProgressHUD shareinstance].hud.detailsLabel.font = [UIFont systemFontOfSize:14];
    switch ((NSInteger)myMode) {
        case YJProgressModeOnlyText:
            [YJProgressHUD shareinstance].hud.mode = MBProgressHUDModeText;
            break;

        case YJProgressModeLoading:
            [YJProgressHUD shareinstance].hud.mode = MBProgressHUDModeIndeterminate;
            break;

//        case YJProgressModeCircleLoading:{
//            [YJProgressHUD shareinstance].hud.mode = MBProgressHUDModeDeterminate;
//          
//            break;
//        }
        case YJProgressModeSuccess:
            [YJProgressHUD shareinstance].hud.mode = MBProgressHUDModeCustomView;
            [YJProgressHUD shareinstance].hud.customView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"success"]];
            break;

        default:
            break;
    }
    
    
    
}
    

+(void)hide{
    if ([YJProgressHUD shareinstance].hud != nil) {
        [[YJProgressHUD shareinstance].hud hideAnimated:YES];
    }
}


+(void)showMessage:(NSString *)msg inView:(UIView *)view{
    [self show:msg inView:view mode:YJProgressModeOnlyText];
    [[YJProgressHUD shareinstance].hud hideAnimated:YES afterDelay:1.0];
}



+(void)showMessage:(NSString *)msg inView:(UIView *)view afterDelayTime:(NSInteger)delay{
    [self show:msg inView:view mode:YJProgressModeOnlyText];
    [[YJProgressHUD shareinstance].hud hideAnimated:YES afterDelay:delay];
}

+(void)showSuccess:(NSString *)msg inview:(UIView *)view{
    [self show:msg inView:view mode:YJProgressModeSuccess];
    [[YJProgressHUD shareinstance].hud hideAnimated:YES afterDelay:1.0];
    
}


+(void)showProgress:(NSString *)msg inView:(UIView *)view{
    [self show:msg inView:view mode:YJProgressModeLoading];
}

+(MBProgressHUD *)showProgressCircle:(NSString *)msg inView:(UIView *)view{
    if (view == nil) view = (UIView*)[UIApplication sharedApplication].delegate.window;
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    hud.mode = MBProgressHUDModeAnnularDeterminate;
    hud.labelText = msg;
    return hud;
    
    
}


+(void)showMsgWithoutView:(NSString *)msg{
    UIWindow *view = [[UIApplication sharedApplication].windows lastObject];
    [self show:msg inView:view mode:YJProgressModeOnlyText];
    [[YJProgressHUD shareinstance].hud hideAnimated:YES afterDelay:1.0];
    
}

+(void)showCustomAnimation:(NSString *)msg withImgArry:(NSArray *)imgArry inview:(UIView *)view{
    
    UIImageView *showImageView = [[UIImageView alloc] init];
    
    showImageView.animationImages = imgArry;
    [showImageView setAnimationRepeatCount:0];
    [showImageView setAnimationDuration:(imgArry.count + 1) * 0.075];
    [showImageView startAnimating];
    
    [self show:msg inView:view mode:YJProgressModeCustomAnimation customImgView:showImageView];
    
    //这句话是为了展示几秒，实际要去掉
    [[YJProgressHUD shareinstance].hud hideAnimated:YES afterDelay:8.0];
    
    
}

@end
