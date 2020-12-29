//
//  ViewController.m
//  native
//
//  Created by heshenghui on 2020/12/16.
//  Copyright © 2020 Company. All rights reserved.
//

#import "ViewController.h"
#import <flutter_boost/FlutterBoost.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    UIButton * btn = [UIButton buttonWithType:UIButtonTypeSystem];
    [btn setTitle:@"pushFlutter" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(pushFlutter) forControlEvents:UIControlEventTouchUpInside];
    btn.frame = CGRectMake(100, 100, 100, 100);
    [self.view addSubview:btn];
   
}
-(void)pushFlutter{
    [FlutterBoostPlugin open:@"first" urlParams:@{kPageCallBackId:@"MycallbackId"} exts:@{@"animated":@(YES)} onPageFinished:^(NSDictionary * result) {
        NSLog(@"call me when page finished, and your result is:%@", result);
    } completion:^(BOOL f) {
       
        NSLog(@"page is opened ； %d",f);
    }];
}

@end
