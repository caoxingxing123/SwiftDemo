//
//  ViewController.swift
//  SwiftDemo
//
//  Created by xxcao on 16/4/7.
//  Copyright © 2016年 xxcao. All rights reserved.
//

import UIKit
import Alamofire

class SecondViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "第二页面";
        NotificationCenter.default.addObserver(self, selector: #selector(self.doNotification(sender:sender2:)), name: NSNotification.Name.CustomNotification.DidBegin, object: nil)
        
        
        Alamofire.request(NetworkUnit.test(urlParameter: "")).responseJSON { (response) in
            let json = response.result.value
            print("\(json)")
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func doNotification(sender:AnyObject, sender2:AnyObject) {
        print("1111")
    }
}

