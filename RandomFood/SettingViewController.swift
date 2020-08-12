//
//  SettingViewController.swift
//  testWebData
//
//  Created by prite on 22/7/2563 BE.
//  Copyright © 2563 prite. All rights reserved.
//

import UIKit
import SimpleCheckbox


protocol SettingFillterDelegate {
    
    func didUpdateFillter( urlFillter: String)
}


class SettingViewController: UIViewController  {
    
    
    @IBOutlet weak var checkboxThai: Checkbox!
    @IBOutlet weak var checkboxJapan: Checkbox!
    @IBOutlet weak var checkboxChiness: Checkbox!
    
    @IBOutlet weak var checkboxNoodle: Checkbox!
    @IBOutlet weak var checkboxByOrder: Checkbox!
    @IBOutlet weak var checkboxFastFood: Checkbox!
    @IBOutlet weak var checkboxSigleMeal: Checkbox!
    
    @IBOutlet weak var checkBoxCleanFood: Checkbox!
    
    
    var delegate : SettingFillterDelegate?
    
    var urlString : [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpCheckBox()
        
        // Do any additional setup after loading the view.
        
        
        
    }
    
    func setUpCheckBox(){
        
        let checkBoxs   :[Checkbox] =   [checkboxThai,checkboxJapan,checkboxChiness,checkboxNoodle,checkboxByOrder,checkboxFastFood,checkboxSigleMeal,checkBoxCleanFood]
        
        
        
        checkBoxs.forEach { (checkbox) in
            
            urlString.append("")
//            checkbox.isChecked  =   true
            checkbox.checkedBorderColor = .green
            checkbox.uncheckedBorderColor = .black
            checkbox.borderStyle = .square
            checkbox.checkmarkStyle = .tick
            
            print(checkBoxs.firstIndex(of: checkbox)!)
            
            var count : Int = checkBoxs.firstIndex(of: checkbox)!
            
            switch (count){
                
            case 0:
                checkbox.valueChanged = { (isChecked) in
                    
                    
                    if isChecked {
                        self.urlString[count]    =   "categories=3"
                    }
                    else{
                        self.urlString[count]    =   ""
                    }
                }
                break
            case 1:
                checkbox.valueChanged = { (isChecked) in
                    
                    
                    if isChecked {
                        self.urlString[count]    =   "categories=2"
                    }
                    else{
                        self.urlString[count]    =   ""
                    }
                    
                }
                break
            case 2:
                checkbox.valueChanged = { (isChecked) in
                  
                    
                    if isChecked {
                        self.urlString[count]    =   "categories=4"
                    }
                    else{
                        self.urlString[count]    =   ""
                    }
                }
                break
            case 3:
                checkbox.valueChanged = { (isChecked) in
                   
                    
                    if isChecked {
                        self.urlString[count]    =   "categories=30"
                    }
                    else{
                        self.urlString[count]    =   ""
                    }
                    
                }
                break
            case 4:
                checkbox.valueChanged = { (isChecked) in
                    
                    
                    if isChecked {
                        self.urlString[count]    =   "categories=36"
                    }
                    else{
                        self.urlString[count]    =   ""
                    }
                    
                }
                break
            case 5:
                checkbox.valueChanged = { (isChecked) in
                  
                    
                    if isChecked {
                        self.urlString[count]    =   "categories=28"
                    }
                    else{
                        self.urlString[count]    =   ""
                    }
                    
                }
                break
            case 6:
                checkbox.valueChanged = { (isChecked) in
                   
                    
                    if isChecked {
                        self.urlString[count]    =   "categories=64"
                    }
                    else{
                        self.urlString[count]    =   ""
                    }
                    
                }
                break
                
            case 7:
                checkbox.valueChanged = { (isChecked) in
                   
                    
                    if isChecked {
                        self.urlString[count]    =   "categories=39"
                    }
                    else{
                        self.urlString[count]    =   ""
                    }
                    
                    
                }
                break
                
            default: break
                
            }
            
        }
        
    }
    
    func setUrlCategories (){
        
        //        print(urlString.count)
        var count : Int = 0
        
        var url : String = ""
        urlString.forEach { (string) in
            
            if !string.isEmpty {
                
                //                print(string)
                //                if count >= 1 {
                //                    url += "&\(string)"
                //                }
                //                else if count == 0 {
                //
                //                    url += string
                //                    count += 1
                //
                //                }
                url += "&\(string)"
            }
        }
        
        delegate?.didUpdateFillter(urlFillter: url)
        
        print(url)
    }
    
    
    @IBAction func buttonSavePressed(_ sender: UIButton) {
        
        setUrlCategories ()
    }
    
}
