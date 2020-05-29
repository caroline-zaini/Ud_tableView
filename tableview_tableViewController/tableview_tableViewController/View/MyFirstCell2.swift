//
//  MyFirstCell2.swift
//  tableview_tableViewController
//
//  Created by Caroline Zaini on 29/05/2020.
//  Copyright © 2020 Caroline Zaini. All rights reserved.
//

import UIKit

class MyFirstCell2: UITableViewCell {

    @IBOutlet weak var flag: UIImageView!
    @IBOutlet weak var namelbl: UILabel!
    var country: Country!
    
    func setupCell(_ country: Country) {
        self.country = country
        flag.image = self.country.flag
        namelbl.text = self.country.name
        
    }
}
