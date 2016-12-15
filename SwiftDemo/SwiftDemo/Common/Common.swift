//
//  Common.swift
//  SwiftDemo
//
//  Created by xxcao on 2016/12/12.
//  Copyright © 2016年 xxcao. All rights reserved.
//

import UIKit
import Foundation

class Common: NSObject {
    class func removeExtraCellLines(TableView table:UITableView){
        //除去TableView多余分割线
        let view : UIView = UIView.init()
        view.backgroundColor = UIColor.clear
        table.tableFooterView = view;
    }
}
