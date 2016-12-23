//
//  DetailViewController.swift
//  SwiftDemo
//
//  Created by xxcao on 2016/12/22.
//  Copyright © 2016年 xxcao. All rights reserved.
//

import UIKit

class DetailViewController: BaseViewController,JXMovableCellTableViewDelegate,JXMovableCellTableViewDataSource{
    lazy var tableView: JXMovableCellTableView? = {
        var table : JXMovableCellTableView = JXMovableCellTableView.init()
        table.delegate = self;
        table.dataSource = self;
        Common.removeExtraCellLines(TableView: table)
        return table
    }()
    
    lazy var dataSource: [Dictionary<String,Any>]? = {
        var array: [Dictionary<String,Any>] = []
        for i in 0 ..< 20 {
            let dic = ["Key": "sb" + String(i), "Name": String(i) + "tom" + String(i)]
            array.append(dic)
        }
        return array
    }()
    
        
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        view.addSubview(tableView!)
        tableView?.snp.makeConstraints({ (make) in
            make.edges.equalToSuperview()
        })
        
        print("contentOffSet.y : \(tableView?.contentOffset.y)")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
//MARK: UITableView Related
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        }
        return (dataSource?.count)!
    }
    
    public func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    static var cellID = "CellIdentify"
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell:UITableViewCell? = tableView.dequeueReusableCell(withIdentifier: DetailViewController.cellID)
        if cell == nil {
            cell =  UITableViewCell.init(style: .default, reuseIdentifier: DetailViewController.cellID)
        }
        if indexPath.section == 1 {
            cell?.textLabel?.text = dataSource?[indexPath.row]["Name"] as? String;
        } else {
            cell?.textLabel?.text = "TEST"
        }
        return cell!
    }
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return 100
        }
        return 44
    }
    
/**
*  获取tableView的数据源数组
//   */
    func dataSourceArray(in tableView: JXMovableCellTableView!) -> [Any]! {
        return dataSource
    }
    
/**
*  返回移动之后调换后的数据源
*/
    func tableView(_ tableView: JXMovableCellTableView!, newDataSourceArrayAfterMove newDataSourceArray: [Any]!) {
        dataSource = newDataSourceArray as! [Dictionary<String, Any>]?
    }
}
