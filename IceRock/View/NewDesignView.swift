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
    
    let tableView: UITableView = {
        let table = UITableView()
        table.backgroundColor = .red
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
        field.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        field.textColor = .black
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
        field.layer.borderWidth = 1
        field.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        field.textColor = .black
        return field
    }()

    
    
    func addComponents() {
        backgroundColor = UIColor(named: "bacColor")
        addSubview(topView)
        
        topView.addSubview(myCoordImageView)
        topView.addSubview(endCoordImageView)
        topView.addSubview(separatorLineImagesImageView)
        topView.addSubview(firstTextField)
        topView.addSubview(secondTextField)
        
        topView.isUserInteractionEnabled = true
        firstTextField.isEnabled = true
        firstTextField.isUserInteractionEnabled = true
        
        addSubview(tableView)
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
        firstTextField.rightAnchor.constraint(equalTo: topView.rightAnchor, constant: -70).isActive = true
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
        secondTextField.rightAnchor.constraint(equalTo: topView.rightAnchor, constant: -70).isActive = true
        secondTextField.topAnchor.constraint(equalTo: topView.bottomAnchor, constant: -60).isActive = true
        secondTextField.bottomAnchor.constraint(equalTo: topView.bottomAnchor, constant: -10).isActive = true
    }

    
    
}




