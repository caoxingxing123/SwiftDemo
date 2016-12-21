//
//  ViewController.swift
//  SwiftDemo
//
//  Created by xxcao on 16/4/7.
//  Copyright © 2016年 xxcao. All rights reserved.
//

import UIKit
import Alamofire

class FirstViewController: BaseViewController,UITableViewDelegate,UITableViewDataSource{
    
    @IBOutlet var tableView :UITableView!
    var dataSource:Array<Any>?
    var nib : UINib?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "第一页面";
        self.dataSource = self.loadInitData()
        
        //除去TableView多余分割线
        Common.removeExtraCellLines(TableView:self.tableView)
        self.nib = UINib.init(nibName: "CustomCell", bundle: nil)
        self.tableView.estimatedRowHeight = 60;
        self.tableView.rowHeight = UITableViewAutomaticDimension;
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let identifier = "identifier"
        var cell = tableView.dequeueReusableCell(withIdentifier: identifier)
        if cell == nil {
            cell = self.nib?.instantiate(withOwner: self, options: nil).first as! CustomCell?
        }
        let dictionary = self.dataSource?[indexPath.row] as! Dictionary<String,Any>;
        (cell as! CustomCell).loadCellData(object: dictionary as AnyObject)
        (cell as! CustomCell).closures = {(tmpCell : CustomCell)->Void in
            let row = indexPath.row
            let section = indexPath.section
            print("indexPath Section:\(section), Row:\(row)")
            
            Alamofire.request("https://api.500px.com/v1/photos",method:.get).responseJSON(completionHandler: { response in
                print(response.request as Any)
                print(response.response as Any)
                print(response.data as Any)
                print(response.result)
                
                let json = response.result.value
                print("JSON: \(json)")
            })
            
//            NotificationCenter.default.post(name: NSNotification.Name.CustomNotification.DidBegin, object: nil)
        }
        return cell!
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataSource!.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    
    func loadData(dataSource: Array<String>) -> Array<String> {
        let array = dataSource
        return array
    }
    
    func loadInitData() -> Array<Any> {
        let dictionary1 = ["Name":"xxcao","Sex":"1","Age":"12","Content":"今天删除app里面第三方类库的之后，xcode在编译的时候出现了这个问题。1111"]
        //方式一
//        var array = [dictionary1]
        
        //方式二
        var array:[Dictionary<String, String>] = []
        array.append(dictionary1)
        
        let dictionary2 = ["Name":"LP","Sex":"0","Age":"22","Content":"如果觉得我的文章对您有用，请随意打赏。您的支持将鼓励我继续创作！22222"]
        array.append(dictionary2)
        
        let dictionary3 = ["Name":"ZhaoRui","Sex":"1","Age":"32","Content":"了适应各种屏幕尺寸，iOS 6后引入了自动布局（Auto Layout）的概念，通过使用各种 Constraint（约束）来实现页面自适应弹性布局。（想了解更多可查看我原来写的这篇文章：Swift - 使用Auto Layout和Size Classes实现页面自适应弹性布局）33333"]
        array.append(dictionary3)
        
        
        for i in 1 ... 5 {
            let dictionary = ["Name":"TEST" + String(i),
                              "Sex":"1",
                              "Age":String(30 + i),
                              "Content":"SnapKit是能让开发者在iOS和OS X上更简单地进行Auto Layout的DSL，下面我们来看一篇关于Swift 自动布局库SnapKit的使用详解1（配置、使用方法、样例）希望对各位有帮助哦。" + String(i)]
            array.append(dictionary)
        }

        return array
    }
}

