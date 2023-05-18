//
//  EventsCell.swift
//  sajdaApp
//
//  Created by Nurzhan Saktaganov on 30.04.2023.
//

import UIKit

class EventsCell: UICollectionViewCell {

    @IBOutlet weak var eventIcon: UIImageView!
    @IBOutlet weak var eventTitle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        eventIcon.layer.cornerRadius = 10
        
    }
    
    func setupCell(event: Event){
        self.eventIcon.image = event.icon
        self.eventTitle.text = event.title
    }

}
