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
    

    let createButton: UIButton = {
        let button = UIButton()
        button.setTitle("   Start", for: .normal)
        button.backgroundColor = .systemBlue
        button.setImage(UIImage(named: "location.north.fill"), for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 16, weight: .medium)
        button.imageView?.contentMode = .scaleAspectFit
        button.layer.cornerRadius = 20
        let inset: CGFloat = 9
        button.contentEdgeInsets = UIEdgeInsets(top: inset, left: inset, bottom: inset, right: inset)
        button.imageEdgeInsets = UIEdgeInsets(top: inset, left: inset, bottom: inset, right: inset)
        
        return button
    }()


    //MARK: -Bot VIew
    
    let botView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(named: "topViewColor")
        return view
    }()
    
    
    let oneLineView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(named: "greenSet")
        view.layer.cornerRadius = 15
        return view
    }()
    
    let twoLineView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(named: "greenSet")
        view.layer.cornerRadius = 15
        return view
    }()
    
    let oneLineCircle: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 23/255, green: 88/255, blue: 226/255, alpha: 1)
        view.layer.cornerRadius = 15
        return view
    }()
    
    let twoLineCircle: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 188/255, green: 213/255, blue: 250/255, alpha: 1)
        view.layer.cornerRadius = 15
        return view
    }()
    
    let oneLineLabel: UILabel = {
        let label = UILabel()
        label.text = " лифтовой путь"
        label.textColor = UIColor(named: "LinesLabel")
        label.font = .systemFont(ofSize: 17, weight: .medium)
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.5
        return label
    }()
    
    let twoLineLabel: UILabel = {
        let label = UILabel()
        label.text = " лестничный путь"
        label.textColor = UIColor(named: "LinesLabel")
        label.font = .systemFont(ofSize: 17, weight: .medium)
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.5
        return label
    }()
    
    let labelTime: UILabel = {
        let label = UILabel()
        label.text = "Время"
        label.font = .systemFont(ofSize: 28, weight: .ultraLight)
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.5
        return label
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
        botView.addSubview(oneLineView)
        botView.addSubview(twoLineView)
        oneLineView.addSubview(oneLineCircle)
        twoLineView.addSubview(twoLineCircle)
        oneLineView.addSubview(oneLineLabel)
        twoLineView.addSubview(twoLineLabel)
        botView.addSubview(labelTime)
        
       
    }
    
    func addConstrints() {
        
        let screenHeight = UIScreen.main.bounds.height

        
        
        
        topView.translatesAutoresizingMaskIntoConstraints = false
        topView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        topView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        topView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        topViewBotConstraints = topView.bottomAnchor.constraint(equalTo: secondTextField.bottomAnchor, constant: 5) //-720
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
        tableViewBotConstraints = tableView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: key)
        tableViewBotConstraints.isActive = true
        tableViewTopConstraints = tableView.topAnchor.constraint(equalTo: topView.bottomAnchor, constant: 0)
        tableView.isHidden = true
        tableViewTopConstraints.isActive = true
        
        secondTextField.translatesAutoresizingMaskIntoConstraints = false
        secondTextField.leftAnchor.constraint(equalTo: topView.leftAnchor, constant: 75).isActive = true
        secondTextField.rightAnchor.constraint(equalTo: topView.rightAnchor, constant: -30).isActive = true
        secondTextField.topAnchor.constraint(equalTo: firstTextField.bottomAnchor, constant: 5).isActive = true
        secondTextField.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
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
        
        oneLineView.translatesAutoresizingMaskIntoConstraints = false
        oneLineView.leftAnchor.constraint(equalTo: leftAnchor, constant: 10).isActive = true
        oneLineView.rightAnchor.constraint(equalTo: botView.centerXAnchor, constant: -5).isActive = true
        oneLineView.bottomAnchor.constraint(equalTo: createButton.topAnchor, constant: -10).isActive = true
        oneLineView.topAnchor.constraint(equalTo: botView.topAnchor, constant: 70).isActive = true
        
        twoLineView.translatesAutoresizingMaskIntoConstraints = false
        twoLineView.leftAnchor.constraint(equalTo: botView.centerXAnchor, constant: 5).isActive = true
        twoLineView.rightAnchor.constraint(equalTo: rightAnchor, constant: -10).isActive = true
        twoLineView.topAnchor.constraint(equalTo: botView.topAnchor, constant: 70).isActive = true
        twoLineView.bottomAnchor.constraint(equalTo: createButton.topAnchor, constant: -10).isActive = true
        
        oneLineCircle.translatesAutoresizingMaskIntoConstraints = false
        oneLineCircle.widthAnchor.constraint(equalToConstant: 30).isActive = true
        oneLineCircle.heightAnchor.constraint(equalToConstant: 30).isActive = true
        oneLineCircle.leftAnchor.constraint(equalTo: oneLineView.leftAnchor, constant: 5).isActive = true
        oneLineCircle.centerYAnchor.constraint(equalTo: oneLineView.centerYAnchor).isActive = true
        
        twoLineCircle.translatesAutoresizingMaskIntoConstraints = false
        twoLineCircle.widthAnchor.constraint(equalToConstant: 30).isActive = true
        twoLineCircle.heightAnchor.constraint(equalToConstant: 30).isActive = true
        twoLineCircle.leftAnchor.constraint(equalTo: twoLineView.leftAnchor, constant: 5).isActive = true
        twoLineCircle.centerYAnchor.constraint(equalTo: twoLineView.centerYAnchor).isActive = true
        
        oneLineLabel.translatesAutoresizingMaskIntoConstraints = false
        oneLineLabel.centerYAnchor.constraint(equalTo: oneLineView.centerYAnchor).isActive = true
        oneLineLabel.centerXAnchor.constraint(equalTo: oneLineView.centerXAnchor, constant: 10).isActive = true
        oneLineLabel.leftAnchor.constraint(equalTo: oneLineView.leftAnchor, constant: 35).isActive = true
        oneLineLabel.rightAnchor.constraint(equalTo: oneLineView.rightAnchor, constant: -5).isActive = true
        
        twoLineLabel.translatesAutoresizingMaskIntoConstraints = false
        twoLineLabel.centerYAnchor.constraint(equalTo: twoLineView.centerYAnchor).isActive = true
        twoLineLabel.centerXAnchor.constraint(equalTo: twoLineView.centerXAnchor, constant: 10).isActive = true
        twoLineLabel.leftAnchor.constraint(equalTo: twoLineView.leftAnchor, constant: 35).isActive = true
        twoLineLabel.rightAnchor.constraint(equalTo: twoLineView.rightAnchor, constant: -5).isActive = true
        
        labelTime.translatesAutoresizingMaskIntoConstraints = false
        labelTime.topAnchor.constraint(equalTo: botView.topAnchor, constant: 20).isActive = true
        labelTime.leftAnchor.constraint(equalTo: botView.leftAnchor, constant: 10).isActive = true
        labelTime.rightAnchor.constraint(equalTo: botView.rightAnchor, constant: -10).isActive = true
        
    }

    
    
}




