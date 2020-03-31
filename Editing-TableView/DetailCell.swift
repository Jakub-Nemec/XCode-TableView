//
//  DetailCell.swift
//  Editing-TableView
//
//  Created by Jakub Němec on 28/02/2020.
//  Copyright © 2020 Jakub Němec. All rights reserved.
//

import UIKit

class DetailCell: UITableViewCell {

    var labelCell = UILabel()
    
    func setData(text: String){
        self.labelCell.text = text
        
        }
    
    func prepareLabel(){
        self.addSubview(labelCell)
        labelCell.font = UIFont.boldSystemFont(ofSize: 29.0)
        labelCell.snp.makeConstraints { (make) in
            make.height.equalTo(50)
            make.bottom.equalToSuperview().offset(-15)
            make.top.equalToSuperview().offset(15)
            make.width.equalTo(75)
            make.center.equalToSuperview()
        }
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }

}
