//
//  MyFirstCell.swift
//  tableview_tableViewController
//
//  Created by Caroline Zaini on 28/05/2020.
//  Copyright © 2020 Caroline Zaini. All rights reserved.
//

import UIKit

class MyFirstCell: UITableViewCell {

    @IBOutlet weak var flag: RoundedImage!
    @IBOutlet weak var namelbl: UILabel!
    @IBOutlet weak var capitalLbl: UILabel!
    
    // propriété stockée didSet est appelée juste après la modificaton de la propriété.
    var country: Country! {
        didSet {
            flag.image = country.flag
            namelbl.text = country.name
            capitalLbl.text = country.capital
        }
    }
}
