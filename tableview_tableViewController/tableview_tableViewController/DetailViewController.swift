//
//  DetailViewController.swift
//  tableview_tableViewController
//
//  Created by Caroline Zaini on 27/05/2020.
//  Copyright © 2020 Caroline Zaini. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var iv: ShadowView!
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var capitalLbl: UILabel!
    
    var country: Country?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let newCountry = country else { return }
        iv.image = newCountry.flag
        nameLbl.text = newCountry.name
        capitalLbl.text = newCountry.capital
    }
    

  

}
