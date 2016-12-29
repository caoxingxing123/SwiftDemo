//
//  MainViewController.swift
//  SwiftDemo
//
//  Created by xxcao on 2016/12/29.
//  Copyright © 2016年 xxcao. All rights reserved.
//

import UIKit

class MainViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        tabBar.tintColor = UIColor.orange
        addChildViewControllers()
    }
    
    func addChildViewController(_ childController: UIViewController, title: String, imgName:String?, highImgName:String?){
        let nav = UINavigationController.init(rootViewController: childController)
        nav.tabBarItem.title = title
        nav.tabBarItem.image = UIImage.init(named: imgName!)
        nav.tabBarItem.selectedImage = UIImage.init(named: highImgName!)
        addChildViewController(nav)
    }
    
    func addChildViewControllers() {
        addChildViewController(FirstViewController(), title: "第一页面", imgName: "", highImgName: "")
        addChildViewController(SecondViewController(), title: "第二页面", imgName: "", highImgName: "")
        addChildViewController(ThirdViewController(), title: "第三页面", imgName: "", highImgName: "")
        addChildViewController(ForthViewController(), title: "第四页面", imgName: "", highImgName: "")
    }
}
