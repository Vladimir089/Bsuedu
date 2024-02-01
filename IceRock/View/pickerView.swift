//
//  pickerView.swift
//  IceRock
//
//  Created by Владимир on 09.01.2024.
//

import UIKit

class pickerView: UIView {
    
    let pickerView = UIPickerView()
    let arrCorp = ["12", "15", "17"]
    let arrCorpVhod = ["вход 12 корпус", "вход 15 корпус", "вход 17 корпус"]
    var ID: String = " "
    var selectedValue: String?
    var arrName = ["ds"]

    
    
    
    func setting() {
        pickerView.delegate = self
        pickerView.dataSource = self
        addSubview(pickerView)
        addConstr()
        
    }
    
    let buttonOK: UIButton = {
        let but = UIButton()
        but.backgroundColor = UIColor(red: 0.8235, green: 0.7686, blue: 0.9961, alpha: 1)
        but.setTitle("Выбрать", for: .normal)
        but.layer.cornerRadius = 20
        return but
    }()
    
    let buttonClose: UIButton = {
        let but = UIButton()
        but.backgroundColor = UIColor(red: 1.0, green: 0.8, blue: 0.8, alpha: 1.0)
        but.tintColor = .systemRed
        but.setImage(UIImage(systemName: "xmark"), for: .normal)
        return but
    }()
    
    
    
    func getID(id: String) {
        ID = id
        
        if ID == "no" {
            arrName.removeAll()
            return
        }
        
        if ID == "corp" {
            arrName.removeAll()
            buttonOK.tag = 999
            arrName = arrCorp
        } else if ID == "cab" {
            arrName.removeAll()
            buttonOK.tag = 888
            if corp == "12" && etaz == 2 {
                arrName = ["2-2", "2-4", "2-6", "2-7", "2-8", "2-9", "2-10","2-10A", "2-10Б", "2-10B", "2-10Г", "2-11", "2-13", "2-17", "2-26"]
            }
            if corp == "12" && etaz == 3 {
                arrName = ["3-1", "3-2", "3-3", "3-4", "3-5", "3-7", "3-9", "3-11", "3-13", "3-14", "3-15", "3-16", "3-18", "3-20", "3-22", "3-24", "3-26", "3-27", "3-30", "3-32", "3-32A"]
            }
            if corp == "12" && etaz == 4 {
                arrName = ["4-4", "4-5", "4-6", "4-7", "4-8","4-9","4-10", "4-11", "4-12","4-13","4-14","4-15","4-18","4-20","4-23"]
            }
            if corp == "12" && etaz == 5 {
                arrName = ["5-3", "5-5", "5-6", "5-7", "5-8", "5-9", "5-11", "5-13", "5-14", "5-18", "5-20"]
            }
            if corp == "12" && etaz == 6 {
                arrName = ["6-1", "6-3", "6-4", "6-5", "6-6", "6-7", "6-8", "6-10", "6-11", "6-12", "6-13", "6-15", "6-16"]
            }
            if corp == "12" && etaz == 7 {
                arrName = ["7-3", "7-4", "7-5", "7-6", "7-8", "7-9", "7-10", "7-11", "7-12", "7-13", "7-14", "7-15", "7-16", "7-17"]
            }
            if corp == "12" && etaz == 8 {
                arrName = ["8-3", "8-4", "8-5", "8-6", "8-7", "8-8", "8-9", "8-10", "8-11", "8-12", "8-13", "8-14", "8-15", "8-16", "8-17"]
            }
            if corp == "12" && etaz == 9 {
                arrName = ["9-3", "9-5", "9-6", "9-7", "9-8", "9-9", "9-11", "9-12", "9-13", "9-15", "9-28", "9-41", "9-42", "9-43", "9-44", "9-45"]
            }
            
            if corp == " " && etaz == 0  {
                arrName = ["test", "test", "test"]
            }
        } else if ID == "etaz" {
            arrName.removeAll()
            buttonOK.tag = 777
            arrName = (1...12).map { String($0) }
        } else if ID == "vhod" {
            arrName.removeAll()
            buttonOK.tag = 666
            arrName = arrCorpVhod
        } else if ID == "corpGo" {
            arrName.removeAll()
            buttonOK.tag = 555
            arrName = arrCorp
        } else if ID == "cabGo" {
            arrName.removeAll()
            buttonOK.tag = 444
            if corpGo == "12" && etazGo == 2 {
                arrName = ["2-2", "2-4", "2-6", "2-7", "2-8", "2-9", "2-10","2-10A", "2-10Б", "2-10B", "2-10Г", "2-11", "2-13", "2-17", "2-26"]
            }
            if corpGo == "12" && etazGo == 3 {
                arrName = ["3-1", "3-2", "3-3", "3-4", "3-5", "3-7", "3-9", "3-11", "3-13", "3-14", "3-15", "3-16", "3-18", "3-20", "3-22", "3-24", "3-26", "3-27", "3-30", "3-32", "3-32A"]
            } 
            if corpGo == "12" && etazGo == 4 {
                arrName = ["4-4", "4-5", "4-6", "4-7", "4-8","4-9","4-10", "4-11", "4-12","4-13","4-14","4-15","4-18","4-20","4-23"]
            }
            if corpGo == "12" && etazGo == 5 {
                arrName = ["5-3", "5-5", "5-6", "5-7", "5-8", "5-9", "5-11", "5-13", "5-14", "5-18", "5-20"]
            }
            if corpGo == "12" && etazGo == 6 {
                arrName = ["6-1", "6-3", "6-4", "6-5", "6-6", "6-7", "6-8", "6-10", "6-11", "6-12", "6-13", "6-15", "6-16"]
            }
            if corpGo == "12" && etazGo == 7 {
                arrName = ["7-3", "7-4", "7-5", "7-6", "7-8", "7-9", "7-10", "7-11", "7-12", "7-13", "7-14", "7-15", "7-16", "7-17"]
            }
            if corpGo == "12" && etazGo == 8 {
                arrName = ["8-3", "8-4", "8-5", "8-6", "8-7", "8-8", "8-9", "8-10", "8-11", "8-12", "8-13", "8-14", "8-15", "8-16", "8-17"]
            }
            if corpGo == "12" && etazGo == 9 {
                arrName = ["9-3", "9-5", "9-6", "9-7", "9-8", "9-9", "9-11", "9-12", "9-13", "9-15", "9-28", "9-41", "9-42", "9-43", "9-44", "9-45"]
            }
            
            if corpGo == " " && etazGo == 0  {
                arrName = ["test", "test", "test"]
            }
            
        } else if ID == "etazGo" {
            arrName.removeAll()
            buttonOK.tag = 333
            if corpGo == "12"  {
                arrName = (1...12).map { String($0) }
            } else {
                arrName = ["test", "test", "test"]
            }
        }
   
        
        
        DispatchQueue.main.async { [self] in
            
            pickerView.reloadAllComponents()
            if ID != "no" {
                pickerView.selectRow(0, inComponent: 0, animated: true)
                self.pickerView(pickerView, didSelectRow: 0, inComponent: 0)
            }
           
        }
    }
    
    
    func addConstr() {
        
        
        pickerView.translatesAutoresizingMaskIntoConstraints = false
        pickerView.topAnchor.constraint(equalTo: topAnchor, constant: 30).isActive = true
        pickerView.leftAnchor.constraint(equalTo: leftAnchor, constant: 10).isActive = true
        pickerView.rightAnchor.constraint(equalTo: rightAnchor, constant: -10).isActive = true
        pickerView.bottomAnchor.constraint(lessThanOrEqualTo: topAnchor, constant: 180).isActive = true
        
        addSubview(buttonOK)
        buttonOK.translatesAutoresizingMaskIntoConstraints = false
        buttonOK.topAnchor.constraint(equalTo: topAnchor, constant: 180).isActive = true
        buttonOK.leftAnchor.constraint(equalTo: leftAnchor, constant: 10).isActive = true
        buttonOK.rightAnchor.constraint(equalTo: rightAnchor, constant: -10).isActive = true
        buttonOK.bottomAnchor.constraint(equalTo: topAnchor, constant: 220).isActive = true

        addSubview(buttonClose)
        buttonClose.translatesAutoresizingMaskIntoConstraints = false
        buttonClose.topAnchor.constraint(equalTo: topAnchor, constant: 10).isActive = true
        buttonClose.rightAnchor.constraint(equalTo: rightAnchor, constant: -10).isActive = true
        buttonClose.heightAnchor.constraint(equalToConstant: 40).isActive = true
        buttonClose.widthAnchor.constraint(equalToConstant: 40).isActive = true
        buttonClose.layer.cornerRadius = 20
    }
    
}


extension pickerView: UIPickerViewDelegate, UIPickerViewDataSource  {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        let a = arrName.count
        
        
        return a
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        return arrName[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        print(row)
        if ID == "corp" {
            selectedValue = arrCorp[row]
        } else if ID == "cab" {
            selectedValue = arrName[row]
        } else if ID == "etaz" {
            selectedValue = arrName[row]
        } else if ID == "vhod" {
            selectedValue = arrName[row]
        } else if ID == "corpGo" {
            selectedValue = arrCorp[row]
        } else if ID == "cabGo" {
            selectedValue = arrName[row]
        } else if ID == "etazGo" {
            selectedValue = arrName[row]
        }
        
    }
    
    
    
    
}
