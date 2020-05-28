//
//  DetailViewController.swift
//  tableview_tableViewController
//
//  Created by Caroline Zaini on 27/05/2020.
//  Copyright © 2020 Caroline Zaini. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    var country: Country?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        print(country?.name)
    }
    

  

}
