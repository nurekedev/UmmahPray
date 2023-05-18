//
//  DetailViewController.swift
//  sajdaApp
//
//  Created by Nurzhan Saktaganov on 28.04.2023.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var fullImage: UIImageView!
    
    @IBOutlet weak var detailTableView: UITableView!

    
    
    var place: Place?
    var detailInfo = [String]()
    var locationFolder = [String]()
    var detailTitle = ["Schedule:", "Abulation place:", "Section for womens:", "Juma Prayer: ", "Capacity:"]
    var iconContainer = ["clock", "water", "women", "juma", "people"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.detailTableView.dataSource = self
        self.detailTableView.delegate = self
        
      
      
        self.detailTableView.layer.cornerRadius = 12
 
        if let data = self.place{
            self.fullImage.image = data.poster
            self.titleLabel.text = data.title
            self.addressLabel.text = data.address
            self.detailInfo.append(data.schedule)
            self.detailInfo.append("\(changer(status: data.abulation))")
            self.detailInfo.append("\(changer(status: data.womenSection))")
            self.detailInfo.append("\(changer(status: data.jumaStatus))")
            self.detailInfo.append("\(data.capacity)")
            
            self.locationFolder.append("\(data.location)")
         
           
        }
                
            func changer(status:Bool)->String{
                return status ? "Yes" : "No"
            }
 
       
    
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showMap"{
            let vc = segue.destination as! FullMapViewController
            vc.place = place
        }
    }
}

extension DetailViewController: UITableViewDataSource, UITableViewDelegate{
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView.tag == 0{
            return 2
        
        }else{
            return 5
        }
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
 
           
            switch indexPath.row{
                
            case 0:
                
                let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: PlaceLocationViewCell.self), for: indexPath) as! PlaceLocationViewCell
                cell.titeLabel.text = "Location"
                return cell
                
                
            case 1:
                
                let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: DetailMapViewCell.self), for: indexPath) as! DetailMapViewCell
                
                if let data2 = self.place{
                    cell.configure(location: data2.location)
                }
                return cell
                

            default:
                fatalError("There are no cases")
            }
            
            
        
        
        
        
    }
}
