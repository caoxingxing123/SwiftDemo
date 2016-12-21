//
//  ViewController.swift
//  SwiftDemo
//
//  Created by xxcao on 16/4/7.
//  Copyright © 2016年 xxcao. All rights reserved.
//

import UIKit

class ForthViewController: BaseViewController, DataSynchronizeProtocol {

    var dict: [String: Any]?
    var myUsername: String?
    var myPassword: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "第四页面";
//        let nums = [1, 2, 3, 4, 5, 6, 7]
//        let strs = nums.map {String($0)+"￥"}
//        print("----->\(strs)")
//      
        let strings = ["23","12","10","9","1","100"]
//        let numbers = strings.map { Int($0) }
//        print("----->\(numbers)")
//        
//        let numbers2 = strings.filter { (tmpStr) -> Bool in
//          Int(tmpStr)! < 15
//        }
//        print("----->\(numbers2)")
        
        let numbers3 = strings.joined(separator: ",")
        print("----->\(numbers3)")

        let numbers4 = strings.map({$0 + "sb"})
        print("----->\(numbers4)")

        let numbers5 = strings.filter({Int($0)! > 15})
        print("----->\(numbers5)")

        
        let nums = [11, 12,23, 14, 25, 46, 17]

        let numbers6 = nums.reduce(0,{max($0, $1)})
        //尾随闭包
        _ = nums.reduce(0) { (result, num) -> Int in
           return result + num
        }
        print("----->\(numbers6)")

        let emojis = String(repeatElement("🐤", count: 5))
        print("----->\(emojis)")

        let emojis2 = repeatElement("🐥", count: 20)
        print("----->\(emojis2)")

        let numbers7 = nums.sorted(by: {$0 > $1})
        print("----->\(numbers7)")
        
        //protocol test
        let isSynchronize = synchronize(DataBase: [], ServerData: [])
        print("\(isSynchronize)")
        
        
        //Generics
        let stringArray = ["测试", "策划", "策反"]
        let doubleArray = [3.14, 0.25, 100.01, 3.333333];
        let intArray = [3, 0, 100, 3, 50];

        printElementFromArray(array: stringArray)
        printElementFromArray(array: doubleArray)
        printElementFromArray(array: intArray)
        
        var useColor: String?
        useColor = "red"
        let count = useColor?.utf8.count
        print("count is :\(count)")
        let resultColor = useColor ?? "blue"
        print(resultColor)
        
        print("1:\(10.advanced(by: 5)), 2:\(5.distance(to: 15))")
        
//        fatalError("hello,bug")
        
        print("test string is:","hello","world",separator:"|",terminator:"->")
        print("Woo", "Hey", "Haha")
        
        
        var values = ["LiLei","HanMeimei","Tom","Jim","John","Jack"][1 ... 3]
        values.sort()
        print("sort1 result is:\(values)")
        values.sort { (str1, str2) -> Bool in
           return str1 > str2
        }
        values.sort(by: >)
        print("sort2 result is:\(values)")
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("view begin")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("view end")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
//MARK: Custom Method
    /**
     打印数组内容
     
     - parameter array:   一个泛型数组
 */
    func printElementFromArray <T> (array : [T]) {
        for element in array {
            print(element)
        }
    }
    
    func userLogin() {
        //1.
        guard let _ = myUsername, let _ = myPassword
            else {
                return
            }
        print("welcome to app")
        
        //2.
        if let _ = myUsername, let _ = myPassword {
            print("welcome to app 2")
        }
    }
    
    func getSum(parameters: Double...) -> Double {
        var sum = 0.0
        for value in parameters {
            sum += value
        }
        return sum
    }
}

