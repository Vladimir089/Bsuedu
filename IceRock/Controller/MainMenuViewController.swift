//
//  MainMenuViewController.swift
//  IceRock
//
//  Created by Владимир on 06.01.2024.
//

import UIKit

var corp = " "
var cab = Int()
var etaz = Int()
var vhod = " "

var corpGo = " "
var cabGo = Int()
var etazGo = Int()

var numbImage = 1


class MainMenuViewController: UIViewController {
    
    var mainMenuView: MainMenuView!
    var pickeRview: pickerView!
    var scrollView: ScrollViewPlan!
    
    var topView = 0
    var botView = 0
    var botPickerView = 0
    var selectetButton = 0
    
    override func loadView() {
        mainMenuView = MainMenuView()
        mainMenuView.addComponents()
        mainMenuView.addConstrints()
        mainMenuView.picker.setting()
        view = mainMenuView

    }

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.setHidesBackButton(true, animated: false)
        settingsTopView()
        settingsBotView()
        animateButtons()
        settingBottonBotView()
       
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        mainMenuView.scrollView.createNav(but1: mainMenuView.prevView, but2: mainMenuView.nextView)
    }
    
    func settingBottonBotView() {
        let botArr = [mainMenuView.profileButton]
        
        for i in botArr {
            setupButtonAnimationBotView(button: i)
        }
    }
    
    
    
    func setupButtonAnimationBotView(button: UIButton) {
        button.addTarget(self, action: #selector(buttonTouchDown(_:)), for: .touchDown)
        button.addTarget(self, action: #selector(botViewButtontouchUpOutside(_:)), for: .touchUpInside)
        button.addTarget(self, action: #selector(buttontouchUpOutside(_:)), for: .touchUpOutside)
    }
    
    @objc func botViewButtontouchUpOutside(_ sender: UIButton) {
        UIView.animate(withDuration: 0.1) {
            sender.transform = .identity
        }
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        if sender == mainMenuView.profileButton {
            let vc = storyboard.instantiateViewController(withIdentifier: "Profile")
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    
    
    
    
    func settingsTopView() {
        let gesture = UITapGestureRecognizer(target: self, action: #selector(viewTopTapped))
        let topView = mainMenuView.topViewInView
        topView.addGestureRecognizer(gesture)
    }
    
    func settingsBotView() {
        let gesture = UITapGestureRecognizer(target: self, action: #selector(viewBotTapped))
        let botView = mainMenuView.botViewInView
        botView.addGestureRecognizer(gesture)
    }
    
    
    
    func animateButtons() {
        let buttomArray = [mainMenuView.selectEtazButton, mainMenuView.selectVhodButton, mainMenuView.selectCampusButton, mainMenuView.selectCabinetButton, mainMenuView.picker.buttonOK, mainMenuView.selectCampusButtonGo, mainMenuView.selectCabinetButtonGo, mainMenuView.selectEtazButtonGo, mainMenuView.picker.buttonClose, mainMenuView.createButton, mainMenuView.nextView, mainMenuView.prevView]
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
        
        if sender == mainMenuView.createButton {
            mainMenuView.createButton.tag = 222
            numbImage = 1
            mainMenuView.scrollView.createNav(but1: mainMenuView.prevView, but2: mainMenuView.nextView)
            return
        }
        
        if sender == mainMenuView.nextView {
            numbImage += 1
            mainMenuView.scrollView.createNav(but1: mainMenuView.prevView, but2: mainMenuView.nextView)
            mainMenuView.setNeedsLayout()
            return
        }
        if sender == mainMenuView.prevView {
            numbImage -= 1
            mainMenuView.scrollView.createNav(but1: mainMenuView.prevView, but2: mainMenuView.nextView)
            mainMenuView.setNeedsLayout()
            return
        }
        
        let constraintTop = mainMenuView.topPickerContraints
        
        if botPickerView == 0  {
            constraintTop.constant = -250
            botPickerView = 1
        } else {
            constraintTop.constant = 0
            botPickerView = 0
        }
        
        UIView.animate(withDuration: 0.5) {
            self.view.layoutIfNeeded()
        }
        
        
        if mainMenuView.picker.buttonOK.tag == 999 {
            
            corp = mainMenuView.picker.selectedValue ?? " "
            mainMenuView.labelCampusNumber.text = "\(corp) корпус"
            print(corp)
        }
        if mainMenuView.picker.buttonOK.tag == 888 {
            
            cab = Int(mainMenuView.picker.selectedValue ?? "0") ?? 0
            mainMenuView.labelCabinetNumber.text = "\(cab) кабинет"
            print(cab)
        }
        if mainMenuView.picker.buttonOK.tag == 777 {
            
            etaz = Int(mainMenuView.picker.selectedValue ?? "0") ?? 0
            mainMenuView.labelEtazNumber.text = "\(etaz) этаж"
            print(etaz)
        }
        if mainMenuView.picker.buttonOK.tag == 666 {
            vhod = mainMenuView.picker.selectedValue ?? "0"
            print(vhod)
        }
        if mainMenuView.picker.buttonOK.tag == 555 {
            corpGo = mainMenuView.picker.selectedValue ?? " "
            mainMenuView.labelCampusNumberGo.text = "\(corpGo) корпус"
            print(corpGo)
        }
        if mainMenuView.picker.buttonOK.tag == 444 {
            cabGo = Int(mainMenuView.picker.selectedValue ?? "0") ?? 0
            mainMenuView.labelCabinetNumberGo.text = "\(cabGo) кабинет"
            print(cabGo)
        }
        if mainMenuView.picker.buttonOK.tag == 333 {
            etazGo = Int(mainMenuView.picker.selectedValue ?? "0") ?? 0
            mainMenuView.labelEtazNumbeGo.text = "\(etazGo) этаж"
            print(etaz)
        }
        
        
        if sender == mainMenuView.selectCampusButton {
            mainMenuView.picker.buttonOK.tag = 999
            mainMenuView.picker.getID(id: "corp")
        }
        if sender == mainMenuView.selectCabinetButton {
            mainMenuView.picker.buttonOK.tag = 888
            mainMenuView.picker.getID(id: "cab")
        }
        if sender == mainMenuView.selectEtazButton {
            mainMenuView.picker.buttonOK.tag = 777
            mainMenuView.picker.getID(id: "etaz")
        }
        if sender == mainMenuView.selectVhodButton {
            mainMenuView.picker.buttonOK.tag = 666
            mainMenuView.picker.getID(id: "vhod")
        }
        if sender == mainMenuView.selectCampusButtonGo {
            mainMenuView.picker.buttonOK.tag = 555
            mainMenuView.picker.getID(id: "corpGo")
            
        }
        if sender == mainMenuView.selectCabinetButtonGo {
            mainMenuView.picker.buttonOK.tag = 444
            mainMenuView.picker.getID(id: "cabGo")
        }
        if sender == mainMenuView.selectEtazButtonGo {
            mainMenuView.picker.buttonOK.tag = 333
            mainMenuView.picker.getID(id: "etazGo")
            
        }
        if sender == mainMenuView.picker.buttonClose {
            constraintTop.constant = 0
            botPickerView = 0
            
        }
        
       
        
        
        
        print(mainMenuView.picker.buttonOK.tag)
           
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    @objc func viewTopTapped() {
        
        let constraintBoat = mainMenuView.topViewBotContraints
        let constraintTopBotView = mainMenuView.botViewToContraints
        
        if topView == 0 && botView == 0 {
            constraintBoat.constant = -10
            constraintTopBotView.constant = 0
            topView = 1
        } else {
            constraintBoat.constant = -110
            constraintTopBotView.constant = -100
            topView = 0
        }
        UIView.animate(withDuration: 0.3) {
            self.mainMenuView.layoutIfNeeded()
        }
        mainMenuView.updateConstraintsIfNeeded()
 
    }
    
    
    
    @objc func viewBotTapped() {
        let constraintBoat = mainMenuView.topViewBotContraints
        let constraintTopBotView = mainMenuView.botViewToContraints

        if botView == 0  {
            
            constraintBoat.constant = -270
            constraintTopBotView.constant = -197
           
            botView = 1
        } else {
            constraintBoat.constant = -110
            constraintTopBotView.constant = -100

            botView = 0
        }
        
        UIView.animate(withDuration: 0.3) {
            self.mainMenuView.layoutIfNeeded()
            
        }
        
    }
  
}





