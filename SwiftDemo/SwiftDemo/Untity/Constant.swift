//
//  Constant.swift
//  SwiftDemo
//
//  Created by xxcao on 2016/12/13.
//  Copyright © 2016年 xxcao. All rights reserved.
//

import UIKit

//通知
extension Notification.Name {
    public struct CustomNotification {
        public static let DidBegin = Notification.Name(rawValue: "dream.swiftDemo.notification.name.customNotification.didBegin")
        
        public static let DidChange = Notification.Name(rawValue: "dream.swiftDemo.notification.name.customNotification.didChange")
        
        public static let DidCancel = Notification.Name(rawValue: "dream.swiftDemo.notification.name.customNotification.didCancel")
        
        public static let DidEnd = Notification.Name(rawValue: "dream.swiftDemo.notification.name.customNotification.didEnd")
    }
}

//UserDefaultsKey
enum UserDefaultsKey : String {
    case userName = "dream.swiftDemo.userDefaults.key.userName"
    case userSex = "dream.swiftDemo.userDefaults.key.userSex"
    case userAge = "dream.swiftDemo.userDefaults.key.userAge"
    case userPhone = "dream.swiftDemo.userDefaults.key.userPhone"
}

//Table name
let TABLE_TT_Project_Members = "TT_Project_Members"
let TABLE_TT_User = "TT_User"


