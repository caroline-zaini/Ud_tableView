//
//  ShadowVIew.swift
//  tableview_tableViewController
//
//  Created by Caroline Zaini on 29/05/2020.
//  Copyright © 2020 Caroline Zaini. All rights reserved.
//

import UIKit

// il faut changer la classe de l'imageView dans le main.storyboard

class ShadowView: UIImageView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayer()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupLayer()
    }
    
    func setupLayer() {
        clipsToBounds = false
        layer.shadowColor = UIColor.darkGray.cgColor
        layer.shadowOpacity = 0.75 // entre 0 et 1
        layer.shadowRadius = 4
        layer.shadowOffset = CGSize(width: 2, height: 3)  // comment ça va se déplacer
    }

}
