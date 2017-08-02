//
//  ViewController.m
//  生成二维码
//
//  Created by g1game on 16/7/25.
//  Copyright © 2016年 AlexanderYe. All rights reserved.
//

#import "ViewController.h"
#import <CoreImage/CoreImage.h>
#import "UIImage+QRCodeGenerator.h"

@interface ViewController ()
{
    UIImageView *_showImgView;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    _showImgView = [[UIImageView alloc]initWithFrame:CGRectMake(100, 150, 200, 200)];
    [self.view addSubview:_showImgView];
}
#pragma mark - 点击屏幕生成二维码，并且显示在屏幕上面
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    // 1 创建过滤器
    CIFilter *filter = [CIFilter filterWithName:@"CIQRCodeGenerator"];
    // 2 恢复默认
    [filter setDefaults];
    // 3 给过滤器添加数据,数据格式要为NSData
    NSString *dataStr = @"庆丰，自己吹的牛逼，跪着也要圆回来";
    NSData *data = [dataStr dataUsingEncoding:NSUTF8StringEncoding];
    // kvc 赋值
    [filter setValue:data forKey:@"inputMessage"];
    // 4 获取输出的二维码
    CIImage *outputImage = [filter outputImage];
    // 5 显示二维码
    _showImgView.image = [UIImage createNonInterpolatedUIImageFormCIImage:outputImage withSize:200];
}

@end
