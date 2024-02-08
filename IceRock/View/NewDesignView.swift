//
//  NewDesignView.swift
//  IceRock
//
//  Created by Владимир on 06.02.2024.
//

import UIKit



class NewDesignView: UIView {
    
    var topViewBotConstraints = NSLayoutConstraint()
    var tableViewTopConstraints = NSLayoutConstraint()
    var tableViewBotConstraints = NSLayoutConstraint()
    var scrollView: NewDesignScroll!
    
    let tableView: UITableView = {
        let table = UITableView()
        table.backgroundColor = UIColor(named: "bacColor")
        return table
    }()
    
    //MARK: -Top VIew
    
    let topView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(named: "topViewColor")
        return view
    }()
    
    let myCoordImageView: UIImageView = {
        let view = UIImageView()
        let image = UIImage(named: "location.north.circle.fill")
        view.image = image
        return view
    }()
    
    let endCoordImageView: UIImageView = {
        let view = UIImageView()
        let image = UIImage(named: "checkmark.circle.fill")
        view.image = image
        return view
    }()
    
    let separatorLineImagesImageView: UIView = {
        let view = UIView()
        view.backgroundColor = .separator
        return view
    }()
    
    let firstTextField: UITextField = {
        let field = UITextField()
        field.placeholder = "Ваше местоположение"
        
        let leftPaddingView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: field.frame.size.height))
            field.leftView = leftPaddingView
            field.leftViewMode = .always
        
        field.layer.borderColor = UIColor.separator.cgColor
        field.layer.cornerRadius = 20
        field.layer.borderWidth = 1
        field.textColor = UIColor(named: "labelColors")
        field.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        
        return field
    }()
    
    let secondTextField: UITextField = {
        let field = UITextField()
        field.placeholder = "Поиск кабинета"
        
        let leftPaddingView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: field.frame.size.height))
            field.leftView = leftPaddingView
            field.leftViewMode = .always
        
        field.layer.borderColor = UIColor.separator.cgColor
        field.layer.cornerRadius = 20
        field.textColor = UIColor(named: "labelColors")
        field.layer.borderWidth = 1
        field.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        return field
    }()
    
    //MARK: -Nav But
    let nextView: UIButton = {
        let buttom = UIButton()
        buttom.setImage(UIImage(named: "arrow.right"), for: .normal)
        buttom.layer.cornerRadius = 15
        buttom.backgroundColor = UIColor(named: "navButColor")
        buttom.tintColor = UIColor(named: "labelColors")
        return buttom
    }()
    
    let prevView: UIButton = {
        let buttom = UIButton()
        buttom.setImage(UIImage(named: "arrow.backward"), for: .normal)
        buttom.layer.cornerRadius = 15
        buttom.backgroundColor = UIColor(named: "navButColor")
        buttom.tintColor = UIColor(named: "labelColors")
        return buttom
    }()
    
    //test but
    let createButton: UIButton = {
        let button = UIButton()
        button.setTitle("   Start", for: .normal)
        button.backgroundColor = .systemBlue
        button.setImage(UIImage(named: "location.north.fill"), for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 20, weight: .medium)
        button.layer.cornerRadius = 20
        return button
    }()
    //test but

    //MARK: -Bot VIew
    
    let botView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(named: "topViewColor")
        return view
    }()
    
    
    //MARK: -Other methods
    
    func addComponents() {
        backgroundColor = UIColor(named: "bacColor")
        addSubview(topView)
        addSubview(botView)
        
        scrollView = NewDesignScroll()
        scrollView.backgroundColor = UIColor(named: "scrollBac")
        addSubview(scrollView)
        addSubview(nextView)
        addSubview(prevView)
        
        topView.addSubview(myCoordImageView)
        topView.addSubview(endCoordImageView)
        topView.addSubview(separatorLineImagesImageView)
        topView.addSubview(firstTextField)
        topView.addSubview(secondTextField)
        
        topView.isUserInteractionEnabled = true
        firstTextField.isEnabled = true
        firstTextField.isUserInteractionEnabled = true
        
        addSubview(tableView)
        botView.addSubview(createButton)
        
       
    }
    
    func addConstrints() {
        
        topView.translatesAutoresizingMaskIntoConstraints = false
        topView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        topView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        topView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        topViewBotConstraints = topView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -720)
        topViewBotConstraints.isActive = true
        
        myCoordImageView.translatesAutoresizingMaskIntoConstraints = false
        myCoordImageView.topAnchor.constraint(equalTo: topView.topAnchor, constant: 70).isActive = true
        myCoordImageView.leftAnchor.constraint(equalTo: topView.leftAnchor, constant: 30).isActive = true
        
        endCoordImageView.translatesAutoresizingMaskIntoConstraints = false
        endCoordImageView.leftAnchor.constraint(equalTo: topView.leftAnchor, constant: 30).isActive = true
        endCoordImageView.bottomAnchor.constraint(equalTo: topView.bottomAnchor, constant: -20).isActive = true
        
        
        
        separatorLineImagesImageView.translatesAutoresizingMaskIntoConstraints = false
        separatorLineImagesImageView.widthAnchor.constraint(equalToConstant: 1.5).isActive = true
        separatorLineImagesImageView.bottomAnchor.constraint(equalTo: endCoordImageView.topAnchor, constant: -10).isActive = true
        separatorLineImagesImageView.topAnchor.constraint(equalTo: myCoordImageView.bottomAnchor, constant: 10).isActive = true
        separatorLineImagesImageView.centerXAnchor.constraint(equalTo: myCoordImageView.centerXAnchor).isActive = true
        
        firstTextField.translatesAutoresizingMaskIntoConstraints = false
        firstTextField.leftAnchor.constraint(equalTo: topView.leftAnchor, constant: 75).isActive = true
        firstTextField.rightAnchor.constraint(equalTo: topView.rightAnchor, constant: -30).isActive = true
        firstTextField.topAnchor.constraint(equalTo: myCoordImageView.topAnchor, constant: -15).isActive = true
        firstTextField.bottomAnchor.constraint(equalTo: myCoordImageView.bottomAnchor, constant: 15).isActive = true
        
        
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        tableViewBotConstraints = tableView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0)
        tableViewBotConstraints.isActive = true
        tableViewTopConstraints = tableView.topAnchor.constraint(equalTo: bottomAnchor, constant: 0)
        tableViewTopConstraints.isActive = true
        
        secondTextField.translatesAutoresizingMaskIntoConstraints = false
        secondTextField.leftAnchor.constraint(equalTo: topView.leftAnchor, constant: 75).isActive = true
        secondTextField.rightAnchor.constraint(equalTo: topView.rightAnchor, constant: -30).isActive = true
        secondTextField.topAnchor.constraint(equalTo: topView.bottomAnchor, constant: -60).isActive = true
        secondTextField.bottomAnchor.constraint(equalTo: topView.bottomAnchor, constant: -10).isActive = true
        
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.topAnchor.constraint(equalTo: topView.bottomAnchor, constant: 0).isActive = true
        scrollView.leftAnchor.constraint(equalTo: leftAnchor, constant: 0).isActive = true
        scrollView.rightAnchor.constraint(equalTo: rightAnchor, constant: 0).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -200).isActive = true
        
        
        
        createButton.translatesAutoresizingMaskIntoConstraints = false
        createButton.topAnchor.constraint(equalTo: botView.topAnchor, constant: 120).isActive = true
        createButton.leftAnchor.constraint(equalTo: leftAnchor, constant: 10).isActive = true
        createButton.rightAnchor.constraint(equalTo: rightAnchor, constant: -10).isActive = true
        createButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -30).isActive = true
        
        nextView.translatesAutoresizingMaskIntoConstraints = false
        nextView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        nextView.widthAnchor.constraint(equalToConstant: 50).isActive = true
        nextView.rightAnchor.constraint(equalTo: rightAnchor, constant: -20).isActive = true
        nextView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: -20).isActive = true
        
        prevView.translatesAutoresizingMaskIntoConstraints = false
        prevView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        prevView.widthAnchor.constraint(equalToConstant: 50).isActive = true
        prevView.leftAnchor.constraint(equalTo: leftAnchor, constant: 20).isActive = true
        prevView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: -20).isActive = true
        
        botView.translatesAutoresizingMaskIntoConstraints = false
        botView.topAnchor.constraint(equalTo: scrollView.bottomAnchor).isActive = true
        botView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        botView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        botView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        
    }

    
    
}




