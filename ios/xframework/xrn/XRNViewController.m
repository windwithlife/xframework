//
//  XRNViewController.m
//  reactnative_multibundler
//
//  Created by ctrip on 2018/11/1.
//  Copyright © 2018年 Facebook. All rights reserved.
//
#import <React/RCTBundleURLProvider.h>
#import <React/RCTRootView.h>
#import <React/RCTBridge+Private.h>
#import "RCTBridge.h"

#import "XRNViewController.h"

@interface XRNViewController ()

@end

@implementation XRNViewController


- (void)viewDidLoad {
  [super viewDidLoad];
  // Do any additional setup after loading the view.
  self.edgesForExtendedLayout = UIRectEdgeNone;
  self.automaticallyAdjustsScrollViewInsets = NO;
  
  
  
  // 添加进入条
  //_progressView = [[UIProgressView alloc] init];
  //_progressView.frame = self.view.bounds;
  //[self.view addSubview:_progressView];
  //_progressView.backgroundColor = [UIColor blackColor];
  
  self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"后退" style:UIBarButtonItemStyleDone target:self action:@selector(goback)];
  self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"前进" style:UIBarButtonItemStyleDone target:self action:@selector(gofarward)];
}

- (XRNViewController*)attachRNBridge:(RCTBridge *)bridge moduleName:(NSString*)moduleName bundleName:(NSString*)bundleName {
  //BOOL isBundleLoaded = NO;
  
  //if(isBundleLoaded==NO){
    //NSBundle * bundle = [NSBundle bundleForClass:self.class];
    //NSURL *jsCodeLocationBuz = [bundle URLForResource:bundleName withExtension:@"bundle"];
    NSURL *jsCodeLocationBuz = [[NSBundle mainBundle] URLForResource:bundleName withExtension:@"bundle"];
    NSError *error = nil;
    NSData *sourceBuz = [NSData dataWithContentsOfFile:jsCodeLocationBuz.path
                                               options:NSDataReadingMappedIfSafe
                                                 error:&error];
    [bridge.batchedBridge executeSourceCode:sourceBuz sync:NO];
  //}
  RCTRootView* view = [[RCTRootView alloc] initWithBridge:bridge moduleName:moduleName initialProperties:nil];
  //UIViewController* controller = [UIViewController new];
  [self setView:view];
  self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"后退" style:UIBarButtonItemStyleDone target:self action:@selector(goback)];
  self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"前进" style:UIBarButtonItemStyleDone target:self action:@selector(gofarward)];
  return self;
}

- (void)goback {
  
  [self.navigationController popViewControllerAnimated:true];
  
}

- (void)gofarward {
  //    if ([self.webView canGoForward]) {
  //        [self.webView goForward];
  //    }
  //JKTestVC *testVC = [JKTestVC new];
  //testVC.url = @"https://www.baidu.com";
  //[self.navigationController pushViewController:testVC animated:YES];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
