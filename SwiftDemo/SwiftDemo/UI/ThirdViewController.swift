//
//  ViewController.swift
//  SwiftDemo
//
//  Created by xxcao on 16/4/7.
//  Copyright © 2016年 xxcao. All rights reserved.
//

import UIKit

class ThirdViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "第三页面";
        
        //0.
        _ = Dao.connectDataBase(dbName: "test.db")
        
        //1.
        let createTableString = "CREATE TABLE TT_Project_Members(" +
        "project_id varchar," +
        "user_id varchar," +
        "user_name varchar," +
        "user_img_url varchar," +
        "PRIMARY KEY(user_id)" +
        "); "
        Dao.excuteSQL(sqlString: createTableString)
        
        //2.
        let insertTableString = "delete from TT_Project_Members;" +
        "INSERT INTO TT_Project_Members(project_id, user_id, user_name, user_img_url) VALUES('0001','000001','曹兴星','1.png');" +
        "INSERT INTO TT_Project_Members(project_id, user_id, user_name, user_img_url) VALUES('0001','000002','刘鹏','3.png');" +
        "INSERT INTO TT_Project_Members(project_id, user_id, user_name, user_img_url) VALUES('0001','000003','陈杰','5.png');" +
        "INSERT INTO TT_Project_Members(project_id, user_id, user_name, user_img_url) VALUES('0001','000004','赵瑞','7.png');" +
        "INSERT INTO TT_Project_Members(project_id, user_id, user_name, user_img_url) VALUES('0001','000005','琳琳','9.png');" +
        "INSERT INTO TT_Project_Members(project_id, user_id, user_name, user_img_url) VALUES('0001','000006','俞弦','11.png');" +
        "INSERT INTO TT_Project_Members(project_id, user_id, user_name, user_img_url) VALUES('0001','000007','董宇鹏','13.png');" +
        "INSERT INTO TT_Project_Members(project_id, user_id, user_name, user_img_url) VALUES('0001','000008','齐云猛','15.png');" +
        "INSERT INTO TT_Project_Members(project_id, user_id, user_name, user_img_url) VALUES('0001','000009','焦兰兰','17.png');" +
        "INSERT INTO TT_Project_Members(project_id, user_id, user_name, user_img_url) VALUES('0001','000010','严必庆','2.png');" +
        "INSERT INTO TT_Project_Members(project_id, user_id, user_name, user_img_url) VALUES('0001','000011','陆毅全','4.png');"
        Dao.excuteSQL(sqlString: insertTableString)
        
        //3.
        let count = Dao.getFirstValueSQL(sqlString: "select count (*) from TT_Project_Members")
        NSLog( "data count is : \(count)")
        //4.
        let array = Dao.selectedValueSQL(sqlString: "select * from TT_Project_Members", modelClass: TABLE_TT_Project_Members)
        
        
        for i in 0 ..< (Int(count as! Int64)){
            let item = array[i] as! TT_Project_Members
            NSLog( "array is :\n \(item.project_id) \n \(item.user_id) \n \(item.user_name) \n \(item.user_img_url) \n")
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

