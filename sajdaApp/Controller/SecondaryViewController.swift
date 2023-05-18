//
//  CompasViewController.swift
//  sajdaApp
//
//  Created by Nurzhan Saktaganov on 17.04.2023.
//

import UIKit



class SecondaryViewController: UIViewController {

    @IBOutlet weak var placeCollectionView: UICollectionView!
    @IBOutlet weak var groupCollectionView: UICollectionView!
    
    var group: Group!
    var subGroups: Group?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        self.placeCollectionView.register(UINib(nibName: CF.Cells.place, bundle: nil), forCellWithReuseIdentifier: CF.Cells.place)
        self.placeCollectionView.dataSource = self
        self.placeCollectionView.delegate = self
        
        self.groupCollectionView.register(UINib(nibName: CF.Cells.group, bundle: nil), forCellWithReuseIdentifier: CF.Cells.group)
        self.groupCollectionView.dataSource = self
        self.groupCollectionView.delegate = self
        
        if let subChecker = group.groups, subChecker.count > 0{
            subGroups = subChecker.first!
        }else{
            subGroups = group
        }
              
    }


    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        if scrollView == placeCollectionView{
            let cells = placeCollectionView.visibleCells
            if let cell = cells.first, let indexPath = self.placeCollectionView.indexPath(for: cell){
                self.subGroups = self.group.groups![indexPath.item]
                
                self.groupCollectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
                self.groupCollectionView.reloadData()
            }
        }
    }
}

extension SecondaryViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
     
            
            if let selectedGroup = group.groups{
                return selectedGroup.count
            }else{
                return 0
            }
            
    
        
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView == groupCollectionView{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CF.Cells.group, for: indexPath) as! GroupViewCell
            let group = self.group.groups![indexPath.item]
            
            let status = group.name == subGroups?.name
            
            cell.setupCell(group: group, isActive: status)

            return cell
            
        }else{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CF.Cells.place, for: indexPath) as! PlaceViewCell

            let places = self.group.groups![indexPath.item].places
            cell.setData(places: places!)
            cell.parentViewController = self
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == groupCollectionView{
            let group = self.group.groups![indexPath.item].name

            return CGSize(width: collectionView.frame.width / 2  , height: collectionView.frame.height)
        }else{
            return CGSize(width: UIScreen.main.bounds.width - 16, height: collectionView.frame.height)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        if collectionView == placeCollectionView{
            return 20
        }else{
            return 10
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        if collectionView == placeCollectionView{
            return 10
        }else{
            return 10
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 8, bottom: 0, right: 8)
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == groupCollectionView{
            
            self.subGroups = self.group.groups![indexPath.item]
            self.groupCollectionView.reloadData()
            self.groupCollectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
            
            self.placeCollectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
    
        }
       
    }
    
    
}





