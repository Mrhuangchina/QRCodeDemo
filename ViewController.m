//
//  ViewController.m
//  二维码带图标Demo
//
//  Created by hzzc on 16/6/24.
//  Copyright © 2016年 hzzc. All rights reserved.
//

#import "ViewController.h"
#import <CoreImage/CoreImage.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)GreatQR{
    
    //创建过滤器对象
    CIFilter *filter = [CIFilter filterWithName:@"CIQRCodeGenerator"];
    //为防止过滤器上还有上次的信息所以Defaults
    [filter setDefaults];
    NSString *String = self.TextString.text;
    //装换成二进制数据
    NSData *data = [String dataUsingEncoding:NSUTF8StringEncoding];
    //把数据赋值给过滤器
    [filter setValue:data forKey:@"inputMessage"];
    //取出二维码图片
    CIImage *imageCI = filter.outputImage;
    self.QRImageView.image = [self GreatHDQRImage:imageCI];
    
   }
//以上取出的二维码图片比较模糊 所以将取出的二维码图片绘制成高清的二维码图片
-(UIImage *)GreatHDQRImage:(CIImage *)imageCI{
    
    //创建绘制图片的底板
    CGColorSpaceRef srf = CGColorSpaceCreateDeviceGray();
    //配置绘制图片的信息
    CGContextRef contextref = CGBitmapContextCreate(nil, 200, 200, 8, 0, srf, kCGImageAlphaNone);
    //绘制图片的上下文
    CIContext *ct = [CIContext contextWithOptions:nil];
    CGImageRef imageRef = [ct createCGImage:imageCI fromRect:imageCI.extent];
    //上下文采用默认的配置
    CGContextSetInterpolationQuality(contextref, kCGInterpolationNone);
    //绘制图片
    CGContextDrawImage(contextref, self.QRImageView.bounds, imageRef);
    //取出最后绘制完成的图片
    CGImageRef lastImage = CGBitmapContextCreateImage(contextref);
    
    
    

    return [UIImage imageWithCGImage:lastImage];
}

- (IBAction)QRButton:(id)sender {
    [self GreatQR];
    
}
@end
