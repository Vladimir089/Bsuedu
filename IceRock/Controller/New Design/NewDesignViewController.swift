//
//  NewDesignViewController.swift
//  IceRock
//
//  Created by Владимир on 06.02.2024.
//

import UIKit

var arr12CorpRU = [String]()

class NewDesignViewController: UIViewController {
    var mainView: NewDesignView!
    var filteredData = [String]()
    var textFieldNumber = 1
    
    
    override func loadView() {
        mainView = NewDesignView()
        mainView.addComponents()
        mainView.addConstrints()
        view = mainView
        mainView.firstTextField.delegate = self
        mainView.secondTextField.delegate = self
        mainView.tableView.dataSource = self
        mainView.tableView.delegate = self
        mainView.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createArray12Corp()
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        
    }
    
    func createArray12Corp() {
        for element in allCab12Corp {
            if let firstDashIndex = element.firstIndex(of: "-") {
                let substring = element.prefix(upTo: firstDashIndex)
                let newString = "12 корпус, \(substring) этаж, кабинет \(element)"
                arr12CorpRU.append(newString)
            }
        }
    }
    
    
}


extension NewDesignViewController: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        
        if textField == mainView.firstTextField {
            textFieldNumber = 1
            arr12CorpRU.append("вход 12 корпус")
        }
        if textField == mainView.secondTextField  {
            textFieldNumber = 2
            arr12CorpRU.removeAll { $0 == "вход 12 корпус" }
        }
        UIView.animate(withDuration: 0.5) { [self] in
            mainView.tableViewTopConstraints.constant = -720
            mainView.tableViewBotConstraints.constant = -350
            self.mainView.layoutIfNeeded()
        }
        
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        UIView.animate(withDuration: 0.3) { [self] in
            mainView.tableViewTopConstraints.constant = 0
            mainView.tableViewBotConstraints.constant = 0
            self.mainView.layoutIfNeeded()
        }
        
        if textField == mainView.firstTextField {
            if textField.text == "вход 12 корпус" {
                isOnlyVhod = 1
                vhod = "вход 12 корпус"
                print(vhod)
            } else {
                if let text = textField.text {
                    isOnlyVhod = 0
                    let components = text.components(separatedBy: " ")
                    if components.count >= 5 {
                        corp = components[0]
                        etaz = Int(components[2]) ?? 0
                        cab = components[5]
                    }
                    print(corp, etaz, cab)
                }
            }
        }
        
        if textField == mainView.secondTextField {
            
            if let text = textField.text {
                let components = text.components(separatedBy: " ")
                if components.count >= 5 {
                    corpGo = components[0]
                    etazGo = Int(components[2]) ?? 0
                    cabGo = components[5]
                }
                print(corpGo, etazGo, cabGo)
            }
            
        }

    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        UIView.animate(withDuration: 0.3) { [self] in
            mainView.tableViewTopConstraints.constant = 0
            mainView.tableViewBotConstraints.constant = 0
            self.mainView.layoutIfNeeded()
        }
        
        if textField == mainView.firstTextField {
            if textField.text == "вход 12 корпус" {
                isOnlyVhod = 1
                vhod = "вход 12 корпус"
                print(vhod)
            } else {
                if let text = textField.text {
                    isOnlyVhod = 0
                    let components = text.components(separatedBy: " ") 
                    if components.count >= 5 {
                        corp = components[0]
                        etaz = Int(components[2]) ?? 0
                        cab = components[5]
                    }
                    print(corp, etaz, cab)
                }
            }
        }
        
        if textField == mainView.secondTextField {
            
            if let text = textField.text {
                let components = text.components(separatedBy: " ")
                if components.count >= 5 {
                    corpGo = components[0]
                    etazGo = Int(components[2]) ?? 0
                    cabGo = components[5]
                }
                print(corpGo, etazGo, cabGo)
            }
            
        }
        
        textField.resignFirstResponder()
        return true
    }

    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        if textFieldNumber == 1 {
            
            let newText = (textField.text! as NSString).replacingCharacters(in: range, with: string)
            
            // Фильтрация массива данных на основе newText
            let filteredData = arr12CorpRU.filter { $0.lowercased().contains(newText.lowercased()) }
            
            // Обновление данных в таблице
            self.filteredData = filteredData
            mainView.tableView.reloadData()
            return true
        }
        if textFieldNumber == 2 {
            
            let newText = (textField.text! as NSString).replacingCharacters(in: range, with: string)
            
            // Фильтрация массива данных на основе newText
            let filteredData = arr12CorpRU.filter { $0.lowercased().contains(newText.lowercased()) }
            
            // Обновление данных в таблице
            self.filteredData = filteredData
            mainView.tableView.reloadData()
            return true
        }
        return true
    }
    
    
}


extension NewDesignViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = filteredData[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedOption = filteredData[indexPath.row]
        
        if textFieldNumber == 1 {
            mainView.firstTextField.text! = "\(selectedOption)"
            filteredData.removeAll()
            mainView.tableView.reloadData()
        }
        if textFieldNumber == 2 {
            mainView.secondTextField.text! = "\(selectedOption)"
            filteredData.removeAll()
            mainView.tableView.reloadData()
        }
        
        
        
        
    }
    
    
    
    
    
    
}






