//
//  AppDelegate.swift
//  SwiftDemo
//
//  Created by xxcao on 16/4/7.
//  Copyright © 2016年 xxcao. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        if (self.window == nil) {
            self.window = UIWindow(frame:UIScreen.main.bounds)
        }
        let rootViewController = self.initTabbar()
        self.window!.rootViewController = rootViewController
        self.window!.makeKeyAndVisible()
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }

    
    func initTabbar() -> UIViewController {
        let tabbarController:UITabBarController = UITabBarController()
        let  firVC:FirstViewController  = FirstViewController();
        let nav1:UINavigationController = UINavigationController(rootViewController: firVC)
        let item1 : UITabBarItem = UITabBarItem (title: "第一页面", image: nil, selectedImage: nil)
        nav1.tabBarItem = item1
        
        let  secVC:SecondViewController = SecondViewController();
        let nav2:UINavigationController = UINavigationController(rootViewController: secVC)
        let item2 : UITabBarItem = UITabBarItem (title: "第二页面", image: nil, selectedImage: nil)
        nav2.tabBarItem = item2
        
        let  thdVC:ThirdViewController = ThirdViewController();
        let nav3:UINavigationController = UINavigationController(rootViewController: thdVC)
        let item3 : UITabBarItem = UITabBarItem (title: "第三页面", image: nil, selectedImage: nil)
        nav3.tabBarItem = item3
        
        let  forthVC:ForthViewController = ForthViewController();
        let nav4:UINavigationController = UINavigationController(rootViewController: forthVC)
        let item4 : UITabBarItem = UITabBarItem (title: "第四页面", image: nil, selectedImage: nil)
        item4.badgeValue = "new"
        nav4.tabBarItem = item4
        
        tabbarController.viewControllers = [nav1,nav2,nav3,nav4];
        return tabbarController;
    }
}

