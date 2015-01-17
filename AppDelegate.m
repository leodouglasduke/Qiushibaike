//
//  AppDelegate.m
//  Qiushibaike
//
//  Created by DukeMou on 15/1/15.
//  Copyright (c) 2015年 河南蓝鸥科技有限公司. All rights reserved.
//

#import "AppDelegate.h"
#import "QiushiListViewController.h"
#import "QiushiFindViewController.h"
#import "QiushiMyselfViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

- (void)dealloc {
    [_window release];
    [super dealloc];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]] autorelease];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    QiushiListViewController *qiushiVC = [[QiushiListViewController alloc] initWithStyle:UITableViewStylePlain];
    UINavigationController *navi = [[UINavigationController alloc] initWithRootViewController:qiushiVC];
    
    QiushiFindViewController *findeVC = [[QiushiFindViewController alloc] initWithStyle:UITableViewStyleGrouped];
    UINavigationController *findNavi = [[UINavigationController alloc] initWithRootViewController:findeVC];
    
    QiushiMyselfViewController *myselfVC = [[QiushiMyselfViewController alloc] initWithStyle:UITableViewStyleGrouped];
    UINavigationController *myselfNavi = [[UINavigationController alloc] initWithRootViewController:myselfVC];
    //创建三个视图控制器对应的tabBarItem
    UITabBarItem *qiushiTab = [[UITabBarItem alloc] initWithTitle:@"糗事" image:[[UIImage imageNamed:@"icon_main"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] selectedImage:[[UIImage imageNamed:@"icon_main_active"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    qiushiVC.tabBarItem = [qiushiTab autorelease];
    
    UIImage *findNormal = [[UIImage imageNamed:@"main_tab_discovery"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UIImage *findSelected = [[UIImage imageNamed:@"main_tab_discovery_active"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UITabBarItem *findTab = [[UITabBarItem alloc] initWithTitle:@"发现" image:findNormal selectedImage:findSelected];
    findeVC.tabBarItem = [findTab autorelease];
    
    UIImage *myselfNormal = [[UIImage imageNamed:@"icon_me"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UIImage *myselfSelected = [[UIImage imageNamed:@"icon_me_active"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UITabBarItem *myselfTab = [[UITabBarItem alloc] initWithTitle:@"我" image:myselfNormal selectedImage:myselfSelected];
    myselfVC.tabBarItem = [myselfTab autorelease];
    
    UITabBarController *tabBarController = [[UITabBarController alloc] init];
    tabBarController.viewControllers = @[navi, findNavi, myselfNavi];
    tabBarController.tabBar.tintColor = [UIColor orangeColor];
    
    self.window.rootViewController = tabBarController;
    [qiushiVC release];
    [navi release];
    [findNavi release];
    [findeVC release];
    [myselfNavi release];
    [myselfVC release];
    [tabBarController release];
    
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
