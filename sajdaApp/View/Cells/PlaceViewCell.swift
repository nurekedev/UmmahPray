//
//  PlaceViewCell.swift
//  sajdaApp
//
//  Created by Nurzhan Saktaganov on 28.04.2023.
//

import UIKit

class PlaceViewCell: UICollectionViewCell {

    
    @IBOutlet weak var placesTableView: UITableView!
    var parentViewController: UIViewController?
    
    var tPlaces = [Place]()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.placesTableView.dataSource = self
        self.placesTableView.delegate = self
        self.placesTableView.register(UINib(nibName: CF.Cells.tplaces, bundle: nil), forCellReuseIdentifier:  CF.Cells.tplaces)
        
        
    }
    
    func setData(places:[Place]){
        self.tPlaces = places
        self.placesTableView.reloadData()
    }
    
    

}

extension PlaceViewCell: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.tPlaces.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CF.Cells.tplaces) as! PlacesCell
        cell.setData(place: self.tPlaces[indexPath.row])
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    
  
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let group = tPlaces[indexPath.row]
        
        if let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: CF.Controllers.detil) as? DetailViewController{
            
            vc.place = group
            vc.title = group.title
            
            parentViewController?.navigationController?.pushViewController(vc, animated: true)
            
            
        }
    }
    
    
    
    
    
  

    

}
