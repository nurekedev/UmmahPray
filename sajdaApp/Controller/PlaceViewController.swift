//
//  FeedsViewController.swift
//  sajdaApp
//
//  Created by Nurzhan Saktaganov on 26.04.2023.
//

import UIKit

class PlaceViewController: UIViewController {

    
    @IBOutlet weak var eventCollectionView: UICollectionView!
    @IBOutlet weak var parentGroupCollection: UICollectionView!
    
    let guide:Guide = Guide()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       
        
        self.parentGroupCollection.register(UINib(nibName: CF.Cells.categoryPlace, bundle: nil), forCellWithReuseIdentifier: CF.Cells.categoryPlace)
        
        self.parentGroupCollection.dataSource = self
        self.parentGroupCollection.delegate = self
        
        self.eventCollectionView.register(UINib(nibName: CF.Cells.event, bundle: nil), forCellWithReuseIdentifier: CF.Cells.event)
        
        self.eventCollectionView.dataSource = self
        self.eventCollectionView.delegate = self
    }
    

}

extension PlaceViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == parentGroupCollection{
            return self.guide.groups.count
        }else{
            return self.guide.events.count
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == parentGroupCollection{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CF.Cells.categoryPlace, for: indexPath) as! CatogoryPlaceViewCell
            let group = self.guide.groups[indexPath.item]
            cell.setupCell(category: group)
            
            return cell
        }else{
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CF.Cells.event, for: indexPath) as! EventsCell
            let events = self.guide.events[indexPath.item]
            cell.setupCell(event: events)
            
            return cell
        
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == parentGroupCollection{
            return CGSize(width: collectionView.frame.width, height: 150)
        }
        else{
            return CGSize(width: collectionView.frame.width/3 , height: collectionView.frame.height)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == parentGroupCollection{
            let group = self.guide.groups[indexPath.item]
            if let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: CF.Controllers.subCategories) as? SecondaryViewController{
                vc.group = group
                vc.title = group.name
                navigationController?.pushViewController(vc, animated: true)              
            }
        }else{
            
            let events = self.guide.events[indexPath.item]
            if let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: CF.Controllers.eventVC) as? EventDeatilViewController{
                vc.event = events
                vc.title = events.title
                navigationController?.pushViewController(vc, animated: true)
                
                
            }
        }
        
    }
}
