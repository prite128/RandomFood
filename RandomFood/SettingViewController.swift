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
    
    func didUpdateFillter( urlFillter: String , isCheckedBox : [Int])
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
    
    var boolCheckedBox  : [Int]?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpCheckBox()
        
        // Do any additional setup after loading the view.
        
        
        
    }
    
    func setUpCheckBox(){
        
        let checkBoxs   :[Checkbox] =   [checkboxThai,checkboxJapan,checkboxChiness,checkboxNoodle,checkboxByOrder,checkboxFastFood,checkboxSigleMeal,checkBoxCleanFood]
        
        var countIsChecked : Int =   0
        
        checkBoxs.forEach { (checkbox) in
            
            if let safeBoolCheckedBox   =   boolCheckedBox{
                
//                print("in safe if ")
//                print("countIsChecked : \(countIsChecked)")
//                print("safeBoolCheckedBox[countIsChecked] : \(safeBoolCheckedBox[countIsChecked])")
                
                if  safeBoolCheckedBox[countIsChecked]   == countIsChecked {
                    
                    checkbox.isChecked  =   true
                }
            }
            
            urlString.append("")
            
            checkbox.checkedBorderColor = .green
            checkbox.uncheckedBorderColor = .black
            checkbox.borderStyle = .square
            checkbox.checkmarkStyle = .tick
            
//            print(checkBoxs.firstIndex(of: checkbox)!)
            
            let count : Int = checkBoxs.firstIndex(of: checkbox)!
            
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
            
            countIsChecked += 1
        }
        
    }
    
    func setUrlCategories (){
        
        //        print(urlString.count)
        var count : Int = 0
        
        var url : String = ""
        
        var isCheckedBox : [Int]    =   []
        urlString.forEach { (string) in
            
            
            if !string.isEmpty {
                
                isCheckedBox.append(count)
                url += "&\(string)"
            }
            else{
                isCheckedBox.append(-1)
            }
            
            count += 1
        }
        
        delegate?.didUpdateFillter(urlFillter: url , isCheckedBox: isCheckedBox)
        
        print(url)
    }
    
    
    @IBAction func buttonSavePressed(_ sender: UIButton) {
        
        setUrlCategories ()
    }
    
}
