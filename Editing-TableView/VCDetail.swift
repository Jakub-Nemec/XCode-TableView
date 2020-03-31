//
//  VCDetail.swift
//  Editing-TableView
//
//  Created by Jakub Němec on 14/03/2020.
//  Copyright © 2020 Jakub Němec. All rights reserved.
//

import UIKit

class VCDetail: UIViewController {
    
    var abcd: String!
    var lbl = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setData()
        
        self.view.backgroundColor = UIColor(red: 102.0/255.0, green: 102.0/255.0, blue: 153.0/255.0, alpha: 1.0)
    }
    
    func setData(){
        setTexts()
        setLabel()
    }
    
    func setTexts() {
        lbl.text = abcd
    }
    
    func setLabel(){
        self.view.addSubview(lbl)
        lbl.font = lbl.font.withSize(150.0)
        lbl.snp.makeConstraints { (make) in
            make.center.equalToSuperview()
        }
    }
}
