//
//  RoundedImage.swift
//  tableview_tableViewController
//
//  Created by Caroline Zaini on 28/05/2020.
//  Copyright © 2020 Caroline Zaini. All rights reserved.
//

import UIKit


// On veut une image custom pour nos drapeaux :

class RoundedImage: UIImageView {

    // On aura 2 façons d'initialiser
    
    /// 1. Quand on veut une image de façon programmatique :
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    /// 2. Quand on veut une image via un storyboard ou via un XIB :
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    func setup() {
        self.layer.cornerRadius = frame.width / 2
        self.layer.borderColor = UIColor.darkGray.cgColor
        self.layer.borderWidth = 1
    }

}
