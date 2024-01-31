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
            
            greenPath.move(to: CGPoint(x: 0.3 * imageWidth, y: 0.6 * imageHeight))
            
            greenPath.addQuadCurve(to: CGPoint(x: 0.2 * imageWidth, y: 0.4 * imageHeight),
                                   controlPoint: CGPoint(x: 0.2 * imageWidth, y: 0.5 * imageHeight))
            
            greenPath.move(to: CGPoint(x: 0.2 * imageWidth, y: 0.4 * imageHeight))
            
            greenPath.addQuadCurve(to: CGPoint(x: 0.15 * imageWidth, y: 0.35 * imageHeight),
                                   controlPoint: CGPoint(x: 0.2 * imageWidth, y: 0.35 * imageHeight))
            
            greenPath.move(to: CGPoint(x: 0.15 * imageWidth, y: 0.35 * imageHeight))
            
            greenPath.addQuadCurve(to: CGPoint(x: 0.12 * imageWidth, y: 0.38 * imageHeight),
                                   controlPoint: CGPoint(x: 0.12 * imageWidth, y: 0.36 * imageHeight))
            
            
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
            
        }
        
        //MARK: -2й этаж
        
        if corpGo == "12" && numbImage == 2 && etazGo == 2 {
            
            but1.isEnabled = true
            but1.backgroundColor = UIColor(red: 0.9608, green: 0.8706, blue: 0.702, alpha: 1.0)
            but2.isEnabled = false
            but2.backgroundColor = .systemGray5
            
            imageView.image = nil
            imageView.image = UIImage(named: "12corp2")
            
            DispatchQueue.global().async {
                // Запускаем распознавание в фоновом потоке
                if let coord = recognizeDigits(imageView: imageView, path: path) {
                    DispatchQueue.main.async {
                        
                        greenPath.move(to: CGPoint(x: 0.14 * imageWidth, y: 0.47 * imageHeight))
                        
                        path.addArc(withCenter: CGPoint(x: 0.175 * imageWidth, y: 0.85 * imageHeight), radius: 5, startAngle: 0, endAngle: CGFloat(2 * Double.pi), clockwise: true)
                        path.move(to: CGPoint(x: 0.175 * imageWidth, y: 0.83 * imageHeight))
                        path.addLine(to: CGPoint(x: 0.175 * imageWidth, y: 0.8 * imageHeight))
                        path.move(to: CGPoint(x: 0.175 * imageWidth, y: 0.8 * imageHeight))
                        
                        if cabGo == "2-7" || cabGo == "2-9" || cabGo == "2-11" || cabGo == "2-13" {
                            path.addQuadCurve(to: CGPoint(x: 0.25 * imageWidth, y: 0.35 * imageHeight),
                                              controlPoint: CGPoint(x: 0.175 * imageWidth, y: 0.35 * imageHeight))
                            path.move(to: CGPoint(x: 0.25 * imageWidth, y: 0.35 * imageHeight))
                            
                            path.addQuadCurve(to: CGPoint(x: coord.x, y: coord.y),
                                              controlPoint: CGPoint(x: (coord.x) , y: 0.35 * imageHeight))
                            
                            
                            greenPath.addLine(to: CGPoint(x: 0.14 * imageWidth, y: 0.5 * imageHeight))
                            greenPath.move(to: CGPoint(x: 0.14 * imageWidth, y: 0.5 * imageHeight))
                            greenPath.addQuadCurve(to: CGPoint(x: 0.175 * imageWidth, y: 0.6 * imageHeight),
                                                   controlPoint: CGPoint(x: 0.15 * imageWidth, y: 0.65 * imageHeight))
                        }
                        
                        if cabGo == "2-2" || cabGo == "2-4" || cabGo == "2-6" || cabGo == "2-8" {
                            path.addQuadCurve(to: CGPoint(x: 0.2 * imageWidth, y: 0.7 * imageHeight),
                                              controlPoint: CGPoint(x: 0.175 * imageWidth, y: 0.7 * imageHeight))
                            
                            path.move(to: CGPoint(x: 0.2 * imageWidth, y: 0.7 * imageHeight))
                            
                            if cabGo != "2-4" {
                                path.addQuadCurve(to: CGPoint(x: coord.x , y: coord.y),
                                                  controlPoint: CGPoint(x: (coord.x)  , y: 0.7 * imageHeight))
                                
                            } else {
                                path.addQuadCurve(to: CGPoint(x: coord.x + 13, y: coord.y),
                                                  controlPoint: CGPoint(x: (coord.x) + 30 , y: 0.7 * imageHeight))
                            }
                            greenPath.addQuadCurve(to: CGPoint(x: 0.2 * imageWidth, y: 0.7 * imageHeight),
                                                   controlPoint: CGPoint(x: 0.2 * imageWidth, y: 0.6 * imageHeight))
                        }
                        
                        if cabGo ==  "2-17" || cabGo ==  "2-10Г" || cabGo ==  "2-10B" || cabGo ==  "2-10Б" || cabGo ==  "2-10" || cabGo ==  "2-10A" || cabGo ==  "2-26"  {
                            path.addQuadCurve(to: CGPoint(x: 0.2 * imageWidth, y: 0.7 * imageHeight),
                                              controlPoint: CGPoint(x: 0.175 * imageWidth, y: 0.7 * imageHeight))
                            path.move(to: CGPoint(x: 0.2 * imageWidth, y: 0.7 * imageHeight))
                            
                            
                            if cabGo == "2-17" {
                                path.addLine(to: CGPoint(x: 0.6 * imageWidth, y: 0.7 * imageHeight))
                                path.move(to: CGPoint(x: 0.6 * imageWidth, y: 0.7 * imageHeight))
                                path.addQuadCurve(to: CGPoint(x: coord.x  , y: coord.y + 10  ),
                                                  controlPoint: CGPoint(x: 0.67 * imageWidth, y: 0.7 * imageHeight))
                            } else if cabGo == "2-10Б" {
                                path.addLine(to: CGPoint(x: 0.6 * imageWidth, y: 0.7 * imageHeight))
                                path.move(to: CGPoint(x: 0.6 * imageWidth, y: 0.7 * imageHeight))
                                path.addQuadCurve(to: CGPoint(x: coord.x  , y: coord.y - 15  ),
                                                  controlPoint: CGPoint(x: 0.8 * imageWidth, y: 0.7 * imageHeight))
                            } else if cabGo == "2-10B" {
                                path.addLine(to: CGPoint(x: 0.6 * imageWidth, y: 0.7 * imageHeight))
                                path.move(to: CGPoint(x: 0.6 * imageWidth, y: 0.7 * imageHeight))
                                path.addQuadCurve(to: CGPoint(x: coord.x  , y: coord.y  ),
                                                  controlPoint: CGPoint(x: 0.85 * imageWidth, y: 0.7 * imageHeight))
                            } else if cabGo == "2-26" {
                                path.addLine(to: CGPoint(x: 0.4 * imageWidth, y: 0.7 * imageHeight))
                                path.move(to: CGPoint(x: 0.4 * imageWidth, y: 0.7 * imageHeight))
                                path.addQuadCurve(to: CGPoint(x: coord.x  , y: coord.y + 25 ),
                                                  controlPoint: CGPoint(x: 0.45 * imageWidth, y: 0.7 * imageHeight))
                                
                            }
                            else {
                                path.addLine(to: CGPoint(x: 0.6 * imageWidth, y: 0.7 * imageHeight))
                                path.move(to: CGPoint(x: 0.6 * imageWidth, y: 0.7 * imageHeight))
                                path.addQuadCurve(to: CGPoint(x: coord.x  , y: coord.y  ),
                                                  controlPoint: CGPoint(x: 0.67 * imageWidth, y: 0.7 * imageHeight))
                            }
                            greenPath.addQuadCurve(to: CGPoint(x: 0.2 * imageWidth, y: 0.7 * imageHeight),
                                                   controlPoint: CGPoint(x: 0.2 * imageWidth, y: 0.6 * imageHeight))
                            
                        }
                        shapeLayerGreen.fillColor = .none
                        shapeLayerGreen.path = greenPath.cgPath
                        shapeLayerGreen.strokeColor = UIColor.systemGray5.cgColor
                        shapeLayerGreen.lineWidth = 2.0
                        imageView.layer.addSublayer(shapeLayerGreen)
                        shapeLayer.path = path.cgPath
                        shapeLayer.fillColor = .none
                        shapeLayer.strokeColor = UIColor.systemGreen.cgColor
                        shapeLayer.lineWidth = 2.0
                        imageView.layer.addSublayer(shapeLayer)
                        shapeLayerGreen.add(animation, forKey: "drawLineAnimation")
                        shapeLayer.add(animation, forKey: "drawLineAnimation")
                        
                    }
                }
            }
            
            
            
        }
        
        //MARK: -3й этаж
        
        if corpGo == "12" && numbImage == 2 && etazGo == 3 {
            
            but1.isEnabled = true
            but1.backgroundColor = UIColor(red: 0.9608, green: 0.8706, blue: 0.702, alpha: 1.0)
            but2.isEnabled = false
            but2.backgroundColor = .systemGray5
            
            imageView.image = nil
            imageView.image = UIImage(named: "12corp3")
            
            DispatchQueue.global().async {
                
                if let coord = recognizeDigits(imageView: imageView, path: path) {
                    DispatchQueue.main.async {
                        
                        greenPath.move(to: CGPoint(x: 0.13 * imageWidth, y: 0.43 * imageHeight))
                        
                        
                        path.addArc(withCenter: CGPoint(x: 0.17 * imageWidth, y: 0.8 * imageHeight), radius: 5, startAngle: 0, endAngle: CGFloat(2 * Double.pi), clockwise: true)
                        path.move(to: CGPoint(x: 0.17 * imageWidth, y: 0.77 * imageHeight))
                        path.addLine(to: CGPoint(x: 0.17 * imageWidth, y: 0.7 * imageHeight))
                        path.move(to: CGPoint(x: 0.17 * imageWidth, y: 0.7 * imageHeight))
                        
                        if cabGo == "3-1" || cabGo == "3-3" || cabGo == "3-5" || cabGo == "3-7" || cabGo == "3-9" || cabGo == "3-11" || cabGo == "3-13" || cabGo == "3-15" {
                            if cabGo != "3-1" {
                                greenPath.addQuadCurve(to: CGPoint(x: 0.25 * imageWidth, y: 0.45 * imageHeight),
                                                       controlPoint: CGPoint(x: 0.16 * imageWidth, y: 0.48 * imageHeight))
                                
                                path.addQuadCurve(to: CGPoint(x: 0.25 * imageWidth, y: 0.45 * imageHeight),
                                                  controlPoint: CGPoint(x: 0.17 * imageWidth, y: 0.48 * imageHeight))
                                
                                path.move(to: CGPoint(x: 0.25 * imageWidth, y: 0.45 * imageHeight))
                                path.addQuadCurve(to: CGPoint(x: coord.x, y: coord.y + 10),
                                                  controlPoint: CGPoint(x: coord.x - 5, y: 0.45 * imageHeight))
                            } else {
                                greenPath.addQuadCurve(to: CGPoint(x: 0.1 * imageWidth, y: 0.45 * imageHeight),
                                                       controlPoint: CGPoint(x: 0.16 * imageWidth, y: 0.44 * imageHeight))
                                
                                path.addQuadCurve(to: CGPoint(x: coord.x + 6, y: 0.45 * imageHeight),
                                                  controlPoint: CGPoint(x: 0.16 * imageWidth, y: 0.44 * imageHeight))
                                print(1)
                            }
                            
                        }
                        
                        if cabGo == "3-4" || cabGo == "3-2" {
                            
                            greenPath.addQuadCurve(to: CGPoint(x: 0.2 * imageWidth, y: 0.65 * imageHeight),
                                                   controlPoint: CGPoint(x: 0.14 * imageWidth, y: 0.6 * imageHeight))
                            
                            path.addQuadCurve(to: CGPoint(x: 0.2 * imageWidth, y: 0.65 * imageHeight),
                                              controlPoint: CGPoint(x: 0.17 * imageWidth, y: 0.63 * imageHeight))
                            path.move(to: CGPoint(x: 0.2 * imageWidth, y: 0.65 * imageHeight))
                            
                            path.addQuadCurve(to: CGPoint(x: 0.24 * imageWidth, y: 0.75 * imageHeight),
                                              controlPoint: CGPoint(x: 0.22 * imageWidth, y: 0.65 * imageHeight))
                            path.move(to: CGPoint(x: 0.24 * imageWidth, y: 0.75 * imageHeight))
                            
                            path.addQuadCurve(to: CGPoint(x: cabGo == "3-4" ? coord.x - 12 : coord.x + 12 , y: coord.y + 10),
                                              controlPoint: CGPoint(x: 0.24 * imageWidth, y: coord.y ))
                        }
                        
                        
                        if cabGo == "3-16" || cabGo == "3-18" || cabGo == "3-20" || cabGo == "3-14" {
                            
                            greenPath.addQuadCurve(to: CGPoint(x: 0.18 * imageWidth, y: 0.6 * imageHeight),
                                                   controlPoint: CGPoint(x: 0.14 * imageWidth, y: 0.6 * imageHeight))
                            
                            path.addQuadCurve(to: CGPoint(x: 0.25 * imageWidth, y: 0.5 * imageHeight),
                                              controlPoint: CGPoint(x: 0.17 * imageWidth, y: 0.52 * imageHeight))
                            path.move(to: CGPoint(x: 0.25 * imageWidth, y: 0.5 * imageHeight))
                            
                            path.addQuadCurve(to: CGPoint(x: 0.36 * imageWidth, y: 0.7 * imageHeight),
                                              controlPoint: CGPoint(x: 0.36 * imageWidth, y: 0.5 * imageHeight))
                            
                            path.move(to: CGPoint(x: 0.36 * imageWidth, y: 0.7 * imageHeight))
                            
                            
                            
                            if cabGo != "3-16" && cabGo != "3-14"  {
                                path.addQuadCurve(to: CGPoint(x: 0.38 * imageWidth, y: 0.78 * imageHeight),
                                                  controlPoint: CGPoint(x: 0.36 * imageWidth, y: 0.77 * imageHeight))
                                path.move(to: CGPoint(x: 0.38 * imageWidth, y: 0.78 * imageHeight))
                                path.addQuadCurve(to: CGPoint(x: coord.x, y: coord.y - 5),
                                                  controlPoint: CGPoint(x: coord.x, y: 0.77 * imageHeight))
                            } else if cabGo == "3-14" {
                                path.addQuadCurve(to: CGPoint(x: 0.38 * imageWidth, y: 0.78 * imageHeight),
                                                  controlPoint: CGPoint(x: 0.36 * imageWidth, y: 0.77 * imageHeight))
                                path.move(to: CGPoint(x: 0.38 * imageWidth, y: 0.78 * imageHeight))
                                path.addQuadCurve(to: CGPoint(x: coord.x, y: coord.y + 15),
                                                  controlPoint: CGPoint(x: coord.x, y: 0.77 * imageHeight))
                            } else {
                                path.addLine(to: CGPoint(x: 0.36 * imageWidth, y: coord.y - 5))
                            }
                            
                        }
                        
                        if cabGo == "3-22" || cabGo == "3-24" || cabGo == "3-26" || cabGo == "3-30" || cabGo == "3-32" || cabGo == "3-32A" || cabGo == "3-27" {
                            greenPath.addQuadCurve(to: CGPoint(x: 0.18 * imageWidth, y: 0.6 * imageHeight),
                                                   controlPoint: CGPoint(x: 0.14 * imageWidth, y: 0.6 * imageHeight))
                            
                            path.addQuadCurve(to: CGPoint(x: 0.25 * imageWidth, y: 0.5 * imageHeight),
                                              controlPoint: CGPoint(x: 0.17 * imageWidth, y: 0.51 * imageHeight))
                            path.move(to: CGPoint(x: 0.25 * imageWidth, y: 0.5 * imageHeight))
                            
                            path.addQuadCurve(to: CGPoint(x: 0.7 * imageWidth, y: 0.65 * imageHeight),
                                              controlPoint: CGPoint(x: 0.65 * imageWidth, y: 0.5 * imageHeight))
                            
                            path.move(to: CGPoint(x: 0.7 * imageWidth, y: 0.65 * imageHeight))
                            
                            if cabGo == "3-22" || cabGo == "3-24" || cabGo == "3-26" {
                                path.addCurve(to: CGPoint(x: coord.x, y: coord.y - 5),
                                              controlPoint1: CGPoint(x: 0.72 * imageWidth, y: 0.75 * imageHeight),
                                              controlPoint2: CGPoint(x: coord.x, y: 0.75 * imageHeight))
                            }
                            
                            if cabGo == "3-30" || cabGo == "3-32" || cabGo == "3-32A" {
                                path.addQuadCurve(to: CGPoint(x: 0.85 * imageWidth, y: 0.75 * imageHeight),
                                                  controlPoint: CGPoint(x: 0.75 * imageWidth, y: 0.75 * imageHeight))
                                
                                path.move(to: CGPoint(x: 0.85 * imageWidth, y: 0.75 * imageHeight))
                                if cabGo == "3-30" {
                                    path.addLine(to: CGPoint(x: coord.x - 7, y: 0.75 * imageHeight))
                                }
                                if cabGo == "3-32" || cabGo == "3-32A" {
                                    path.addCurve(to: CGPoint(x: coord.x - 7, y: coord.y),
                                                  controlPoint1: CGPoint(x: 0.95 * imageWidth, y: 0.75 * imageHeight),
                                                  controlPoint2: CGPoint(x: coord.x - 20, y: coord.y ))
                                    
                                }
                                
                            }
                            if cabGo == "3-27" {
                                path.addQuadCurve(to: CGPoint(x: coord.x, y: coord.y + 15),
                                                  controlPoint: CGPoint(x: 0.73 * imageWidth, y: 0.4 * imageWidth))
                                
                            }
                            
                        }
                        
                        
                        shapeLayerGreen.fillColor = .none
                        shapeLayerGreen.path = greenPath.cgPath
                        shapeLayerGreen.strokeColor = UIColor.systemGray5.cgColor
                        shapeLayerGreen.lineWidth = 2.0
                        imageView.layer.addSublayer(shapeLayerGreen)
                        shapeLayer.path = path.cgPath
                        shapeLayer.fillColor = .none
                        shapeLayer.strokeColor = UIColor.systemGreen.cgColor
                        shapeLayer.lineWidth = 2.0
                        imageView.layer.addSublayer(shapeLayer)
                        shapeLayerGreen.add(animation, forKey: "drawLineAnimation")
                        shapeLayer.add(animation, forKey: "drawLineAnimation")
                        
                    }
                }
            }
            
        }
        
        
        
        if corpGo == "12" && numbImage == 2 && etazGo == 4 {
            
            but1.isEnabled = true
            but1.backgroundColor = UIColor(red: 0.9608, green: 0.8706, blue: 0.702, alpha: 1.0)
            but2.isEnabled = false
            but2.backgroundColor = .systemGray5
            
            imageView.image = nil
            imageView.image = UIImage(named: "12corp4")
            
            DispatchQueue.global().async {
                
                if let coord = recognizeDigits(imageView: imageView, path: path) {
                    DispatchQueue.main.async {
                        
                        greenPath.move(to: CGPoint(x: 0.14 * imageWidth, y: 0.44 * imageHeight))
                        
                        greenPath.addQuadCurve(to: CGPoint(x: 0.2 * imageWidth, y: 0.6 * imageHeight),
                                               controlPoint: CGPoint(x: 0.15 * imageWidth, y: 0.55 * imageHeight))
                        
                        
                        path.addArc(withCenter: CGPoint(x: 0.14 * imageWidth, y: 0.9 * imageHeight), radius: 5, startAngle: 0, endAngle: CGFloat(2 * Double.pi), clockwise: true)
                        path.move(to: CGPoint(x: 0.14 * imageWidth, y: 0.87 * imageHeight))
                        path.addLine(to: CGPoint(x: 0.14 * imageWidth, y: 0.8 * imageHeight))
                        path.move(to: CGPoint(x: 0.14 * imageWidth, y: 0.8 * imageHeight))
                        path.addQuadCurve(to: CGPoint(x: 0.2 * imageWidth, y: 0.6 * imageHeight),
                                          controlPoint: CGPoint(x: 0.14 * imageWidth, y: 0.62 * imageHeight))
                        
                        
                        
                        path.move(to: CGPoint(x: 0.2 * imageWidth, y: 0.6 * imageHeight))
                        
                        if cabGo == "4-4" || cabGo == "4-10" || cabGo == "4-12" || cabGo == "4-14" || cabGo == "4-6" || cabGo == "4-20" || cabGo == "4-18" || cabGo == "4-23" || cabGo == "4-8" {
                            
                            if cabGo == "4-4"    {
                                path.addQuadCurve(to: CGPoint(x: coord.x, y: coord.y - 5),
                                                  controlPoint: CGPoint(x: coord.x + 5, y: 0.62 * imageHeight))
                            }
                            if cabGo == "4-10" {
                                path.addQuadCurve(to: CGPoint(x: coord.x + 20, y: coord.y - 5),
                                                  controlPoint: CGPoint(x: coord.x + 5, y: 0.62 * imageHeight))
                            }
                            
                            if cabGo == "4-12" {
                                path.addQuadCurve(to: CGPoint(x: coord.x, y: coord.y - 10),
                                                  controlPoint: CGPoint(x: coord.x + 5, y: 0.62 * imageHeight))
                            }
                            
                            if cabGo == "4-14" {
                                path.addQuadCurve(to: CGPoint(x: coord.x, y: coord.y - 27),
                                                  controlPoint: CGPoint(x: coord.x + 5, y: 0.62 * imageHeight))
                            }
                            if cabGo == "4-6" {
                                path.addQuadCurve(to: CGPoint(x: coord.x, y: coord.y - 17),
                                                  controlPoint: CGPoint(x: coord.x + 5, y: 0.62 * imageHeight))
                            }
                            if cabGo == "4-20" {
                                path.addQuadCurve(to: CGPoint(x: coord.x, y: coord.y - 5),
                                                  controlPoint: CGPoint(x: coord.x + 5 , y: 0.5 * imageHeight))
                            }
                            if cabGo == "4-18" {
                                path.addQuadCurve(to: CGPoint(x: coord.x + 10, y: coord.y - 5),
                                                  controlPoint: CGPoint(x: coord.x + 35 , y: 0.5 * imageHeight))
                            }
                            if cabGo == "4-23" {
                                path.addQuadCurve(to: CGPoint(x: coord.x, y: coord.y + 28),
                                                  controlPoint: CGPoint(x: coord.x - 5, y: 0.62 * imageHeight))
                                
                            }
                            if cabGo == "4-8" {
                                path.addQuadCurve(to: CGPoint(x: coord.x, y: coord.y - 10),
                                                  controlPoint: CGPoint(x: coord.x - 5, y: 0.62 * imageHeight))
                                
                            }
                        } else {
                            path.addQuadCurve(to: CGPoint(x: coord.x, y: coord.y + 10),
                                              controlPoint: CGPoint(x: coord.x - 5, y: 0.62 * imageHeight))
                        }
                        
                        shapeLayerGreen.fillColor = .none
                        shapeLayerGreen.path = greenPath.cgPath
                        shapeLayerGreen.strokeColor = UIColor.systemGray5.cgColor
                        shapeLayerGreen.lineWidth = 2.0
                        imageView.layer.addSublayer(shapeLayerGreen)
                        shapeLayer.path = path.cgPath
                        shapeLayer.fillColor = .none
                        shapeLayer.strokeColor = UIColor.systemGreen.cgColor
                        shapeLayer.lineWidth = 2.0
                        imageView.layer.addSublayer(shapeLayer)
                        shapeLayerGreen.add(animation, forKey: "drawLineAnimation")
                        shapeLayer.add(animation, forKey: "drawLineAnimation")
                        
                    }
                }
            }
            
        }
        
        
        
        
        if corpGo == "12" && numbImage == 2 && etazGo == 5 {
            
            but1.isEnabled = true
            but1.backgroundColor = UIColor(red: 0.9608, green: 0.8706, blue: 0.702, alpha: 1.0)
            but2.isEnabled = false
            but2.backgroundColor = .systemGray5
            
            imageView.image = nil
            imageView.image = UIImage(named: "12corp5")
            
            DispatchQueue.global().async {
                
                if let coord = recognizeDigits(imageView: imageView, path: path) {
                    DispatchQueue.main.async {
                        
                                                
                        
                        
                        path.addArc(withCenter: CGPoint(x: 0.13 * imageWidth, y: 0.9 * imageHeight), radius: 5, startAngle: 0, endAngle: CGFloat(2 * Double.pi), clockwise: true)
                        path.move(to: CGPoint(x: 0.13 * imageWidth, y: 0.87 * imageHeight))
                        path.addLine(to: CGPoint(x: 0.13 * imageWidth, y: 0.8 * imageHeight))
                        path.move(to: CGPoint(x: 0.13 * imageWidth, y: 0.8 * imageHeight))
                        
                        greenPath.move(to: CGPoint(x: 0.13 * imageWidth, y: 0.34 * imageHeight))
                        
                        if cabGo == "5-3" {
                            path.addQuadCurve(to: CGPoint(x: coord.x, y: coord.y + 10),
                                              controlPoint: CGPoint(x: 0.13 * imageWidth, y: 0.62 * imageHeight))
                            
                            
    
                            greenPath.addQuadCurve(to: CGPoint(x: 0.09 * imageWidth, y: 0.4 * imageHeight),
                                              controlPoint: CGPoint(x: 0.15 * imageWidth, y: 0.5 * imageHeight))
                        } else {
                            path.addQuadCurve(to: CGPoint(x: 0.15 * imageWidth, y: 0.6 * imageHeight),
                                              controlPoint: CGPoint(x: 0.13 * imageWidth, y: 0.62 * imageHeight))
                            path.move(to: CGPoint(x: 0.15 * imageWidth, y: 0.6 * imageHeight))
                            greenPath.addQuadCurve(to: CGPoint(x: 0.15 * imageWidth, y: 0.6 * imageHeight),
                                              controlPoint: CGPoint(x: 0.13 * imageWidth, y: 0.5 * imageHeight))
                            
                        }
                        
                        
                        
                        if cabGo == "5-6" || cabGo == "5-8" || cabGo == "5-20" {
                            if cabGo == "5-6" {
                                path.addQuadCurve(to: CGPoint(x: coord.x + 20, y: coord.y - 7),
                                                  controlPoint: CGPoint(x: coord.x + 8 , y: 0.5 * imageHeight))
                            }
                            if cabGo == "5-8" {
                                path.addQuadCurve(to: CGPoint(x: coord.x - 10, y: coord.y - 7),
                                                  controlPoint: CGPoint(x: coord.x - 15, y: 0.62 * imageHeight))
                            }
                            
                            if cabGo == "5-20" {
                                path.addQuadCurve(to: CGPoint(x: coord.x, y: coord.y - 13),
                                                  controlPoint: CGPoint(x: coord.x + 5 , y: 0.5 * imageHeight))
                            }
                            
                            
                        } else {
                            if cabGo == "5-14" || cabGo == "5-18" {
                                path.addQuadCurve(to: CGPoint(x: coord.x, y: coord.y - 16),
                                                  controlPoint: CGPoint(x: coord.x - 5, y: 0.62 * imageHeight))
                            }
                            if cabGo == "5-5" || cabGo == "5-7" || cabGo == "5-9" || cabGo == "5-11" || cabGo == "5-13" {
                                path.addQuadCurve(to: CGPoint(x: coord.x, y: coord.y + 10),
                                                  controlPoint: CGPoint(x: coord.x - 5, y: 0.62 * imageHeight))
                            }
                           
                        }
                        
                        
                        
                        
                        shapeLayerGreen.fillColor = .none
                        shapeLayerGreen.path = greenPath.cgPath
                        shapeLayerGreen.strokeColor = UIColor.systemGray5.cgColor
                        shapeLayerGreen.lineWidth = 2.0
                        imageView.layer.addSublayer(shapeLayerGreen)
                        shapeLayer.path = path.cgPath
                        shapeLayer.fillColor = .none
                        shapeLayer.strokeColor = UIColor.systemGreen.cgColor
                        shapeLayer.lineWidth = 2.0
                        imageView.layer.addSublayer(shapeLayer)
                        shapeLayerGreen.add(animation, forKey: "drawLineAnimation")
                        shapeLayer.add(animation, forKey: "drawLineAnimation")
                        
                    }
                }
            }
            
        }
        
        if corpGo == "12" && numbImage == 2 && etazGo == 6 {
            
            but1.isEnabled = true
            but1.backgroundColor = UIColor(red: 0.9608, green: 0.8706, blue: 0.702, alpha: 1.0)
            but2.isEnabled = false
            but2.backgroundColor = .systemGray5
            
            imageView.image = nil
            imageView.image = UIImage(named: "12corp6")
            
            DispatchQueue.global().async {
                
                if let coord = recognizeDigits(imageView: imageView, path: path) {
                    DispatchQueue.main.async {
                        
                                                
                        
                        
                        path.addArc(withCenter: CGPoint(x: 0.13 * imageWidth, y: 0.9 * imageHeight), radius: 5, startAngle: 0, endAngle: CGFloat(2 * Double.pi), clockwise: true)
                        path.move(to: CGPoint(x: 0.13 * imageWidth, y: 0.87 * imageHeight))
                        path.addLine(to: CGPoint(x: 0.13 * imageWidth, y: 0.8 * imageHeight))
                        path.move(to: CGPoint(x: 0.13 * imageWidth, y: 0.8 * imageHeight))
                        
                        greenPath.move(to: CGPoint(x: 0.15 * imageWidth, y: 0.35 * imageHeight))
                        
                        if cabGo == "6-1" || cabGo == "6-3" {
                            path.addQuadCurve(to: CGPoint(x: coord.x, y: coord.y + 12),
                                              controlPoint: CGPoint(x: 0.13 * imageWidth, y: 0.62 * imageHeight))
                            if cabGo == "6-3" {
                                greenPath.addQuadCurve(to: CGPoint(x: 0.12 * imageWidth, y: 0.62 * imageHeight),
                                                  controlPoint: CGPoint(x: 0.15 * imageWidth, y: 0.7 * imageHeight))
                            } else {
                                greenPath.addQuadCurve(to: CGPoint(x: 0.11 * imageWidth, y: 0.62 * imageHeight),
                                                  controlPoint: CGPoint(x: 0.15 * imageWidth, y: 0.7 * imageHeight))
                            }
                            
                            
                        } else {
                            path.addQuadCurve(to: CGPoint(x: 0.15 * imageWidth, y: 0.6 * imageHeight),
                                              controlPoint: CGPoint(x: 0.13 * imageWidth, y: 0.62 * imageHeight))
                            path.move(to: CGPoint(x: 0.15 * imageWidth, y: 0.6 * imageHeight))
                            greenPath.addQuadCurve(to: CGPoint(x: 0.15 * imageWidth, y: 0.6 * imageHeight),
                                              controlPoint: CGPoint(x: 0.13 * imageWidth, y: 0.5 * imageHeight))
                        }
                        
                        if cabGo == "6-5" || cabGo == "6-7" || cabGo == "6-11" || cabGo == "6-13" || cabGo == "6-15" {
                            path.addQuadCurve(to: CGPoint(x: coord.x, y: coord.y + 14),
                                              controlPoint: CGPoint(x: coord.x - 5, y: 0.62 * imageHeight))
                        } 
                        if cabGo == "6-4" || cabGo == "6-6" || cabGo == "6-8" || cabGo == "6-12" || cabGo == "6-10" || cabGo == "6-16" {
                            if cabGo == "6-4" {
                                path.addQuadCurve(to: CGPoint(x: coord.x, y: coord.y - 7),
                                                  controlPoint: CGPoint(x: coord.x + 8 , y: 0.5 * imageHeight))
                            }
                            if cabGo == "6-8"  {
                                path.addQuadCurve(to: CGPoint(x: coord.x, y: coord.y - 13),
                                                  controlPoint: CGPoint(x: coord.x + 5, y: 0.62 * imageHeight))
                            }
                            if cabGo == "6-6"  {
                                path.addQuadCurve(to: CGPoint(x: coord.x, y: coord.y - 33),
                                                  controlPoint: CGPoint(x: coord.x + 5, y: 0.62 * imageHeight))
                            }
                            
                            if cabGo == "6-12"  {
                                path.addQuadCurve(to: CGPoint(x: coord.x, y: coord.y - 13),
                                                  controlPoint: CGPoint(x: coord.x + 5, y: 0.5 * imageHeight))
                            }
                            if cabGo == "6-10"  {
                                path.addQuadCurve(to: CGPoint(x: coord.x, y: coord.y - 33),
                                                  controlPoint: CGPoint(x: coord.x + 5, y: 0.5 * imageHeight))
                            }
                            
                            if cabGo == "6-16"  {
                                path.addQuadCurve(to: CGPoint(x: coord.x + 17, y: coord.y - 12),
                                                  controlPoint: CGPoint(x: coord.x + 30, y: 0.5 * imageHeight))
                            }
                        }
                        
                        
                        
                        
                        shapeLayerGreen.fillColor = .none
                        shapeLayerGreen.path = greenPath.cgPath
                        shapeLayerGreen.strokeColor = UIColor.systemGray5.cgColor
                        shapeLayerGreen.lineWidth = 2.0
                        imageView.layer.addSublayer(shapeLayerGreen)
                        shapeLayer.path = path.cgPath
                        shapeLayer.fillColor = .none
                        shapeLayer.strokeColor = UIColor.systemGreen.cgColor
                        shapeLayer.lineWidth = 2.0
                        imageView.layer.addSublayer(shapeLayer)
                        shapeLayerGreen.add(animation, forKey: "drawLineAnimation")
                        shapeLayer.add(animation, forKey: "drawLineAnimation")
                        
                    }
                }
            }
            
        }
        
        
        if corpGo == "12" && numbImage == 2 && etazGo == 7 {
            
            but1.isEnabled = true
            but1.backgroundColor = UIColor(red: 0.9608, green: 0.8706, blue: 0.702, alpha: 1.0)
            but2.isEnabled = false
            but2.backgroundColor = .systemGray5
            
            imageView.image = nil
            imageView.image = UIImage(named: "12corp7")
            
            DispatchQueue.global().async {
                
                if let coord = recognizeDigits(imageView: imageView, path: path) {
                    DispatchQueue.main.async {
                        
                        
                        
                        
                        path.addArc(withCenter: CGPoint(x: 0.13 * imageWidth, y: 0.9 * imageHeight), radius: 5, startAngle: 0, endAngle: CGFloat(2 * Double.pi), clockwise: true)
                        path.move(to: CGPoint(x: 0.13 * imageWidth, y: 0.87 * imageHeight))
                        path.addLine(to: CGPoint(x: 0.13 * imageWidth, y: 0.8 * imageHeight))
                        path.move(to: CGPoint(x: 0.13 * imageWidth, y: 0.8 * imageHeight))
                        
                        greenPath.move(to: CGPoint(x: 0.16 * imageWidth, y: 0.34 * imageHeight))
                        
                        
                        if cabGo == "7-3" {
                            path.addQuadCurve(to: CGPoint(x: coord.x, y: coord.y + 10),
                                              controlPoint: CGPoint(x: 0.13 * imageWidth, y: 0.62 * imageHeight))
                            
                            
    
                            greenPath.addQuadCurve(to: CGPoint(x: 0.1 * imageWidth, y: 0.4 * imageHeight),
                                              controlPoint: CGPoint(x: 0.15 * imageWidth, y: 0.5 * imageHeight))
                        } else {
                            path.addQuadCurve(to: CGPoint(x: 0.15 * imageWidth, y: 0.6 * imageHeight),
                                              controlPoint: CGPoint(x: 0.13 * imageWidth, y: 0.62 * imageHeight))
                            path.move(to: CGPoint(x: 0.15 * imageWidth, y: 0.6 * imageHeight))
                            greenPath.addQuadCurve(to: CGPoint(x: 0.15 * imageWidth, y: 0.6 * imageHeight),
                                              controlPoint: CGPoint(x: 0.13 * imageWidth, y: 0.5 * imageHeight))
                            
                        }
                        
                        if cabGo == "7-5" || cabGo == "7-9" || cabGo == "7-11" || cabGo == "7-15" || cabGo == "7-17" || cabGo == "7-13" {
                            path.addQuadCurve(to: CGPoint(x: coord.x, y: coord.y + 14),
                                              controlPoint: CGPoint(x: coord.x - 5, y: 0.62 * imageHeight))
                        }
                        if cabGo == "7-4" || cabGo == "7-6" || cabGo == "7-8" || cabGo == "7-14" {
                            path.addQuadCurve(to: CGPoint(x: coord.x, y: coord.y - 28),
                                              controlPoint: CGPoint(x: coord.x + 5, y: 0.5 * imageHeight))
                        }
                        if cabGo == "7-10" || cabGo == "7-12" {
                            if cabGo == "7-12" {
                                path.addQuadCurve(to: CGPoint(x: coord.x, y: coord.y - 30),
                                                  controlPoint: CGPoint(x: coord.x + 5, y: 0.5 * imageHeight))
                            }
                            if cabGo == "7-10" {
                                path.addQuadCurve(to: CGPoint(x: coord.x, y: coord.y - 15),
                                                  controlPoint: CGPoint(x: coord.x + 5, y: 0.5 * imageHeight))
                            }
                        }
                        
                        if cabGo == "7-16" {
                            path.addQuadCurve(to: CGPoint(x: coord.x, y: coord.y - 10),
                                              controlPoint: CGPoint(x: coord.x + 15, y: 0.4 * imageHeight))
                        }
                        
                        shapeLayerGreen.fillColor = .none
                        shapeLayerGreen.path = greenPath.cgPath
                        shapeLayerGreen.strokeColor = UIColor.systemGray5.cgColor
                        shapeLayerGreen.lineWidth = 2.0
                        imageView.layer.addSublayer(shapeLayerGreen)
                        shapeLayer.path = path.cgPath
                        shapeLayer.fillColor = .none
                        shapeLayer.strokeColor = UIColor.systemGreen.cgColor
                        shapeLayer.lineWidth = 2.0
                        imageView.layer.addSublayer(shapeLayer)
                        shapeLayerGreen.add(animation, forKey: "drawLineAnimation")
                        shapeLayer.add(animation, forKey: "drawLineAnimation")
                        
                    }
                }
            }
            
        }
        
    } else {
        print("тут пишем от кабинета до кабинета")
    }
    
    
    
    
}





