//
//  CustomBarController.swift
//  sajdaApp
//
//  Created by Nurzhan Saktaganov on 17.04.2023.
//

import UIKit

class CustomBarController: UITabBarController {


    override func viewDidLoad() {
        super.viewDidLoad()
        tabBar.layer.cornerRadius = 20
        tabBar.layer.position = CGPoint(
            x: view.frame.width / 2,
            y: view.frame.height - tabBar.frame.height / 2
        )
        

        
    }
    


}
