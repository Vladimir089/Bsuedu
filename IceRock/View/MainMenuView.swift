//
//  MainMenuView.swift
//  IceRock
//
//  Created by Владимир on 06.01.2024.
//

import UIKit

class MainMenuView: UIView {
    
    let topView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 30
        view.backgroundColor = UIColor(red: 0.9608, green: 0.8706, blue: 0.702, alpha: 1.0)
        return view
    }()
    
    let topViewInView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 0.8235, green: 0.7686, blue: 0.9961, alpha: 0.7)
        view.layer.cornerRadius = 25
        return view
    }()
    
    let botViewInView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 0.8235, green: 0.7686, blue: 0.9961, alpha: 0.7)
        view.layer.cornerRadius = 25
        return view
    }()
    
    let labelInTopView: UILabel = {
        let label = UILabel()
        label.text = "Откуда:"
        label.textColor = .systemGray
        label.font = .systemFont(ofSize: 16, weight: .light)
        return label
    }()
    
    let labelInBotView: UILabel = {
        let label = UILabel()
        label.text = "Куда:"
        label.textColor = .systemGray
        label.font = .systemFont(ofSize: 16, weight: .light)
        return label
    }()


    
    
    
    func addComponents() {
        backgroundColor = .white
        addSubview(topView)
        topView.translatesAutoresizingMaskIntoConstraints = false
        topView.addSubview(topViewInView)
        topViewInView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(botViewInView)
        botViewInView.translatesAutoresizingMaskIntoConstraints = false
        topViewInView.addSubview(labelInTopView)
        labelInTopView.translatesAutoresizingMaskIntoConstraints = false
        botViewInView.addSubview(labelInBotView)
        labelInBotView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    
    func addConstrints() {
        topView.topAnchor.constraint(equalTo: topAnchor, constant: 50).isActive = true
        topView.leftAnchor.constraint(equalTo: leftAnchor, constant: 10).isActive = true
        topView.rightAnchor.constraint(equalTo: rightAnchor, constant: -10).isActive = true
        topView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -640).isActive = true
        
        topViewInView.topAnchor.constraint(equalTo: topView.topAnchor, constant: 10).isActive = true
        topViewInView.leftAnchor.constraint(equalTo: topView.leftAnchor, constant: 10).isActive = true
        topViewInView.rightAnchor.constraint(equalTo: topView.rightAnchor, constant: -10).isActive = true
        topViewInView.bottomAnchor.constraint(equalTo: topView.bottomAnchor, constant: -110).isActive = true
        
        botViewInView.topAnchor.constraint(equalTo: topViewInView.bottomAnchor, constant: 10).isActive = true
        botViewInView.leftAnchor.constraint(equalTo: topViewInView.leftAnchor).isActive = true
        botViewInView.rightAnchor.constraint(equalTo: topViewInView.rightAnchor).isActive = true
        botViewInView.bottomAnchor.constraint(equalTo: topView.bottomAnchor, constant: -10).isActive = true
        
        labelInTopView.topAnchor.constraint(equalTo: topViewInView.topAnchor, constant: 5).isActive = true
        labelInTopView.leftAnchor.constraint(equalTo: topViewInView.leftAnchor, constant: 15).isActive = true
        
        labelInBotView.topAnchor.constraint(equalTo: botViewInView.topAnchor, constant: 5).isActive = true
        labelInBotView.leftAnchor.constraint(equalTo: botViewInView.leftAnchor, constant: 15).isActive = true
    }
    

}
