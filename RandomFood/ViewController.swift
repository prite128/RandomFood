//
//  ViewController.swift
//  testWebData
//
//  Created by prite on 19/7/2563 BE.
//  Copyright © 2563 prite. All rights reserved.
//

import UIKit
import SwiftSoup
import CoreLocation

class ViewController: UIViewController  , SettingFillterDelegate {
    
    
    
    let locationManger  =   CLLocationManager()
    
    var lat : CLLocationDegrees =   0.0
    var long    : CLLocationDegrees =   0.0
    
    var shopNames   : [String]  =   []
    @IBOutlet weak var shopLabel: UILabel!
    
    var isCheckedBox: [Int]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        locationManger.delegate =   self
        locationManger.requestWhenInUseAuthorization()
        locationManger.requestLocation()
        
        
        //        passUrl()
    }
    
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        
        print("before button pressed ")
        print("array count :  \(shopNames.count)")
        //        shopNames.forEach { (name) in
        //            print(name)
        //        }
        
        let randomElementInArray = Int(arc4random_uniform(UInt32(shopNames.count)))
        
        shopLabel.text  =   shopNames[randomElementInArray]
        
        print(randomElementInArray)
        
    }
    
    
    
    func passUrl(with fillter : String = "" ){
        
        
        print(lat)
        print(long)
        
        //        for i in 1...2 {
        //
        let url = URL(string: "https://www.wongnai.com/businesses?spatialInfo.radius=50.0&spatialInfo.coordinate.latitude=\(lat)&spatialInfo.coordinate.longitude=\(long)&categoryGroupId=9&features.ratingRange=1\(fillter)&page.number=1&rerank=false&domain=1")!
        
        print(url)
        
        
        fetchDataFromUrl(url: url)
        //
        //        }
        
        
        
        
        
    }
    
    
    func fetchDataFromUrl( url: URL ){
        
        let task =  URLSession.shared.dataTask(with: url ) { (data, response, error) in
            
            if error    != nil {
                print(error)
            }
            else {
                
                if let safeData =   data {
                    
                    if let html =   String(data: safeData, encoding: .utf8) {
                        do {
                            let doc : Document  =   try SwiftSoup.parse(html)
                            
                            let h2 : [Element]    =   try doc.select("h2").array()
                            
                            try h2.forEach { (element) in
                                
                                if try element.className()  ==  K.fillterClass {
                                    
                                    print(try element.text())
                                    self.shopNames.append(try element.text())
                                    
                                }
                                
                            }
                            
                        } catch   {
                            
                            print("")
                        }
                    }
                    
                }
            }
        }
        
        task.resume()
        
    }
    
    func didUpdateFillter(urlFillter: String  , isCheckedBox: [Int] ) {
        
        passUrl(with: urlFillter)
        
        self.isCheckedBox   =   isCheckedBox
        
    }
    
    
    @IBAction func editButtonPressed(_ sender: UIBarButtonItem) {
        
        self.performSegue(withIdentifier: "MainToSettingSegue", sender: self)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier ==  "MainToSettingSegue" {
            let destinationVc   =   segue.destination as! SettingViewController
            
            destinationVc.delegate  =   self
            
            if let safeCheckedBox   =   isCheckedBox {
                destinationVc.boolCheckedBox    =   safeCheckedBox
                
            }
        }
    }
}

extension ViewController : CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        
        print(error)
        
        
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        if let location    =   locations.last {
            locationManger.stopUpdatingLocation()
            lat =   location.coordinate.latitude
            long    =   location.coordinate.longitude
            
            passUrl()
        }
    }
    
    
    @IBAction func currentLocationButtonPressed(_ sender: UIButton) {
        
        locationManger.requestLocation()
    }
}

