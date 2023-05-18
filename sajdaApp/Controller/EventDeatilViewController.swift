//
//  EventDeatilViewController.swift
//  sajdaApp
//
//  Created by Nurzhan Saktaganov on 30.04.2023.
//

import UIKit

class EventDeatilViewController: UIViewController {

    @IBOutlet weak var eventIcon: UIImageView!
    @IBOutlet weak var eventTitle: UILabel!
    @IBOutlet weak var fullTextLabel: UILabel!
    
    var event: Event?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let data = self.event{
            self.eventIcon.image = data.icon
            self.eventTitle.text = data.title
            self.fullTextLabel.text =
            data.description
        }
    }


}
