//
//  NewDesignViewController.swift
//  IceRock
//
//  Created by Владимир on 06.02.2024.
//

import UIKit

var arr12CorpRU = [String]()

var corp = " "
var cab = " "
var etaz = Int()
var vhod = " "
var isOnlyVhod = 1 
var corpGo = " "
var cabGo = " "
var etazGo = Int()
var key: CGFloat = 0
var numbImage = 1

class NewDesignViewController: UIViewController {
    var mainView: NewDesignView!
    var filteredData = [String]()
    var textFieldNumber = 1
    let schedule = [("08:30", "10:05"), ("10:15", "11:50"), ("12:00", "13:35"), ("14:00", "15:35"), ("15:45", "17:20"), ("17:30", "19:05")]
    var timer: Timer?
    
    
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
        animateButtons()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        mainView.scrollView.createNav(but1: mainView.prevView, but2: mainView.nextView)
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createArray12Corp()
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        mainView.nextView.isHidden = true
        mainView.prevView.isHidden = true
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateLabel), userInfo: nil, repeats: true)
    }
    
    
    
    @objc func updateLabel() {
        // Получение текущего времени
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm"
        let currentTimeString = dateFormatter.string(from: Date())
        
        // Преобразование строки времени в объект типа Date
        guard let currentTime = dateFormatter.date(from: currentTimeString) else {
            return
        }
        
        var timeRemaining: (String, Int)?
        
        // Поиск текущей пары
        for (start, end) in schedule {
            guard let startDate = dateFormatter.date(from: start),
                  let endDate = dateFormatter.date(from: end) else {
                continue
            }
            
            // Если текущее время находится в пределах начала и конца пары
            if currentTime >= startDate && currentTime <= endDate {
                let timeDifference = Calendar.current.dateComponents([.hour, .minute], from: currentTime, to: endDate)
                if let hours = timeDifference.hour, let minutes = timeDifference.minute {
                    mainView.labelTime.text = "До конца пары \(hours) часов \(minutes) минут"
                }
                return
            }
            
            // Если текущее время еще не начало пары
            if currentTime < startDate {
                let timeDifference = Calendar.current.dateComponents([.minute], from: currentTime, to: startDate)
                if let minutes = timeDifference.minute {
                    timeRemaining = ("До начала пары", minutes)
                    break
                }
            }
        }
        
        // Если текущее время уже после окончания последней пары
        if let timeRemaining = timeRemaining {
            mainView.labelTime.text = "\(timeRemaining.0) \(timeRemaining.1) минут "
        } else {
            mainView.labelTime.text = "Вне пары"
        }
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
    
    
    //MARK: -Анимация кнопок
    
    func animateButtons() {
        let buttomArray = [mainView.createButton, mainView.nextView, mainView.prevView]
        for i in buttomArray {
            setupButtonAnimation(button: i)
        }
    }
    
    func setupButtonAnimation(button: UIButton) {
        button.addTarget(self, action: #selector(buttonTouchDown(_:)), for: .touchDown)
        button.addTarget(self, action: #selector(buttonTouchUp(_:)), for: .touchUpInside)
        button.addTarget(self, action: #selector(buttontouchUpOutside(_:)), for: .touchUpOutside)
    }
    
    @objc func buttontouchUpOutside(_ sender: UIButton) {
        UIView.animate(withDuration: 0.1) {
            sender.transform = .identity
        }
    }
    
    @objc func buttonTouchDown(_ sender: UIButton) {
        UIView.animate(withDuration: 0.1) {
            sender.transform = CGAffineTransform(scaleX: 0.95, y: 0.95)
        }
    }
    
    @objc func buttonTouchUp(_ sender: UIButton) {
        UIView.animate(withDuration: 0.1) {
            sender.transform = .identity
        }
       
        
        if sender == mainView.createButton {
            numbImage = 1
            if corp == "12" && etaz == 11 && isOnlyVhod == 0 {
                numbImage = 0
            }
            
            if (cabGo == " " && corpGo == " " && etazGo == 0) || ((cab == " " && corp == " " && etaz == 0 ) && isOnlyVhod != 1)   {
                mainView.nextView.isHidden = true
                mainView.prevView.isHidden = true
                print(1)
            } else {
                print(2)
                mainView.nextView.isHidden = false
                mainView.prevView.isHidden = false
                mainView.scrollView.createNav(but1: mainView.prevView, but2: mainView.nextView)
            }
            
           
          
            
            
            
            
            
            if (corp == "12" && etaz == 12  && corpGo == "12" && etazGo == 11 && cab != " " && cabGo != " ") || (corp == "12" && etaz == 11  && corpGo == "12" && etazGo == 12 && cab != " " && cabGo != " ") {
                numbImage = 1
            }
            return
        }
        
        
        
        if sender == mainView.nextView {
            numbImage += 1
            print(numbImage)
            del()
            
            return
        }
        if sender == mainView.prevView {
            numbImage -= 1
            print(numbImage)
            del()
            
            return
        }
    }
    
    
    func del() {
        mainView.scrollView.imageView.image = nil
        if let sublayers = mainView.scrollView.imageView.layer.sublayers {
                for sublayer in sublayers {
                    if let shapeLayer = sublayer as? CAShapeLayer, shapeLayer.strokeColor == UIColor.red.cgColor {
                        shapeLayer.removeFromSuperlayer()
                    }
                    if let shapeLayerGreen = sublayer as? CAShapeLayer, shapeLayerGreen.strokeColor == UIColor.green.cgColor {
                        shapeLayerGreen.removeFromSuperlayer()
                    }
                }
            }
        mainView.scrollView.createNav(but1: mainView.prevView, but2: mainView.nextView)
        mainView.setNeedsLayout()
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
            mainView.tableView.isHidden = false
            mainView.tableViewBotConstraints.constant = -216
            self.mainView.layoutIfNeeded()
        }
        
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        UIView.animate(withDuration: 0.3) { [self] in
            mainView.tableView.isHidden = true
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
            let newText = (textField.text! as NSString).replacingCharacters(in: range, with: string)
            
            // Фильтрация массива данных на основе newText
            let filteredData = arr12CorpRU.filter { $0.lowercased().contains(newText.lowercased()) }
            
            // Обновление данных в таблице
            self.filteredData = filteredData
            mainView.tableView.reloadData()
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






