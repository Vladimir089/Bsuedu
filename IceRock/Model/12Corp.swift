//
//  API.swift
//  IceRock
//
//  Created by Владимир on 03.01.2024.
//

import Foundation
import UIKit
import Vision

var mainMenuView: MainMenuView!

let shapeLayerGreen = CAShapeLayer()
let shapeLayer = CAShapeLayer()
//проверка


func twelverCorpus(path: UIBezierPath, greenPath: UIBezierPath, imageView: UIImageView, numb: Int, but1: UIButton, but2: UIButton)  {
    
    
    
    imageView.contentMode = .scaleAspectFill
    
    
    let animation = CABasicAnimation(keyPath: "strokeEnd")
    animation.fromValue = 0.0
    animation.toValue = 1.0
    animation.duration = 1.0 // Длительность анимации в секундах
    
    
    let imageWidth = imageView.frame.size.width
    let imageHeight = imageView.frame.size.height
    
    if isOnlyVhod == 1 {
        if vhod == "вход 12 корпус" && numbImage == 1 {
            
            but1.isEnabled = false
            but1.backgroundColor = .systemGray5
            but2.isEnabled = true
            but2.backgroundColor = UIColor(red: 0.9608, green: 0.8706, blue: 0.702, alpha: 1.0)
            
            imageView.image = nil
            imageView.image = UIImage(named: "12corpHoll")
            
            
            path.addArc(withCenter: CGPoint(x: 0.498 * imageWidth, y: 0.95 * imageHeight), radius: 10, startAngle: 0, endAngle: CGFloat(2 * Double.pi), clockwise: true)
            path.move(to: CGPoint(x: 0.498 * imageWidth, y: 0.9 * imageHeight))
            path.addLine(to: CGPoint(x: 0.498 * imageWidth, y: 0.8 * imageHeight))
            path.move(to: CGPoint(x: 0.498 * imageWidth, y: 0.8 * imageHeight))
            path.addQuadCurve(to: CGPoint(x: 0.3 * imageWidth, y: 0.6 * imageHeight),
                              controlPoint: CGPoint(x: 0.498 * imageWidth, y: 0.6 * imageHeight))
            path.move(to: CGPoint(x: 0.3 * imageWidth, y: 0.6 * imageHeight))
            path.addLine(to: CGPoint(x: 0.2 * imageWidth, y: 0.6 * imageHeight))
            path.move(to: CGPoint(x: 0.2 * imageWidth, y: 0.6 * imageHeight))
            
            path.addQuadCurve(to: CGPoint(x: 0.12 * imageWidth, y: 0.8 * imageHeight),
                              controlPoint: CGPoint(x: 0.15 * imageWidth, y: 0.6 * imageHeight))
            
            path.addArc(withCenter: CGPoint(x: 0.12 * imageWidth, y: 0.83 * imageHeight), radius: 5, startAngle: 0, endAngle: CGFloat(2 * Double.pi), clockwise: true)
            
            
            greenPath.move(to: CGPoint(x: 0.3 * imageWidth, y: 0.6 * imageHeight))
            
            greenPath.addQuadCurve(to: CGPoint(x: 0.2 * imageWidth, y: 0.4 * imageHeight),
                                   controlPoint: CGPoint(x: 0.2 * imageWidth, y: 0.55 * imageHeight))
            
            greenPath.move(to: CGPoint(x: 0.2 * imageWidth, y: 0.4 * imageHeight))
            
            greenPath.addQuadCurve(to: CGPoint(x: 0.15 * imageWidth, y: 0.35 * imageHeight),
                                   controlPoint: CGPoint(x: 0.2 * imageWidth, y: 0.35 * imageHeight))
            
            greenPath.move(to: CGPoint(x: 0.15 * imageWidth, y: 0.35 * imageHeight))
            
            greenPath.addQuadCurve(to: CGPoint(x: 0.12 * imageWidth, y: 0.38 * imageHeight),
                                   controlPoint: CGPoint(x: 0.12 * imageWidth, y: 0.36 * imageHeight))
           
            
            
        }
        
        if corpGo == "12" && numbImage == 2 {
            
            but1.isEnabled = true
            but1.backgroundColor = UIColor(red: 0.9608, green: 0.8706, blue: 0.702, alpha: 1.0)
            but2.isEnabled = false
            but2.backgroundColor = .systemGray5
            
            imageView.image = nil
            imageView.image = UIImage(named: "12corp59")
            
            DispatchQueue.global().async {
                // Запускаем распознавание в фоновом потоке
                if let coord = recognizeDigits(imageView: imageView, path: path) {
                    DispatchQueue.main.async {
                        // Возвращаемся на главный поток для обновления пользовательского интерфейса
                        
                        
                        
                        
                        greenPath.move(to: CGPoint(x: 0.33 * imageWidth, y: 0.15 * imageHeight))
                        greenPath.addQuadCurve(to: CGPoint(x: 0.45 * imageWidth, y: 1/2 * imageHeight),
                                               controlPoint: CGPoint(x: 0.33 * imageWidth, y: 1/2 * imageHeight))
                        
                        
                        
                        
                        path.move(to: CGPoint(x: 0.33 * imageWidth, y: 0.9 * imageHeight))
                        
                        path.addQuadCurve(to: CGPoint(x: 0.45 * imageWidth, y: 1/2 * imageHeight),
                                          controlPoint: CGPoint(x: 0.33 * imageWidth, y: 1/2 * imageHeight))
                        
                        path.move(to: CGPoint(x: 0.45 * imageWidth, y: 1/2 * imageHeight))
                        path.addLine(to: CGPoint(x: (coord.x) - 30, y: 1/2 * imageHeight))
                        path.move(to: CGPoint(x: (coord.x) - 30, y: 1/2 * imageHeight))
                        
                        
                        path.addQuadCurve(to: CGPoint(x: coord.x, y: coord.y),
                                          controlPoint: CGPoint(x: coord.x, y: 1/2 * imageHeight))
                        
                        shapeLayerGreen.fillColor = .none
                        shapeLayerGreen.path = greenPath.cgPath
                        shapeLayerGreen.strokeColor = UIColor.green.cgColor
                        shapeLayerGreen.lineWidth = 2.0
                        imageView.layer.addSublayer(shapeLayerGreen)
                      
                        shapeLayer.path = path.cgPath
                        shapeLayer.fillColor = .none
                        shapeLayer.strokeColor = UIColor.red.cgColor
                        shapeLayer.lineWidth = 2.0
                        imageView.layer.addSublayer(shapeLayer)
                        shapeLayer.add(animation, forKey: "drawLineAnimation")
                        shapeLayerGreen.add(animation, forKey: "drawLineAnimation")
                    }
                }
            }
            
            
            
        }
        
    } else {
        print("тут пишем от кабинета до кабинета")
    }
    
    
    
    
}





