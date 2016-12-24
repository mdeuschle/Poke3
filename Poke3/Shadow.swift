//
//  Shadow.swift
//  Poke3
//
//  Created by Matt Deuschle on 12/23/16.
//  Copyright © 2016 Matt Deuschle. All rights reserved.
//

import UIKit

extension UICollectionViewCell {

    func addShadow() {

        self.contentView.layer.cornerRadius = 5.0
        self.contentView.layer.borderWidth = 1.0
        self.contentView.layer.borderColor = UIColor.clear.cgColor
        self.contentView.layer.masksToBounds = true

        self.layer.shadowColor = UIColor.darkGray.cgColor
        self.layer.shadowOpacity = 1.0
        self.layer.shadowRadius = 1.0
        self.layer.masksToBounds = false
        self.layer.shadowOffset = CGSize(width: 1.0, height: 1.5)
    }
}


