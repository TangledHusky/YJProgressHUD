//
//  YJProgressHUD.h
//  PictureHouseKeeper
//
//  Created by 李亚军 on 16/8/19.
//  Copyright © 2016年 zyyj. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MBProgressHUD/MBProgressHUD.h>

typedef enum{
    YJProgressModeOnlyText=10,           //文字
    YJProgressModeLoading,              //加载菊花
    YJProgressModeCircle,               //加载环形
    YJProgressModeCircleLoading,         //加载圆形-要处理进度值
    YJProgressModeCustomAnimation,         //自定义加载动画（序列帧实现）
    YJProgressModeSuccess               //成功
    
}YJProgressMode;

@interface YJProgressHUD : NSObject

/*===============================   属性   ================================================*/

@property (nonatomic,strong) MBProgressHUD  *hud;


/*===============================   方法   ================================================*/

+(instancetype)shareinstance;

//显示
+(void)show:(NSString *)msg inView:(UIView *)view mode:(YJProgressMode *)myMode;

//隐藏
+(void)hide;

//显示提示（1秒后消失）
+(void)showMessage:(NSString *)msg inView:(UIView *)view;

//显示提示（N秒后消失）
+(void)showMessage:(NSString *)msg inView:(UIView *)view afterDelayTime:(NSInteger)delay;

//显示进度(菊花)
+(void)showProgress:(NSString *)msg inView:(UIView *)view;

//显示进度(环形)
+(void)showProgressCircleNoValue:(NSString *)msg inView:(UIView *)view ;

//显示进度(转圈-要处理数据加载进度)
+(MBProgressHUD *)showProgressCircle:(NSString *)msg inView:(UIView *)view;

//显示成功提示
+(void)showSuccess:(NSString *)msg inview:(UIView *)view;

//在最上层显示
+(void)showMsgWithoutView:(NSString *)msg;

//显示自定义动画(自定义动画序列帧  找UI做就可以了)
+(void)showCustomAnimation:(NSString *)msg withImgArry:(NSArray *)imgArry inview:(UIView *)view;

@end
