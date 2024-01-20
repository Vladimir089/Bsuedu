//
//  API.swift
//  IceRock
//
//  Created by Владимир on 03.01.2024.
//

import Foundation
import UIKit
import Vision






func twelverCorpus(path: UIBezierPath, greenPath: UIBezierPath, imageView: UIImageView, numb: Int)  {
    
    
    sdfsdfs
    
    let animation = CABasicAnimation(keyPath: "strokeEnd")
    animation.fromValue = 0.0
    animation.toValue = 1.0
    animation.duration = 1.0 // Длительность анимации в секундах
    
    
    let imageWidth = imageView.frame.size.width
    let imageHeight = imageView.frame.size.height
    
    
    if vhod == "вход 12 корпус" && numbImage == 1 {
        
        imageView.image = UIImage(named: "12corpHoll")

        
        path.addArc(withCenter: CGPoint(x: 0.63 * imageWidth, y: 0.9 * imageHeight), radius: 10, startAngle: 0, endAngle: CGFloat(2 * Double.pi), clockwise: true)
        
        
        path.move(to: CGPoint(x: 0.63 * imageWidth, y: 0.86 * imageHeight))
        path.addLine(to: CGPoint(x: 0.63 * imageWidth, y: 0.54 * imageHeight))
        
        path.move(to: CGPoint(x: 0.63 * imageWidth, y: 0.54 * imageHeight))
        path.addLine(to: CGPoint(x: 0.2 * imageWidth, y: 0.54 * imageHeight))
        
        path.move(to: CGPoint(x: 0.2 * imageWidth, y: 0.54 * imageHeight))
        path.addLine(to: CGPoint(x: 0.2 * imageWidth, y: 0.66 * imageHeight))
        
        path.move(to: CGPoint(x: 0.2 * imageWidth, y: 0.7 * imageHeight))
        path.addArc(withCenter: CGPoint(x: 0.2 * imageWidth, y: 0.7 * imageHeight), radius: 10, startAngle: 0, endAngle: CGFloat(2 * Double.pi), clockwise: true)
        
        greenPath.move(to: CGPoint(x: 0.4 * imageWidth, y: 0.54 * imageHeight))
        greenPath.addLine(to: CGPoint(x: 0.4 * imageWidth, y: 0.1 * imageHeight))
        
        greenPath.move(to: CGPoint(x: 0.4 * imageWidth, y: 0.1 * imageHeight))
        greenPath.addLine(to: CGPoint(x: 0.15 * imageWidth, y: 0.1 * imageHeight))
        
        greenPath.move(to: CGPoint(x: 0.15 * imageWidth, y: 0.1 * imageHeight))
        greenPath.addLine(to: CGPoint(x: 0.15 * imageWidth, y: 0.3 * imageHeight))
        
        greenPath.move(to: CGPoint(x: 0.15 * imageWidth, y: 0.3 * imageHeight))
        greenPath.addArc(withCenter: CGPoint(x: 0.15 * imageWidth, y: 0.3 * imageHeight), radius: 10, startAngle: 0, endAngle: CGFloat(2 * Double.pi), clockwise: true)
        
        
    }
    
    if corpGo == "12" && numbImage == 2 {
        imageView.image = UIImage(named: "12corp59")
        
        DispatchQueue.global().async {
            // Запускаем распознавание в фоновом потоке
            if let coord = recognizeDigits(imageView: imageView, path: path) {
                DispatchQueue.main.async {
                    // Возвращаемся на главный поток для обновления пользовательского интерфейса
                    greenPath.move(to: CGPoint(x: 0.33 * imageWidth, y: 0.15 * imageHeight))
                    greenPath.addLine(to: CGPoint(x: 0.33 * imageWidth, y: 1/2 * imageHeight))
                    path.move(to: CGPoint(x: 0.33 * imageWidth, y: 0.9 * imageHeight))
                    path.addLine(to: CGPoint(x: 0.33 * imageWidth, y: 1/2 * imageHeight))
                    path.move(to: CGPoint(x: 0.33 * imageWidth, y: 1/2 * imageHeight))
                    path.addLine(to: CGPoint(x: coord.x, y: 1/2 * imageHeight))
                    path.move(to: CGPoint(x: coord.x, y: 1/2 * imageHeight))
                    path.addLine(to: CGPoint(x: coord.x, y: coord.y))
                    
                    let shapeLayerGreen = CAShapeLayer()
                    shapeLayerGreen.path = greenPath.cgPath
                    shapeLayerGreen.strokeColor = UIColor.green.cgColor
                    shapeLayerGreen.lineWidth = 2.0
                    imageView.layer.addSublayer(shapeLayerGreen)
                    let shapeLayer = CAShapeLayer()
                    shapeLayer.path = path.cgPath
                    shapeLayer.strokeColor = UIColor.red.cgColor
                    shapeLayer.lineWidth = 2.0
                    imageView.layer.addSublayer(shapeLayer)
                    shapeLayer.add(animation, forKey: "drawLineAnimation")
                    shapeLayerGreen.add(animation, forKey: "drawLineAnimation")
                }
            }
        }
        
        
        
    }

}





