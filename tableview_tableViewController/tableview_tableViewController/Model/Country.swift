//
//  Country.swift
//  tableview_tableViewController
//
//  Created by Caroline Zaini on 26/05/2020.
//  Copyright © 2020 Caroline Zaini. All rights reserved.
//

import UIKit

class Country {
    
    private var _name: String
    private var _capital: String
    private var _countryCode: String
    
    var name: String {
        return _name
    }
    
    var capital: String {
        return _capital
    }
    
    var flag: UIImage? {
        return UIImage(named: _countryCode)
    }
    
    init(name: String, capital: String, countryCode: String) {
        self._name = name
        self._capital = capital
        self._countryCode = countryCode
    }
    
}




