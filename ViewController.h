//
//  ViewController.h
//  二维码带图标Demo
//
//  Created by hzzc on 16/6/24.
//  Copyright © 2016年 hzzc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIImageView *IconImageView;
@property (weak, nonatomic) IBOutlet UIImageView *QRImageView;
@property (weak, nonatomic) IBOutlet UITextField *TextString;

- (IBAction)QRButton:(id)sender;
@end

