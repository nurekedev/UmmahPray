//
//  AyatManager.swift
//  sajdaApp
//
//  Created by Nurzhan Saktaganov on 23.04.2023.
//

import UIKit

protocol AyatManagerDelegate{
    func didUpdateData(_ ayatManager: AyatManager, ayah: Ayat)
    func errHandlingAyat(error: Error)
}


struct AyatManager{


    var appUrl = "http://api.alquran.cloud/v1/ayah/"

    func getAyahByNumber(ayahNumber:String){
        let lastUrl = "\(appUrl)\(ayahNumber)/en.asad"
        performUrl(with: lastUrl)

    }

    var delegate: AyatManagerDelegate?

    func performUrl(with urlString:String){


        if let url = URL(string: urlString){

            let session = URLSession(configuration: .default)

            session.dataTask(with: url) { data, response, error in
                if error != nil{
                    delegate?.errHandlingAyat(error: error!)
                }

                if let safeDate = data{

                    if let ayats = self.jsonDecoder(decodedData: safeDate){
                        self.delegate?.didUpdateData(self, ayah: ayats)


                    }

                }
            }.resume()
        }
    }



    func jsonDecoder(decodedData: Data)->Ayat?{
        let decoder = JSONDecoder()
        do{
            let decodedLast = try decoder.decode(AyatData.self, from: decodedData)



            let name = decodedLast.data.surah.englishName
            let text = decodedLast.data.text
            let bigNum = decodedLast.data.surah.number
            let childNum = decodedLast.data.numberInSurah
            
            

            let ayahModel = Ayat(surahNumber: bigNum, surahNumberofAyahs: childNum, surahName: name, surahText: text)
                
            return ayahModel


        }
        catch{
            delegate?.errHandlingAyat(error: error)
            return nil
        }


    }

}



