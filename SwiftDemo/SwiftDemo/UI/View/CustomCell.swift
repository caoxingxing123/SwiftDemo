//
//  CustomCell.swift
//  SwiftDemo
//
//  Created by xxcao on 2016/12/12.
//  Copyright © 2016年 xxcao. All rights reserved.
//

import UIKit

typealias CellClosures = (_ cell:CustomCell)->Void

class CustomCell: UITableViewCell {
    
    static var share = CustomCell()
    static var share2 = CustomCell()

    
    
    @IBOutlet var titleLabel: UILabel?
    @IBOutlet var contentLabel: UILabel?
    lazy var tetLab :UILabel? = {
        
        let tmpLab  = UILabel()
        return tmpLab
    }()
    
    var closures:CellClosures?
    
    var tmpAgeLab = UILabel.init()
    var ageLab: UILabel? {
        get {
            self.addSubview(self.tmpAgeLab)
            self.tmpAgeLab.font = UIFont.systemFont(ofSize: 16)
            self.tmpAgeLab.textColor = UIColor.darkGray
            self.tmpAgeLab.snp.makeConstraints({ (make) in
                make.right.equalTo(self).offset(-10)
                make.top.equalTo(self).offset(10)
            })
            return self.tmpAgeLab
        }
        set {
            self.ageLab = self.tmpAgeLab
        }
//        willSet {
//        
//        }
//        didSet{
//            
//        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func loadCellData(object : AnyObject) {
        var dictionary = object as! Dictionary<String, Any>
        self.titleLabel?.text = dictionary["Name"] as! String?
        self.contentLabel?.text = dictionary["Content"] as! String?
        self.ageLab?.text = (dictionary["Age"] as! String?)! + "岁"
    }
    
    @IBAction func clickBtnAction(sender: UIButton) {
        if (self.closures != nil) {
            self.closures!(self)
        }
    }
}
