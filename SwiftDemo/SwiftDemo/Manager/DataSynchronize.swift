//
//  DataSynchronize.swift
//  SwiftDemo
//
//  Created by xxcao on 2016/12/21.
//  Copyright © 2016年 xxcao. All rights reserved.
//

import UIKit

protocol DataSynchronizeProtocol {
//    var dbDatas:Array<Any> { get set }
//    var serverDatas:Array<Any>{ get set }
    func synchronize(DataBase dbData : Array<Any>, ServerData serData: Array<Any>) -> Bool
}


extension DataSynchronizeProtocol where Self : BaseViewController {
    func synchronize(DataBase dbData : Array<Any>, ServerData serData: Array<Any>) -> Bool {
        NSLog( "protcol is called")
        //first. caculate datas in database not in serverdata  -> set one
        //second. delete set one from DB
        //third. caculate datas in both database and serverdata -> set two
        //forth. update set two into DB
        //fifth. caculate datas in serverdata not in database -> set three
        //sixth. insert set three into DB
        return true
    }
}
