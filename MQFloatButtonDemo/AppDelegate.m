//
//  AppDelegate.m
//  MQFloatButtonDemo
//
//  Created by 120v on 2018/4/10.
//  Copyright © 2018年 MQ. All rights reserved.
//

#import "AppDelegate.h"

#import "MQFloatButton.h"
#import "ViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    ViewController *vc = [[ViewController alloc]init];
    UINavigationController *navi = [[UINavigationController alloc]initWithRootViewController:vc];
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.rootViewController = navi;
    [self.window makeKeyAndVisible];
    
    //延迟加载VersionBtn - 避免wimdow还没出现就往上加控件造成的crash
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self setVersionBtn];
    });
    
    return YES;
}

-(void)setVersionBtn
{
    CGFloat touchW = 120;
    CGFloat touchX = 375 - touchW;
    CGFloat touchY = 43;
    CGFloat touchH = 49;
    
    NSString *versionStr = [[[NSBundle
                              mainBundle]infoDictionary]valueForKey:@"CFBundleShortVersionString"];
    NSString *buildStr = [[[NSBundle
                            mainBundle]infoDictionary]valueForKey:@"CFBundleVersion"];
    
    NSString *title = [NSString stringWithFormat:@"Ver:%@ 测试\nBuild:%@",versionStr,buildStr];
    CGRect frame = CGRectMake(touchX, touchY, touchW, touchH);
    
    //基础控件 - 没有任何属性
    //MNAssistiveBtn *btn = [MNAssistiveBtn mn_touchWithFrame:frame];
    
    //示例demo样式
    MQFloatButton *btn = [MQFloatButton mn_touchWithType:MQAssistiveTouchTypeNone Frame:frame
                                                     title:title titleColor:[UIColor whiteColor] titleFont:[UIFont systemFontOfSize:11] backgroundColor:[UIColor blackColor] backgroundImage:[UIImage imageNamed:@"test"]];
    [self.window addSubview:btn];
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
