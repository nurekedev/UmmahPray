//
//  CatogoryPlaceViewCell.swift
//  sajdaApp
//
//  Created by Nurzhan Saktaganov on 28.04.2023.
//

import UIKit

class CatogoryPlaceViewCell: UICollectionViewCell {
    @IBOutlet weak var categoryTitlePhoto: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        categoryTitlePhoto.layer.cornerRadius = 20
    }
    
    func setupCell(category: Group){
        self.categoryTitlePhoto.image = category.titleImage
    }

}
