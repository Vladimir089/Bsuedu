//
//  MainMenuView.swift
//  IceRock
//
//  Created by Владимир on 06.01.2024.
//  And
//  Created by Nick on 18.01.2024.
//

import UIKit

class MainMenuView: UIView {
    
    var topViewBotContraints = NSLayoutConstraint()
    var botViewToContraints = NSLayoutConstraint()
    var topMiddleViewBotConstraints = NSLayoutConstraint()
    var picker: pickerView!
    var topPickerContraints = NSLayoutConstraint()
    var scrollView: ScrollViewPlan!
    
    
    let campusPicker: UIPickerView = {
        let picker = UIPickerView()
        picker.backgroundColor = .white
        return picker
    }()
    
    let bottomView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 51/255.0, green: 102/255.0, blue: 51/255.0, alpha: 1.0)
        view.layer.cornerRadius = 40
        return view
    }()
    
    let midView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 51/255.0, green: 102/255.0, blue: 51/255.0, alpha: 1.0)
        view.layer.cornerRadius = 40
        return view
    }()
    
    let profileButton: UIButton = {
        let buttom = UIButton()
        buttom.setTitle(" Профиль", for: .normal)
        buttom.backgroundColor = UIColor(named: "viewColor")
        buttom.layer.cornerRadius = 15
        buttom.setTitleColor(UIColor.black, for: .normal) // Добавлен черный цвет текста
        buttom.setImage(UIImage(systemName: "person"), for: .normal)
        return buttom
    }()
    
    let nextView: UIButton = {
        let buttom = UIButton()
        buttom.setTitle("дальше", for: .normal)
        buttom.titleLabel?.font = .systemFont(ofSize: 16, weight: .light)
        buttom.backgroundColor = UIColor(red: 0.9608, green: 0.8706, blue: 0.702, alpha: 1.0)
        buttom.layer.cornerRadius = 15
        buttom.setTitleColor(.black, for: .normal)
        
        return buttom
    }()
    
    let prevView: UIButton = {
        let buttom = UIButton()
        
        buttom.setTitle("назад", for: .normal)
        buttom.titleLabel?.font = .systemFont(ofSize: 16, weight: .light)
        buttom.backgroundColor = UIColor(red: 0.9608, green: 0.8706, blue: 0.702, alpha: 1.0)
        buttom.layer.cornerRadius = 15
        buttom.setTitleColor(.black, for: .normal)
        
        return buttom
    }()
    
    let createButton: UIButton = {
        let button = UIButton()
        button.setTitle("Построить маршрут", for: .normal)
        button.backgroundColor = UIColor(named: "viewColor")
        button.setTitleColor(UIColor.black, for: .normal) // Добавлен черный цвет текста
        button.layer.cornerRadius = 15
        return button
    }()

    
    
    let selectCampusButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor(named: "viewColor")
        button.setTitle("выбрать корпус", for: .normal)
        button.contentEdgeInsets = UIEdgeInsets(top: 3, left: 5, bottom: 3, right: 5)
        button.setTitleColor(.black, for: .normal)
        button.layer.cornerRadius = 12
        return button
    }()
    
    let selectCampusButtonGo: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor(named: "viewColor")
        button.setTitle("выбрать корпус", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.layer.cornerRadius = 12
        button.contentEdgeInsets = UIEdgeInsets(top: 3, left: 5, bottom: 3, right: 5)
            
        return button
    }()
    
    let selectCabinetButtonGo: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor(named: "viewColor")
        button.setTitle("выбрать кабинет", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.layer.cornerRadius = 12
        button.contentEdgeInsets = UIEdgeInsets(top: 3, left: 5, bottom: 3, right: 5)
            
        return button
    }()
    
    let selectEtazButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor(named: "viewColor")
        button.setTitle("выбрать этаж", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.layer.cornerRadius = 12
        button.contentEdgeInsets = UIEdgeInsets(top: 3, left: 5, bottom: 3, right: 5)
            
        return button
    }()
    
    let selectEtazButtonGo: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor(named: "viewColor")
        button.setTitle("выбрать этаж", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.layer.cornerRadius = 12
        button.contentEdgeInsets = UIEdgeInsets(top: 3, left: 5, bottom: 3, right: 5)
            
        return button
    }()
    
    let selectVhodButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor(named: "viewColor")
        button.setTitle("выбрать место входа", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.layer.cornerRadius = 12
        button.contentEdgeInsets = UIEdgeInsets(top: 3, left: 5, bottom: 3, right: 5)
            
        return button
    }()
    
    let selectCabinetButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor(named: "viewColor")
        button.setTitle("выбрать кабинет", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.layer.cornerRadius = 12
        button.contentEdgeInsets = UIEdgeInsets(top: 3, left: 5, bottom: 3, right: 5)
            
        return button
    }()
    
    let viewOneInView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 51/255.0, green: 102/255.0, blue: 51/255.0, alpha: 1.0)
       // view.backgroundColor = .red
        view.layer.cornerRadius = 15
        return view
    }()
    
    let viewTwoInView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 51/255.0, green: 102/255.0, blue: 51/255.0, alpha: 1.0)
        view.layer.cornerRadius = 15
        
        return view
    }()
    
    let botViewOneInView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 51/255.0, green: 102/255.0, blue: 51/255.0, alpha: 1.0)
       // view.backgroundColor = .red
        view.layer.cornerRadius = 15
        return view
    }()
    
    let topMiddleView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 51/255.0, green: 102/255.0, blue: 51/255.0, alpha: 1.0)
        view.layer.cornerRadius = 30
        return view
    }()
    
    let botViewTwoInView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 51/255.0, green: 102/255.0, blue: 51/255.0, alpha: 1.0)
        view.layer.cornerRadius = 15
        return view
    }()
    
    
    let topViewOne: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 15
        view.backgroundColor = UIColor(named: "viewColor")
        return view
    }()
    let topViewTwo: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 15
        view.backgroundColor = UIColor(named: "viewColor")
        return view
    }()
    
    let topViewThree: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 15
        view.backgroundColor = UIColor(named: "viewColor")
        return view
    }()
    
    let botViewOne: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 15
        view.backgroundColor = UIColor(named: "viewColor")
        return view
    }()
    let botViewTwo: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 15
        view.backgroundColor = UIColor(named: "viewColor")
        return view
    }()
    
    let botViewThree: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 15
        view.backgroundColor = UIColor(named: "viewColor")
        return view
    }()
    
    
    let topView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 30
        view.backgroundColor = UIColor(red: 51/255.0, green: 102/255.0, blue: 51/255.0, alpha: 1.0)
        return view
    }()
    
    let topViewInView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(named: "twoTopView")
        view.layer.cornerRadius = 25
        return view
    }()
    
    let botViewInView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(named: "twoTopView")
        view.layer.cornerRadius = 25
        return view
    }()
    
    let labelInTopView: UILabel = {
        let label = UILabel()
        label.text = "Откуда:"
        label.textColor = UIColor(named: "twoLabelColor")
        label.font = .systemFont(ofSize: 16, weight: .medium)
        return label
    }()
    
    let labelInBotView: UILabel = {
        let label = UILabel()
        label.text = "Куда:"
        label.textColor = UIColor(named: "twoLabelColor")
        label.font = .systemFont(ofSize: 16, weight: .medium)
        return label
    }()
    
    let labelCampusNumber: UILabel = {
        let label = UILabel()
        label.text = "\(corp) корпус"
        label.font = .systemFont(ofSize: 16, weight: .ultraLight)
        label.textColor = UIColor(named: "labelColor")
        return label
    }()
    
    let labelCabinetNumber: UILabel = {
        let label = UILabel()
        label.text = "\(cab) кабинет"
        label.font = .systemFont(ofSize: 16, weight: .ultraLight)
        label.textColor = UIColor(named: "labelColor")
        return label
    }()
    
    let labelEtazNumber: UILabel = {
        let label = UILabel()
        label.text = "\(etaz) этаж"
        label.font = .systemFont(ofSize: 16, weight: .ultraLight)
        label.textColor = UIColor(named: "labelColor")
        return label
    }()
    
    
    let labelCampusNumberGo: UILabel = {
        let label = UILabel()
        label.text = "\(corpGo) корпус"
        label.font = .systemFont(ofSize: 16, weight: .ultraLight)
        label.textColor = UIColor(named: "labelColor")
        return label
    }()
    
    let labelCabinetNumberGo: UILabel = {
        let label = UILabel()
        label.text = "\(cabGo) кабинет"
        label.font = .systemFont(ofSize: 16, weight: .ultraLight)
        label.textColor = UIColor(named: "labelColor")
        return label
    }()
    
    let labelEtazNumbeGo: UILabel = {
        let label = UILabel()
        label.text = "\(etazGo) этаж"
        label.font = .systemFont(ofSize: 16, weight: .ultraLight)
        label.textColor = UIColor(named: "labelColor")
        return label
    }()
    
    //MARK: -Add view
    
    func addComponents() {
        backgroundColor = UIColor(named: "backgroundColor")
        addSubview(topView)
        
        addSubview(bottomView)
        bottomView.addSubview(profileButton)
        bottomView.addSubview(createButton)
        addSubview(midView)
        
        topView.translatesAutoresizingMaskIntoConstraints = false
        topView.clipsToBounds = true
        topView.addSubview(topViewInView)
        topViewInView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(botViewInView)
        botViewInView.translatesAutoresizingMaskIntoConstraints = false
        topViewInView.addSubview(labelInTopView)
        labelInTopView.translatesAutoresizingMaskIntoConstraints = false
        botViewInView.addSubview(labelInBotView)
        labelInBotView.translatesAutoresizingMaskIntoConstraints = false
        
        topViewInView.addSubview(topViewOne)
        topViewOne.translatesAutoresizingMaskIntoConstraints = false 
        
        topViewInView.addSubview(topViewTwo)
        topViewTwo.translatesAutoresizingMaskIntoConstraints = false
        
        
        
        topViewInView.addSubview(topViewThree)
        topViewThree.translatesAutoresizingMaskIntoConstraints = false
        
        
        topViewOne.addSubview(labelCampusNumber)
        labelCampusNumber.translatesAutoresizingMaskIntoConstraints = false
        
        topViewTwo.addSubview(labelCabinetNumber)
        labelCabinetNumber.translatesAutoresizingMaskIntoConstraints = false
        
        topViewThree.addSubview(labelEtazNumber)
        labelEtazNumber.translatesAutoresizingMaskIntoConstraints = false
        
        topViewInView.addSubview(viewOneInView)
        viewOneInView.translatesAutoresizingMaskIntoConstraints = false
        
        topViewInView.addSubview(viewTwoInView)
        viewTwoInView.translatesAutoresizingMaskIntoConstraints = false
       
        
        topViewInView.addSubview(selectCampusButton)
        selectCampusButton.translatesAutoresizingMaskIntoConstraints = false
        
       
        topViewInView.addSubview(selectCabinetButton)
        selectCabinetButton.translatesAutoresizingMaskIntoConstraints = false
        
        viewTwoInView.addSubview(selectEtazButton)
        selectEtazButton.translatesAutoresizingMaskIntoConstraints = false
        
        viewTwoInView.addSubview(selectVhodButton)
        selectVhodButton.translatesAutoresizingMaskIntoConstraints = false
        
        picker = pickerView()
        picker.layer.borderColor = UIColor(named: "twoLabelColor")?.cgColor
        picker.layer.borderWidth = 3
        picker.backgroundColor = UIColor(named: "twoTopView")
        picker.layer.cornerRadius = 30
        picker.translatesAutoresizingMaskIntoConstraints = false
        addSubview(picker)
        
        botViewInView.addSubview(botViewOne)
        botViewInView.addSubview(botViewTwo)
        botViewInView.addSubview(botViewThree)
        
        botViewOne.addSubview(labelCampusNumberGo)
        botViewTwo.addSubview(labelCabinetNumberGo)
        botViewThree.addSubview(labelEtazNumbeGo)
        
        botViewInView.addSubview(botViewOneInView)
        botViewInView.addSubview(botViewTwoInView)
        
        botViewOneInView.addSubview(selectCampusButtonGo)
        botViewOneInView.addSubview(selectCabinetButtonGo)
        botViewTwoInView.addSubview(selectEtazButtonGo)
        
        scrollView = ScrollViewPlan()
        scrollView.backgroundColor = .white
        
        
//        addSubview(scrollView)
        
        topMiddleView.addSubview(nextView)
        
        topMiddleView.addSubview(prevView)
        
        midView.addSubview(topMiddleView)
        
        topMiddleView.addSubview(scrollView)
        
        
    }
    
    //MARK: -Add constr
    
    func addConstrints() {
        topView.topAnchor.constraint(equalTo: topAnchor, constant: 50).isActive = true
        topView.leftAnchor.constraint(equalTo: leftAnchor, constant: 10).isActive = true
        topView.rightAnchor.constraint(equalTo: rightAnchor, constant: -10).isActive = true
        topView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -640).isActive = true
        
        topViewInView.topAnchor.constraint(equalTo: topView.topAnchor, constant: 10).isActive = true
        topViewInView.leftAnchor.constraint(equalTo: topView.leftAnchor, constant: 10).isActive = true
        topViewInView.rightAnchor.constraint(equalTo: topView.rightAnchor, constant: -10).isActive = true
        
        topViewBotContraints = topViewInView.bottomAnchor.constraint(equalTo: topView.bottomAnchor, constant: -110)
        topViewBotContraints.isActive = true
        
        botViewToContraints = botViewInView.topAnchor.constraint(equalTo: topView.bottomAnchor, constant: -100)
        botViewToContraints.isActive = true
        
        botViewInView.leftAnchor.constraint(equalTo: topViewInView.leftAnchor).isActive = true
        botViewInView.rightAnchor.constraint(equalTo: topViewInView.rightAnchor).isActive = true
        botViewInView.bottomAnchor.constraint(equalTo: topView.bottomAnchor, constant: -10).isActive = true
        
        labelInTopView.topAnchor.constraint(equalTo: topViewInView.topAnchor, constant: 5).isActive = true
        labelInTopView.leftAnchor.constraint(equalTo: topViewInView.leftAnchor, constant: 15).isActive = true
        labelInTopView.rightAnchor.constraint(lessThanOrEqualTo: topViewInView.rightAnchor, constant: -115).isActive = true
        labelInTopView.bottomAnchor.constraint(lessThanOrEqualTo: topViewInView.bottomAnchor, constant: -5).isActive = true
        
        labelInBotView.topAnchor.constraint(equalTo: botViewInView.topAnchor, constant: 5).isActive = true
        labelInBotView.leftAnchor.constraint(equalTo: botViewInView.leftAnchor, constant: 15).isActive = true
        labelInBotView.bottomAnchor.constraint(lessThanOrEqualTo: botViewInView.bottomAnchor, constant: -5).isActive = true
        labelInBotView.rightAnchor.constraint(lessThanOrEqualTo: botViewInView.rightAnchor, constant: -115).isActive = true
        
        topViewOne.topAnchor.constraint(equalTo: labelInTopView.bottomAnchor, constant: 7.5).isActive = true
        topViewOne.leftAnchor.constraint(equalTo: labelInTopView.leftAnchor, constant: 0).isActive = true
        topViewOne.rightAnchor.constraint(equalTo: topViewInView.rightAnchor, constant: -250).isActive = true
        topViewOne.bottomAnchor.constraint(equalTo: labelInTopView.bottomAnchor, constant: 37).isActive = true
        
        topViewTwo.topAnchor.constraint(equalTo: topViewOne.topAnchor).isActive = true
        topViewTwo.leftAnchor.constraint(equalTo: topViewOne.rightAnchor, constant: 10).isActive = true
        topViewTwo.rightAnchor.constraint(equalTo: topViewOne.rightAnchor, constant: 130).isActive = true
        topViewTwo.bottomAnchor.constraint(equalTo: labelInTopView.bottomAnchor, constant: 37).isActive = true
        
        topViewThree.topAnchor.constraint(equalTo: topViewOne.topAnchor).isActive = true
        topViewThree.leftAnchor.constraint(equalTo: topViewTwo.rightAnchor, constant: 10).isActive = true
        topViewThree.rightAnchor.constraint(equalTo: topViewInView.rightAnchor, constant: -15).isActive = true
        topViewThree.bottomAnchor.constraint(equalTo: topViewTwo.bottomAnchor).isActive = true
        
        
        labelCampusNumber.centerXAnchor.constraint(equalTo: topViewOne.centerXAnchor).isActive = true
        labelCampusNumber.centerYAnchor.constraint(equalTo: topViewOne.centerYAnchor).isActive = true
        
        labelCabinetNumber.centerYAnchor.constraint(equalTo: topViewTwo.centerYAnchor).isActive = true
        labelCabinetNumber.centerXAnchor.constraint(equalTo: topViewTwo.centerXAnchor).isActive = true
        
        labelEtazNumber.centerYAnchor.constraint(equalTo: topViewThree.centerYAnchor).isActive = true
        labelEtazNumber.centerXAnchor.constraint(equalTo: topViewThree.centerXAnchor).isActive = true
        
        viewOneInView.topAnchor.constraint(lessThanOrEqualTo: topViewOne.bottomAnchor, constant: 40).isActive = true
        viewOneInView.leftAnchor.constraint(equalTo: topViewInView.leftAnchor, constant: 15).isActive = true
        viewOneInView.rightAnchor.constraint(equalTo: topViewInView.rightAnchor, constant: -15).isActive = true
        viewOneInView.bottomAnchor.constraint(equalTo: topViewOne.bottomAnchor, constant: 75).isActive = true
      
        viewTwoInView.topAnchor.constraint(lessThanOrEqualTo: topViewOne.bottomAnchor, constant: 80).isActive = true
        viewTwoInView.leftAnchor.constraint(equalTo: topViewInView.leftAnchor, constant: 15).isActive = true
        viewTwoInView.rightAnchor.constraint(equalTo: topViewInView.rightAnchor, constant: -15).isActive = true
        viewTwoInView.bottomAnchor.constraint(equalTo: topViewOne.bottomAnchor, constant: 115).isActive = true
        
      
        
        selectCampusButton.centerYAnchor.constraint(equalTo: viewOneInView.centerYAnchor).isActive = true
        selectCampusButton.leftAnchor.constraint(equalTo: viewOneInView.leftAnchor, constant: 5).isActive = true
        selectCampusButton.rightAnchor.constraint(equalTo: selectCabinetButton.leftAnchor, constant: -10).isActive = true
        
    
        
        
        
       
        selectCabinetButton.centerYAnchor.constraint(equalTo: viewOneInView.centerYAnchor).isActive = true
        selectCabinetButton.rightAnchor.constraint(equalTo: viewOneInView.rightAnchor, constant: -5).isActive = true
        selectCabinetButton.leftAnchor.constraint(equalTo: selectCampusButton.rightAnchor, constant: 10).isActive = true
        
        
        
        selectEtazButton.centerYAnchor.constraint(equalTo: viewTwoInView.centerYAnchor).isActive = true
        selectEtazButton.rightAnchor.constraint(equalTo: viewTwoInView.rightAnchor, constant: -5).isActive = true
        selectEtazButton.leftAnchor.constraint(equalTo: selectVhodButton.rightAnchor, constant: 10).isActive = true
        
        selectVhodButton.centerYAnchor.constraint(equalTo: viewTwoInView.centerYAnchor, constant: 0).isActive = true
        selectVhodButton.leftAnchor.constraint(equalTo: viewTwoInView.leftAnchor, constant: 5).isActive = true
        selectVhodButton.rightAnchor.constraint(equalTo: selectEtazButton.leftAnchor, constant: -10).isActive = true
        
        
        topPickerContraints = picker.topAnchor.constraint(equalTo: bottomAnchor, constant: 0)
        topPickerContraints.isActive = true
        picker.leftAnchor.constraint(equalTo: leftAnchor, constant: 0).isActive = true
        picker.rightAnchor.constraint(equalTo: rightAnchor, constant: 0).isActive = true
        picker.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0).isActive = true
        
        
        
        
        botViewOne.translatesAutoresizingMaskIntoConstraints = false
        
        botViewOne.topAnchor.constraint(equalTo: labelInBotView.bottomAnchor, constant: 7.5).isActive = true
        botViewOne.leftAnchor.constraint(equalTo: labelInBotView.leftAnchor, constant: 0).isActive = true
        botViewOne.rightAnchor.constraint(equalTo: botViewInView.rightAnchor, constant: -250).isActive = true
        botViewOne.bottomAnchor.constraint(equalTo: labelInBotView.bottomAnchor, constant: 37).isActive = true
        
        botViewInView.clipsToBounds = true

        botViewTwo.translatesAutoresizingMaskIntoConstraints = false
        botViewTwo.topAnchor.constraint(equalTo: botViewOne.topAnchor).isActive = true
        botViewTwo.leftAnchor.constraint(equalTo: botViewOne.rightAnchor, constant: 10).isActive = true
        botViewTwo.rightAnchor.constraint(equalTo: botViewOne.rightAnchor, constant: 130).isActive = true
        botViewTwo.bottomAnchor.constraint(equalTo: labelInBotView.bottomAnchor, constant: 37).isActive = true
        
        
        botViewThree.translatesAutoresizingMaskIntoConstraints = false
        botViewThree.topAnchor.constraint(equalTo: botViewOne.topAnchor).isActive = true
        botViewThree.leftAnchor.constraint(equalTo: botViewTwo.rightAnchor, constant: 10).isActive = true
        botViewThree.rightAnchor.constraint(equalTo: botViewInView.rightAnchor, constant: -15).isActive = true
        botViewThree.bottomAnchor.constraint(equalTo: botViewTwo.bottomAnchor).isActive = true
        
        labelCampusNumberGo.translatesAutoresizingMaskIntoConstraints = false
        labelCampusNumberGo.centerXAnchor.constraint(lessThanOrEqualTo: botViewOne.centerXAnchor).isActive = true
        labelCampusNumberGo.centerYAnchor.constraint(lessThanOrEqualTo: botViewOne.centerYAnchor).isActive = true
        
        labelCabinetNumberGo.translatesAutoresizingMaskIntoConstraints = false
        labelCabinetNumberGo.centerYAnchor.constraint(equalTo: botViewTwo.centerYAnchor).isActive = true
        labelCabinetNumberGo.centerXAnchor.constraint(equalTo: botViewTwo.centerXAnchor).isActive = true
        
        labelEtazNumbeGo.translatesAutoresizingMaskIntoConstraints = false
        labelEtazNumbeGo.centerYAnchor.constraint(equalTo: botViewThree.centerYAnchor).isActive = true
        labelEtazNumbeGo.centerXAnchor.constraint(equalTo: botViewThree.centerXAnchor).isActive = true
        
        botViewOneInView.translatesAutoresizingMaskIntoConstraints = false
        botViewOneInView.topAnchor.constraint(lessThanOrEqualTo: botViewOne.bottomAnchor, constant: 40).isActive = true
        botViewOneInView.leftAnchor.constraint(equalTo: botViewInView.leftAnchor, constant: 15).isActive = true
        botViewOneInView.rightAnchor.constraint(equalTo: botViewInView.rightAnchor, constant: -15).isActive = true
        botViewOneInView.bottomAnchor.constraint(equalTo: botViewOne.bottomAnchor, constant: 75).isActive = true
        
        botViewTwoInView.translatesAutoresizingMaskIntoConstraints = false
        botViewTwoInView.topAnchor.constraint(lessThanOrEqualTo: botViewOne.bottomAnchor, constant: 80).isActive = true
        botViewTwoInView.leftAnchor.constraint(equalTo: botViewInView.leftAnchor, constant: 15).isActive = true
        botViewTwoInView.rightAnchor.constraint(equalTo: botViewInView.rightAnchor, constant: -15).isActive = true
        botViewTwoInView.bottomAnchor.constraint(equalTo: botViewOne.bottomAnchor, constant: 115).isActive = true
        
        selectCampusButtonGo.translatesAutoresizingMaskIntoConstraints = false
        selectCampusButtonGo.centerYAnchor.constraint(equalTo: botViewOneInView.centerYAnchor).isActive = true
        selectCampusButtonGo.leftAnchor.constraint(equalTo: botViewOneInView.leftAnchor, constant: 5).isActive = true
        selectCampusButtonGo.rightAnchor.constraint(equalTo: selectCabinetButtonGo.leftAnchor, constant: -10).isActive = true
        
        selectCabinetButtonGo.translatesAutoresizingMaskIntoConstraints = false
        selectCabinetButtonGo.centerYAnchor.constraint(equalTo: botViewOneInView.centerYAnchor).isActive = true
        selectCabinetButtonGo.rightAnchor.constraint(equalTo: botViewOneInView.rightAnchor, constant: -5).isActive = true
        selectCabinetButtonGo.leftAnchor.constraint(equalTo: selectCampusButtonGo.rightAnchor, constant: 10).isActive = true
        
        selectEtazButtonGo.translatesAutoresizingMaskIntoConstraints = false
        selectEtazButtonGo.centerYAnchor.constraint(equalTo: botViewTwoInView.centerYAnchor).isActive = true
        selectEtazButtonGo.rightAnchor.constraint(equalTo: botViewTwoInView.rightAnchor, constant: -5).isActive = true
        selectEtazButtonGo.leftAnchor.constraint(equalTo: botViewTwoInView.leftAnchor, constant: 5).isActive = true
        
        bottomView.translatesAutoresizingMaskIntoConstraints = false
        bottomView.topAnchor.constraint(equalTo: bottomAnchor, constant: -130).isActive = true
        bottomView.leftAnchor.constraint(equalTo: leftAnchor, constant: 10).isActive = true
        bottomView.rightAnchor.constraint(equalTo: rightAnchor, constant: -10).isActive = true
        bottomView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -30).isActive = true
        
        profileButton.translatesAutoresizingMaskIntoConstraints = false
        profileButton.topAnchor.constraint(equalTo: bottomView.topAnchor, constant: 55).isActive = true
        profileButton.leftAnchor.constraint(equalTo: bottomView.leftAnchor, constant: 20).isActive = true
        profileButton.rightAnchor.constraint(equalTo: bottomView.rightAnchor, constant: -190).isActive = true
        profileButton.bottomAnchor.constraint(equalTo: bottomView.bottomAnchor, constant: -10).isActive = true
        
        createButton.translatesAutoresizingMaskIntoConstraints = false
        createButton.topAnchor.constraint(equalTo: bottomView.topAnchor, constant: 10).isActive = true
        createButton.leftAnchor.constraint(equalTo: bottomView.leftAnchor, constant: 20).isActive = true
        createButton.rightAnchor.constraint(equalTo: bottomView.rightAnchor, constant: -20).isActive = true
        createButton.bottomAnchor.constraint(equalTo: profileButton.topAnchor, constant: -10).isActive = true
        
        midView.translatesAutoresizingMaskIntoConstraints = false
        midView.topAnchor.constraint(equalTo: topView.bottomAnchor, constant: 10).isActive = true
        midView.leftAnchor.constraint(equalTo: leftAnchor, constant: 10).isActive = true
        midView.rightAnchor.constraint(equalTo: rightAnchor, constant: -10).isActive = true
        midView.bottomAnchor.constraint(equalTo: bottomView.topAnchor, constant: -10).isActive = true
        
        
        
        
        nextView.translatesAutoresizingMaskIntoConstraints = false
        nextView.bottomAnchor.constraint(equalTo: topMiddleView.bottomAnchor, constant: -5).isActive = true
        nextView.rightAnchor.constraint(equalTo: topMiddleView.rightAnchor, constant: -15).isActive = true
        nextView.leftAnchor.constraint(equalTo: midView.centerXAnchor, constant: 5).isActive = true
        
        prevView.translatesAutoresizingMaskIntoConstraints = false
        prevView.leftAnchor.constraint(equalTo: topMiddleView.leftAnchor, constant: 15).isActive = true
        prevView.rightAnchor.constraint(equalTo: midView.centerXAnchor, constant: -5).isActive = true
        prevView.bottomAnchor.constraint(equalTo: topMiddleView.bottomAnchor, constant: -5).isActive = true
        
        topMiddleView.translatesAutoresizingMaskIntoConstraints = false
        topMiddleView.topAnchor.constraint(equalTo: midView.topAnchor, constant: 10).isActive = true
        topMiddleView.leftAnchor.constraint(equalTo: midView.leftAnchor, constant: 10).isActive = true
        topMiddleView.rightAnchor.constraint(equalTo: midView.rightAnchor, constant: -10).isActive = true
        topMiddleViewBotConstraints = topMiddleView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: 0)
        topMiddleViewBotConstraints.isActive = true
        topMiddleView.clipsToBounds = true
        
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.topAnchor.constraint(equalTo: topMiddleView.topAnchor, constant: 0).isActive = true
        scrollView.leftAnchor.constraint(equalTo: topMiddleView.leftAnchor, constant: 0).isActive = true
        scrollView.rightAnchor.constraint(equalTo: topMiddleView.rightAnchor, constant: 0).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: midView.bottomAnchor, constant: -273).isActive = true
        scrollView.layer.cornerRadius = 30

        
    }
    
    
    
    
}
