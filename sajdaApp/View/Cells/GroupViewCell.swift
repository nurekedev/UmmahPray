//
//  GroupViewCell.swift
//  sajdaApp
//
//  Created by Nurzhan Saktaganov on 28.04.2023.
//

import UIKit

class GroupViewCell: UICollectionViewCell {

    @IBOutlet weak var groupTilte: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
                
      
    }
    private var bottomLineLayer: CALayer?
        
        func setupCell(group: Group, isActive: Bool) {
            self.groupTilte.text = group.name
            
            if isActive {
               
                if self.bottomLineLayer == nil {
                    let bottomLineLayer = CALayer()
                    bottomLineLayer.backgroundColor = UIColor.orange.cgColor
                    bottomLineLayer.frame = CGRect(x: 0, y: self.frame.height - 5, width: self.frame.width, height: 5)
                    self.layer.addSublayer(bottomLineLayer)
                    self.bottomLineLayer = bottomLineLayer
                }
            } else {
                
                self.bottomLineLayer?.removeFromSuperlayer()
                self.bottomLineLayer = nil
            }
        }


}
