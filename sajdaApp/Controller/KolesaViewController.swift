//
//  KolesaViewController.swift
//  sajdaApp
//
//  Created by Nurzhan Saktaganov on 23.04.2023.
//

import UIKit

class KolesaViewController: UIViewController {

    
    @IBOutlet private var ayatFinder: UITextField!
    @IBOutlet weak var ayatResult: UILabel!
    @IBOutlet weak var surahName: UILabel!
    @IBOutlet weak var bNum: UILabel!
    @IBOutlet weak var chNum: UILabel!
    @IBOutlet weak var cardView: UIView!
    
    @IBOutlet weak var bottomView: UIView!
    
 
    
    
    
    
    var ayahManager = AyatManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        cardView.layer.cornerRadius = 20
        bottomView.layer.cornerRadius = 20
        
        ayatFinder.delegate = self
        ayahManager.delegate = self
        ayatResult.baselineAdjustment = .alignBaselines
       
        ayahManager.getAyahByNumber(ayahNumber: "1:1")
        ayatFinder.placeholder = "4:23"
        
    }

  

}


extension KolesaViewController: UITextFieldDelegate{

    @IBAction func ayatFound(_ sender: Any) {
        ayatFinder.endEditing(true)
    }

        
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        ayatFinder.endEditing(true)
        return true
    }
        


        
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if textField.text != ""{
            return true
        }else{
            textField.placeholder = "Enter Ayah number"
            return false
        }
    }
        
        
        
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        if let ayah = ayatFinder.text{
            ayahManager.getAyahByNumber(ayahNumber: ayah)
        }
        
        ayatFinder.text = ""
        
    }
        
    
    
}


extension KolesaViewController: AyatManagerDelegate{
    func errHandlingAyat(error: Error) {
        DispatchQueue.main.async {
            self.ayatResult.isHidden = true
            self.bNum.isHidden = true
            self.surahName.isHidden = true
            self.chNum.isHidden = true
         
        }
    }
    
    
    func didUpdateData(_ ayatManager: AyatManager, ayah: Ayat){
        
        DispatchQueue.main.async {
            self.ayatResult.isHidden = false
            self.bNum.isHidden = false
            self.surahName.isHidden = false
            self.chNum.isHidden = false
      
    
            self.ayatResult.text = ayah.surahText
            self.surahName.text = ayah.surahName
            self.bNum.text = "SURAH: \(ayah.surahNumber)"
            self.chNum.text = "AYAH: \(ayah.surahNumberofAyahs)"
        }
        
        
    }

}

