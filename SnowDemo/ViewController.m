//
//  ViewController.m
//  SnowDemo
//
//  Created by shanghaikedu on 16/1/14.
//  Copyright © 2016年 Langmuir. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    self.view.backgroundColor = [UIColor whiteColor];
    
    [NSTimer scheduledTimerWithTimeInterval:(0.2) target:self selector:@selector(ontime) userInfo:nil repeats:YES];
}

- (void)ontime{
    UIImageView * view;
    view = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"xuehua.jpg"]];
    view.alpha = 0.5;
    int x = round(random() % 320); //随机得到该图片的x坐标
    int y = round(random() % 320); //这个是该图片移动的最后坐标x轴的
    int s = round(random() % 15) + 10; //这个是定义雪花图片的大小
    int sp = 1 / round(random() % 100) + 1; //这个是速度
    view.frame = CGRectMake(x, y - 250, s, s);  //雪花开始的大小和位置
    [self.view addSubview:view];
    
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseOut];//设置动画的加速度
    [UIView setAnimationDuration:10 * sp]; //设定速度
    view.frame = CGRectMake(x, 500, s, s); //设定雪花最后的消失坐标
    [UIView setAnimationDelegate:self];
    [UIView commitAnimations];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
