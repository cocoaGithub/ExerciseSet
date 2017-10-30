//
//  AppDelegate.m
//  basic exercise
//
//  Created by cocoa on 2017/5/22.
//  Copyright © 2017年 wangbingyan. All rights reserved.
//

#import "AppDelegate.h"
#import "FirstViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    //获取屏幕大小
    UIScreen *screen = [UIScreen mainScreen];
    //初始化窗口
    self.window = [[UIWindow alloc]initWithFrame:screen.bounds];
    //实例化导航视图控制器并添加视图1进来
    UINavigationController *navC = [[UINavigationController alloc] initWithRootViewController:[[FirstViewController alloc] init]];
    //将导航视图控制器设置为窗口根视图
    [self.window setRootViewController:navC];
    [self.window setBackgroundColor:[UIColor whiteColor]];
    //设置窗口可见
    [self.window makeKeyAndVisible];
    return YES;
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
