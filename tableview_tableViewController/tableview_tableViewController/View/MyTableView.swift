//
//  MyTableView.swift
//  tableview_tableViewController
//
//  Created by Caroline Zaini on 29/05/2020.
//  Copyright © 2020 Caroline Zaini. All rights reserved.
//

import UIKit

class MyTableView: UITableView {

  // Cette classe est pour montrer qu'on aurait pu faire une tableView custom
    
    // Dans le Main.storyboard on met le background de la cell de MyCustomTableView et son content mode en "clear color"
    
    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    func setup() {
        backgroundColor = .systemIndigo
    }

}
