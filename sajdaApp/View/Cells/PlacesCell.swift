//
//  PlacesCell.swift
//  sajdaApp
//
//  Created by Nurzhan Saktaganov on 28.04.2023.
//

import UIKit

class PlacesCell: UITableViewCell {

    @IBOutlet weak var cellSchedule: UILabel!
    @IBOutlet weak var cellTitle: UILabel!
    @IBOutlet weak var cellImage: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        cellImage.layer.cornerRadius = 10
      
    }

    
    func setData(place: Place){
        self.cellImage.image = place.poster
        self.cellTitle.text = place.title
        self.cellSchedule.text = "\(place.schedule)"
    }
    
    
}
