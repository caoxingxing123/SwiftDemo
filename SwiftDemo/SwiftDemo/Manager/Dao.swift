//
//  Dao.swift
//  SwiftDemo
//
//  Created by xxcao on 2016/12/14.
//  Copyright © 2016年 xxcao. All rights reserved.
//

import UIKit
import SQLite

let DocPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first! + "/"
let DocInBoxPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first! + "/Inbox/"
let LibPath = NSSearchPathForDirectoriesInDomains(.libraryDirectory, .userDomainMask, true).first! + "/"
let LibCachePath = NSSearchPathForDirectoriesInDomains(.libraryDirectory, .userDomainMask, true).first! + "/Caches/"
let LibPreferencesPath = NSSearchPathForDirectoriesInDomains(.libraryDirectory, .userDomainMask, true).first! + "/Preference/"
let TmpPath = NSTemporaryDirectory() + "/"


class Dao: NSObject {
    // 定义类属性
    static var CurrentDB :Connection? = nil
/*-------------------------------UserDefaults Begin--------------------------*/
    //save
    class func saveUserDefaults(key : String, value : Any) -> Bool {
        UserDefaults.standard.set(value, forKey: key)
        UserDefaults.standard.synchronize()
        return true
    }
    
    //get
    class func getUserDefaults(key: String) -> Any {
        let id : Any?
        id = UserDefaults.standard.object(forKey: key)
        return id as Any
    }
    
    //remove
    class func removeUserDefaults(key: String) -> Bool {
        UserDefaults.standard.removeObject(forKey: key)
        UserDefaults.standard.synchronize()
        return true
    }
    
    //clear
    class func clearUserDefaults () {
        UserDefaults.resetStandardUserDefaults()
    }
/*-------------------------------UserDefaults End--------------------------*/
/*-------------------------------Sqlite Begin--------------------------*/
    class func connectDataBase(dbName : String) -> Bool{
//        if not exist create a data base
        let dbPath = LibCachePath + dbName
        NSLog( "database path is : \(dbPath)")
        CurrentDB = try? Connection(dbPath)
        
//        If you maintain multiple connections for a single database, 
//        consider setting a timeout (in seconds) and/or a busy handler:
        CurrentDB?.busyTimeout = 5
        CurrentDB?.busyHandler({ tries -> Bool in
            if tries >= 3 {
                return false
            }
            return true
        })
        
#if DEBUG
        CurrentDB?.trace({ (string) in
            NSLog( string)
        })
#endif
        return true
    }
    
    //execute sql
    class func excuteSQL(sqlString : String) {
        do {
            try CurrentDB?.execute(sqlString)
        } catch {
            NSLog( error)
        }
    }
    //count sum max min
//    executes, and returns the first value of the first row.
    class func getFirstValueSQL(sqlString : String) -> Any{
        var result : Any?
        do {
            result = try CurrentDB?.scalar(sqlString)
        } catch {
            NSLog( error)
        }
        return result as Any
    }
    
    class func selectedValueSQL(sqlString : String, modelClass: String) -> Array<Any>{
        var results : [NSObject] = []
        do {
            let stmt = try CurrentDB?.prepare(sqlString)
            for row in stmt! {
                
                let tmpClass = NSClassFromString(modelClass) as! NSObject.Type
                let object = tmpClass.init()
                for (index, name) in (stmt?.columnNames.enumerated())! {
                   // print ("\(name)=\(row[index]!)")
                    object.setValue(row[index], forKey: name)
                }
                results.append(object)
            }
        } catch {
            NSLog( error)
        }
        return results
    }
    
/*-------------------------------Sqlite End--------------------------*/

}
