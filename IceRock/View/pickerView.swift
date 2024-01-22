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
    let selectedRow = 0
    
    
    
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
        
        
        if ID == "corp" {
            arrName.removeAll()
            buttonOK.tag = 999
            arrName = arrCorp
        } else if ID == "cab" {
            arrName.removeAll()
            buttonOK.tag = 888
            arrName = (1...100).map { String($0) }
        } else if ID == "etaz" {
            arrName.removeAll()
            buttonOK.tag = 777
            arrName = (1...10).map { String($0) }
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
            arrName = (1...100).map { String($0) }
        } else if ID == "etazGo" {
            arrName.removeAll()
            buttonOK.tag = 333
            arrName = (1...10).map { String($0) }
        }
        
        
        DispatchQueue.main.async { [self] in
            
            pickerView.reloadAllComponents()
            pickerView.selectRow(0, inComponent: 0, animated: true)
            self.pickerView(pickerView, didSelectRow: 0, inComponent: 0)
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
