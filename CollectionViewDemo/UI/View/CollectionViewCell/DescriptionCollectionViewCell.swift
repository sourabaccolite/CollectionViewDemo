//
//  DescriptionCollectionViewCell.swift
//  CollectionViewDemo
//
//  Created by Sourab on 12/02/19.
//  Copyright © 2019 Sourab. All rights reserved.
//

import UIKit

class DescriptionCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblDescription: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        lblTitle.backgroundColor = BrandingClass.getLightestPrimaryColor()
        lblTitle.backgroundColor = BrandingClass.getLightestPrimaryColor()
        self.contentView.backgroundColor = BrandingClass.getBackgroundColor()
        self.contentView.layer.borderColor = BrandingClass.getDarkBlackColor().cgColor
        self.contentView.layer.borderWidth = 1.0
    }

}
