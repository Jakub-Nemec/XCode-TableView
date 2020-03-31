//
//  ViewController.swift
//  Editing-TableView
//
//  Created by Jakub Němec on 04/02/2020.
//  Copyright © 2020 Jakub Němec. All rights reserved.
//

import UIKit
import SnapKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var table = UITableView()
    
    var dataArray = ["CCC", "BBB", "AAA", "EEE", "DDD", "FFF"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .blue
        
        setUpTableView()
    }

    func setUpTableView(){
        table = UITableView(frame: self.view.bounds, style: UITableView.Style.plain)
        table.dataSource = self
        table.delegate = self
        table.backgroundColor = #colorLiteral(red: 0.9411764741, green: 0.4980392158, blue: 0.3529411852, alpha: 1)
        table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        view.addSubview(table)
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row % 2 == 0{
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? DetailCell ?? DetailCell()

            table.rowHeight = 80
            cell.prepareLabel()
            cell.setData(text: dataArray[indexPath.row])
            cell.backgroundColor = .clear
            return cell
        }else{
           let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? DetailCell ?? DetailCell()
            
            table.rowHeight = 240
            cell.prepareLabel()
            cell.setData(text: dataArray[indexPath.row])
            cell.backgroundColor = .clear
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = VCDetail()
        let selectedRow = dataArray[indexPath.row]
        vc.abcd = selectedRow
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
    func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let accept = UIContextualAction(style: .normal, title: "Accept") { (action, view, nil) in
            print("Accept")
        }
        
        accept.backgroundColor = #colorLiteral(red: 0.1960784346, green: 0.3411764801, blue: 0.1019607857, alpha: 1)
        let config = UISwipeActionsConfiguration(actions: [accept])
        config.performsFirstActionWithFullSwipe = false
        return config
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let delete = UIContextualAction(style: .destructive, title: "Delete") { (action, view, nil) in
            print("Delete")
        }
        delete.backgroundColor = #colorLiteral(red: 0.521568656, green: 0.1098039225, blue: 0.05098039284, alpha: 1)
        return UISwipeActionsConfiguration(actions: [delete])
    }
}
