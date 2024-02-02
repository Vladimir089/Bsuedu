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


func twelverCorpus(path: UIBezierPath, greenPath: UIBezierPath, imageView: UIImageView, numb: Int, but1: UIButton, but2: UIButton)  {
    mainMenuView = MainMenuView()
    imageView.contentMode = .scaleAspectFill
    
    but1.isEnabled = false
               but1.backgroundColor = .systemGray5
               but2.isEnabled = true
               but2.backgroundColor = UIColor(red: 0.9608, green: 0.8706, blue: 0.702, alpha: 1.0)
            
    let imageWidth = imageView.frame.size.width
    let imageHeight = imageView.frame.size.height
    
    if vhod == "вход 12 корпус" && numbImage == 1 && isOnlyVhod == 1 {
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
            path.move(to: CGPoint(x: 0.12 * imageWidth, y: 0.83 * imageHeight))
        }
        
    
        //MARK: 2й этаж
        if (corpGo == "12" && numbImage == 2 && etazGo == 2 && (isOnlyVhod == 1 || isOnlyVhod == 0))
            || (corp == "12" && etaz == 2 && isOnlyVhod == 0 && numbImage == 1 ) {
            
            but1.isEnabled = true
            but1.backgroundColor = UIColor(red: 0.9608, green: 0.8706, blue: 0.702, alpha: 1.0)
            but2.isEnabled = false
            but2.backgroundColor = .systemGray5
            
            
            if corp == "12" && etaz == 2 && isOnlyVhod == 0  {
                but1.isEnabled = false
                but1.backgroundColor = .systemGray5
                but2.isEnabled = true
                but2.backgroundColor = UIColor(red: 0.9608, green: 0.8706, blue: 0.702, alpha: 1.0)
                numbImage = 1
            }
            
            
            
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
                        
                        if (cabGo == "2-7" || cabGo == "2-9" || cabGo == "2-11" || cabGo == "2-13") ||
                            (cab == "2-7" || cab == "2-9" || cab == "2-11" || cab == "2-13") {
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
                        
                        if (cabGo == "2-2" || cabGo == "2-4" || cabGo == "2-6" || cabGo == "2-8") ||
                            (cab == "2-2" || cab == "2-4" || cab == "2-6" || cab == "2-8") {
                            path.addQuadCurve(to: CGPoint(x: 0.2 * imageWidth, y: 0.7 * imageHeight),
                                              controlPoint: CGPoint(x: 0.175 * imageWidth, y: 0.7 * imageHeight))
                            
                            path.move(to: CGPoint(x: 0.2 * imageWidth, y: 0.7 * imageHeight))
                            
                            if cabGo == "2-4" || cab == "2-4"  {
                                path.addQuadCurve(to: CGPoint(x: coord.x + 13 , y: coord.y),
                                                  controlPoint: CGPoint(x: (coord.x) + 30 , y: 0.6 * imageHeight))
                            }
                            if cabGo == "2-2" || cab == "2-2" {
                                path.addQuadCurve(to: CGPoint(x: coord.x , y: coord.y),
                                                  controlPoint: CGPoint(x: (coord.x)  , y: 0.7 * imageHeight))
                            }
                            if cabGo == "2-6" || cab == "2-6" {
                                path.addQuadCurve(to: CGPoint(x: coord.x , y: coord.y),
                                                  controlPoint: CGPoint(x: (coord.x)  , y: 0.7 * imageHeight))
                            }
                            if cabGo == "2-8" || cab == "2-8" {
                                path.addQuadCurve(to: CGPoint(x: coord.x , y: coord.y),
                                                  controlPoint: CGPoint(x: (coord.x)  , y: 0.7 * imageHeight))
                            }
                            
                               
                            
                            greenPath.addQuadCurve(to: CGPoint(x: 0.2 * imageWidth, y: 0.7 * imageHeight),
                                                   controlPoint: CGPoint(x: 0.2 * imageWidth, y: 0.6 * imageHeight))
                        }
                        
                        if (cabGo ==  "2-17" || cabGo ==  "2-10Г" || cabGo ==  "2-10B" || cabGo ==  "2-10Б" || cabGo ==  "2-10" || cabGo ==  "2-10A" || cabGo ==  "2-26") ||
                            (cab ==  "2-17" || cab ==  "2-10Г" || cab ==  "2-10B" || cab ==  "2-10Б" || cab ==  "2-10" || cab ==  "2-10A" || cab ==  "2-26"){
                            path.addQuadCurve(to: CGPoint(x: 0.2 * imageWidth, y: 0.7 * imageHeight),
                                              controlPoint: CGPoint(x: 0.175 * imageWidth, y: 0.7 * imageHeight))
                            path.move(to: CGPoint(x: 0.2 * imageWidth, y: 0.7 * imageHeight))
                            
                            
                            if cabGo == "2-17" || cab == "2-17" {
                                path.addLine(to: CGPoint(x: 0.6 * imageWidth, y: 0.7 * imageHeight))
                                path.move(to: CGPoint(x: 0.6 * imageWidth, y: 0.7 * imageHeight))
                                path.addQuadCurve(to: CGPoint(x: coord.x  , y: coord.y + 10  ),
                                                  controlPoint: CGPoint(x: 0.67 * imageWidth, y: 0.7 * imageHeight))
                            } else if cabGo == "2-10Б" || cab == "2-10Б"{
                                path.addLine(to: CGPoint(x: 0.6 * imageWidth, y: 0.7 * imageHeight))
                                path.move(to: CGPoint(x: 0.6 * imageWidth, y: 0.7 * imageHeight))
                                path.addQuadCurve(to: CGPoint(x: coord.x  , y: coord.y - 15  ),
                                                  controlPoint: CGPoint(x: 0.8 * imageWidth, y: 0.7 * imageHeight))
                            } else if cabGo == "2-10B" || cab == "2-10B" {
                                path.addLine(to: CGPoint(x: 0.6 * imageWidth, y: 0.7 * imageHeight))
                                path.move(to: CGPoint(x: 0.6 * imageWidth, y: 0.7 * imageHeight))
                                path.addQuadCurve(to: CGPoint(x: coord.x  , y: coord.y  ),
                                                  controlPoint: CGPoint(x: 0.85 * imageWidth, y: 0.7 * imageHeight))
                            } else if cabGo == "2-26" || cab == "2-26" {
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
                        
                        addLine(greenPath: greenPath, imageView: imageView, path: path)
                        
                        
                    }
                }
            }
        }
    
    
        //MARK: 3й этаж
        if (corpGo == "12" && numbImage == 2 && etazGo == 3) || (corp == "12" && etaz == 3 && isOnlyVhod == 0 && numbImage == 1 )  {
            
            but1.isEnabled = true
            but1.backgroundColor = UIColor(red: 0.9608, green: 0.8706, blue: 0.702, alpha: 1.0)
            but2.isEnabled = false
            but2.backgroundColor = .systemGray5
            
            
            if corp == "12" && etaz == 3 && isOnlyVhod == 0  {
                but1.isEnabled = false
                but1.backgroundColor = .systemGray5
                but2.isEnabled = true
                but2.backgroundColor = UIColor(red: 0.9608, green: 0.8706, blue: 0.702, alpha: 1.0)
                numbImage = 1
            }
            
            
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
                        
                        if (cabGo == "3-1" || cabGo == "3-3" || cabGo == "3-5" || cabGo == "3-7" || cabGo == "3-9" || cabGo == "3-11" || cabGo == "3-13" || cabGo == "3-15") ||
                            (cab == "3-1" || cab == "3-3" || cab == "3-5" || cab == "3-7" || cab == "3-9" || cab == "3-11" || cab == "3-13" || cab == "3-15") {
                            
                            if cabGo == "3-1" || cab == "3-1" {
                                greenPath.addQuadCurve(to: CGPoint(x: 0.1 * imageWidth, y: 0.45 * imageHeight),
                                                       controlPoint: CGPoint(x: 0.16 * imageWidth, y: 0.44 * imageHeight))
                                
                                path.addQuadCurve(to: CGPoint(x: coord.x + 6, y: 0.45 * imageHeight),
                                                  controlPoint: CGPoint(x: 0.16 * imageWidth, y: 0.44 * imageHeight))
                                print(1)
                            }
                            
                            if cabGo == "3-3" || cab == "3-3" {
                                greenPath.addQuadCurve(to: CGPoint(x: 0.25 * imageWidth, y: 0.45 * imageHeight),
                                                       controlPoint: CGPoint(x: 0.16 * imageWidth, y: 0.48 * imageHeight))
                                
                                path.addQuadCurve(to: CGPoint(x: 0.25 * imageWidth, y: 0.45 * imageHeight),
                                                  controlPoint: CGPoint(x: 0.17 * imageWidth, y: 0.48 * imageHeight))
                                
                                path.move(to: CGPoint(x: 0.25 * imageWidth, y: 0.45 * imageHeight))
                                path.addQuadCurve(to: CGPoint(x: coord.x, y: coord.y + 10),
                                                  controlPoint: CGPoint(x: coord.x - 5, y: 0.45 * imageHeight))
                            }
                            if cabGo == "3-5" || cab == "3-5" {
                                greenPath.addQuadCurve(to: CGPoint(x: 0.25 * imageWidth, y: 0.45 * imageHeight),
                                                       controlPoint: CGPoint(x: 0.16 * imageWidth, y: 0.48 * imageHeight))
                                
                                path.addQuadCurve(to: CGPoint(x: 0.25 * imageWidth, y: 0.45 * imageHeight),
                                                  controlPoint: CGPoint(x: 0.17 * imageWidth, y: 0.48 * imageHeight))
                                
                                path.move(to: CGPoint(x: 0.25 * imageWidth, y: 0.45 * imageHeight))
                                path.addQuadCurve(to: CGPoint(x: coord.x, y: coord.y + 10),
                                                  controlPoint: CGPoint(x: coord.x - 5, y: 0.45 * imageHeight))
                            }
                            if cabGo == "3-7" || cab == "3-7" {
                                greenPath.addQuadCurve(to: CGPoint(x: 0.25 * imageWidth, y: 0.45 * imageHeight),
                                                       controlPoint: CGPoint(x: 0.16 * imageWidth, y: 0.48 * imageHeight))
                                
                                path.addQuadCurve(to: CGPoint(x: 0.25 * imageWidth, y: 0.45 * imageHeight),
                                                  controlPoint: CGPoint(x: 0.17 * imageWidth, y: 0.48 * imageHeight))
                                
                                path.move(to: CGPoint(x: 0.25 * imageWidth, y: 0.45 * imageHeight))
                                path.addQuadCurve(to: CGPoint(x: coord.x, y: coord.y + 10),
                                                  controlPoint: CGPoint(x: coord.x - 5, y: 0.45 * imageHeight))
                            }
                            if cabGo == "3-9" || cab == "3-9" {
                                greenPath.addQuadCurve(to: CGPoint(x: 0.25 * imageWidth, y: 0.45 * imageHeight),
                                                       controlPoint: CGPoint(x: 0.16 * imageWidth, y: 0.48 * imageHeight))
                                
                                path.addQuadCurve(to: CGPoint(x: 0.25 * imageWidth, y: 0.45 * imageHeight),
                                                  controlPoint: CGPoint(x: 0.17 * imageWidth, y: 0.48 * imageHeight))
                                
                                path.move(to: CGPoint(x: 0.25 * imageWidth, y: 0.45 * imageHeight))
                                path.addQuadCurve(to: CGPoint(x: coord.x, y: coord.y + 10),
                                                  controlPoint: CGPoint(x: coord.x - 5, y: 0.45 * imageHeight))
                            }
                            if cabGo == "3-11" || cab == "3-11" {
                                greenPath.addQuadCurve(to: CGPoint(x: 0.25 * imageWidth, y: 0.45 * imageHeight),
                                                       controlPoint: CGPoint(x: 0.16 * imageWidth, y: 0.48 * imageHeight))
                                
                                path.addQuadCurve(to: CGPoint(x: 0.25 * imageWidth, y: 0.45 * imageHeight),
                                                  controlPoint: CGPoint(x: 0.17 * imageWidth, y: 0.48 * imageHeight))
                                
                                path.move(to: CGPoint(x: 0.25 * imageWidth, y: 0.45 * imageHeight))
                                path.addQuadCurve(to: CGPoint(x: coord.x, y: coord.y + 10),
                                                  controlPoint: CGPoint(x: coord.x - 5, y: 0.45 * imageHeight))
                            }
                            if cabGo == "3-13" || cab == "3-13" {
                                greenPath.addQuadCurve(to: CGPoint(x: 0.25 * imageWidth, y: 0.45 * imageHeight),
                                                       controlPoint: CGPoint(x: 0.16 * imageWidth, y: 0.48 * imageHeight))
                                
                                path.addQuadCurve(to: CGPoint(x: 0.25 * imageWidth, y: 0.45 * imageHeight),
                                                  controlPoint: CGPoint(x: 0.17 * imageWidth, y: 0.48 * imageHeight))
                                
                                path.move(to: CGPoint(x: 0.25 * imageWidth, y: 0.45 * imageHeight))
                                path.addQuadCurve(to: CGPoint(x: coord.x, y: coord.y + 10),
                                                  controlPoint: CGPoint(x: coord.x - 5, y: 0.45 * imageHeight))
                            }
                            if cabGo == "3-15" || cab == "3-15" {
                                greenPath.addQuadCurve(to: CGPoint(x: 0.25 * imageWidth, y: 0.45 * imageHeight),
                                                       controlPoint: CGPoint(x: 0.16 * imageWidth, y: 0.48 * imageHeight))
                                
                                path.addQuadCurve(to: CGPoint(x: 0.25 * imageWidth, y: 0.45 * imageHeight),
                                                  controlPoint: CGPoint(x: 0.17 * imageWidth, y: 0.48 * imageHeight))
                                
                                path.move(to: CGPoint(x: 0.25 * imageWidth, y: 0.45 * imageHeight))
                                path.addQuadCurve(to: CGPoint(x: coord.x, y: coord.y + 10),
                                                  controlPoint: CGPoint(x: coord.x - 5, y: 0.45 * imageHeight))
                            }
                        }
                        
                        if (cabGo == "3-4" || cabGo == "3-2") ||
                            (cab == "3-4" || cab == "3-2") {
                            
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
                        
                        
                        if (cabGo == "3-16" || cabGo == "3-18" || cabGo == "3-20" || cabGo == "3-14") ||
                            (cab == "3-16" || cab == "3-18" || cab == "3-20" || cab == "3-14") {
                            
                            greenPath.addQuadCurve(to: CGPoint(x: 0.18 * imageWidth, y: 0.6 * imageHeight),
                                                   controlPoint: CGPoint(x: 0.14 * imageWidth, y: 0.6 * imageHeight))
                            
                            path.addQuadCurve(to: CGPoint(x: 0.25 * imageWidth, y: 0.5 * imageHeight),
                                              controlPoint: CGPoint(x: 0.17 * imageWidth, y: 0.52 * imageHeight))
                            path.move(to: CGPoint(x: 0.25 * imageWidth, y: 0.5 * imageHeight))
                            
                            path.addQuadCurve(to: CGPoint(x: 0.36 * imageWidth, y: 0.7 * imageHeight),
                                              controlPoint: CGPoint(x: 0.36 * imageWidth, y: 0.5 * imageHeight))
                            
                            path.move(to: CGPoint(x: 0.36 * imageWidth, y: 0.7 * imageHeight))
                            
                            if cabGo == "3-14" || cab == "3-14" {
                                path.addQuadCurve(to: CGPoint(x: 0.38 * imageWidth, y: 0.78 * imageHeight),
                                                  controlPoint: CGPoint(x: 0.36 * imageWidth, y: 0.77 * imageHeight))
                                path.move(to: CGPoint(x: 0.38 * imageWidth, y: 0.78 * imageHeight))
                                path.addQuadCurve(to: CGPoint(x: coord.x, y: coord.y + 15),
                                                  controlPoint: CGPoint(x: coord.x, y: 0.77 * imageHeight))
                            }
                            if cabGo == "3-16" || cab == "3-16" {
                                path.addLine(to: CGPoint(x: 0.36 * imageWidth, y: coord.y - 5))
                            }
                            if (cabGo == "3-18" || cab == "3-18") || (cabGo == "3-20" || cab == "3-20") {
                                path.addQuadCurve(to: CGPoint(x: 0.38 * imageWidth, y: 0.78 * imageHeight),
                                                  controlPoint: CGPoint(x: 0.36 * imageWidth, y: 0.77 * imageHeight))
                                path.move(to: CGPoint(x: 0.38 * imageWidth, y: 0.78 * imageHeight))
                                path.addQuadCurve(to: CGPoint(x: coord.x, y: coord.y - 5),
                                                  controlPoint: CGPoint(x: coord.x, y: 0.77 * imageHeight))
                            }
                            
                            
                            
                            
                        }
                        
                        if (cabGo == "3-22" || cabGo == "3-24" || cabGo == "3-26" || cabGo == "3-30" || cabGo == "3-32" || cabGo == "3-32A" || cabGo == "3-27") ||
                            (cab == "3-22" || cab == "3-24" || cab == "3-26" || cab == "3-30" || cab == "3-32" || cab == "3-32A" || cab == "3-27") {
                            greenPath.addQuadCurve(to: CGPoint(x: 0.18 * imageWidth, y: 0.6 * imageHeight),
                                                   controlPoint: CGPoint(x: 0.14 * imageWidth, y: 0.6 * imageHeight))
                            
                            path.addQuadCurve(to: CGPoint(x: 0.25 * imageWidth, y: 0.5 * imageHeight),
                                              controlPoint: CGPoint(x: 0.17 * imageWidth, y: 0.51 * imageHeight))
                            path.move(to: CGPoint(x: 0.25 * imageWidth, y: 0.5 * imageHeight))
                            
                            path.addQuadCurve(to: CGPoint(x: 0.7 * imageWidth, y: 0.65 * imageHeight),
                                              controlPoint: CGPoint(x: 0.65 * imageWidth, y: 0.5 * imageHeight))
                            
                            path.move(to: CGPoint(x: 0.7 * imageWidth, y: 0.65 * imageHeight))
                            
                            if (cabGo == "3-22" || cabGo == "3-24" || cabGo == "3-26") ||
                                (cab == "3-22" || cab == "3-24" || cab == "3-26") {
                                path.addCurve(to: CGPoint(x: coord.x, y: coord.y - 5),
                                              controlPoint1: CGPoint(x: 0.72 * imageWidth, y: 0.75 * imageHeight),
                                              controlPoint2: CGPoint(x: coord.x, y: 0.75 * imageHeight))
                            }
                            
                            if (cabGo == "3-30" || cabGo == "3-32" || cabGo == "3-32A") ||
                            (cab == "3-30" || cab == "3-32" || cab == "3-32A") {
                                path.addQuadCurve(to: CGPoint(x: 0.85 * imageWidth, y: 0.75 * imageHeight),
                                                  controlPoint: CGPoint(x: 0.75 * imageWidth, y: 0.75 * imageHeight))
                                
                                path.move(to: CGPoint(x: 0.85 * imageWidth, y: 0.75 * imageHeight))
                                if cabGo == "3-30" || cab == "3-30" {
                                    path.addLine(to: CGPoint(x: coord.x - 7, y: 0.75 * imageHeight))
                                }
                                if (cabGo == "3-32" || cabGo == "3-32A") || (cab == "3-32" || cab == "3-32A") {
                                    path.addCurve(to: CGPoint(x: coord.x - 7, y: coord.y),
                                                  controlPoint1: CGPoint(x: 0.95 * imageWidth, y: 0.75 * imageHeight),
                                                  controlPoint2: CGPoint(x: coord.x - 20, y: coord.y ))
                                    
                                }
                                
                            }
                            if cabGo == "3-27" || cab == "3-27" {
                                path.addQuadCurve(to: CGPoint(x: coord.x, y: coord.y + 15),
                                                  controlPoint: CGPoint(x: 0.73 * imageWidth, y: 0.4 * imageWidth))
                                
                            }
                            
                        }
                        
                        
                        addLine(greenPath: greenPath, imageView: imageView, path: path)
                        
                    }
                }
            }
            
        }
        
        
    
    
    //MARK: 4й этаж
        if (corpGo == "12" && numbImage == 2 && etazGo == 4) || (corp == "12" && etaz == 4 && isOnlyVhod == 0 && numbImage == 1 ) {
            
            but1.isEnabled = true
            but1.backgroundColor = UIColor(red: 0.9608, green: 0.8706, blue: 0.702, alpha: 1.0)
            but2.isEnabled = false
            but2.backgroundColor = .systemGray5
            
            
            if corp == "12" && etaz == 4 && isOnlyVhod == 0  {
                but1.isEnabled = false
                but1.backgroundColor = .systemGray5
                but2.isEnabled = true
                but2.backgroundColor = UIColor(red: 0.9608, green: 0.8706, blue: 0.702, alpha: 1.0)
                numbImage = 1
            }
            
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
                        
                        if (cabGo == "4-4" || cabGo == "4-10" || cabGo == "4-12" || cabGo == "4-14" || cabGo == "4-6" || cabGo == "4-20" || cabGo == "4-18" || cabGo == "4-23" || cabGo == "4-8") ||
                            (cab == "4-4" || cab == "4-10" || cab == "4-12" || cab == "4-14" || cab == "4-6" || cab == "4-20" || cab == "4-18" || cab == "4-23" || cab == "4-8") {
                            
                            if cabGo == "4-4"  || cab == "4-4"  {
                                path.addQuadCurve(to: CGPoint(x: coord.x, y: coord.y - 5),
                                                  controlPoint: CGPoint(x: coord.x + 5, y: 0.62 * imageHeight))
                            }
                            if cabGo == "4-10" || cab == "4-10" {
                                path.addQuadCurve(to: CGPoint(x: coord.x + 20, y: coord.y - 5),
                                                  controlPoint: CGPoint(x: coord.x + 5, y: 0.62 * imageHeight))
                            }
                            
                            if cabGo == "4-12" || cab == "4-12" {
                                path.addQuadCurve(to: CGPoint(x: coord.x, y: coord.y - 10),
                                                  controlPoint: CGPoint(x: coord.x + 5, y: 0.62 * imageHeight))
                            }
                            
                            if cabGo == "4-14" || cab == "4-14" {
                                path.addQuadCurve(to: CGPoint(x: coord.x, y: coord.y - 27),
                                                  controlPoint: CGPoint(x: coord.x + 5, y: 0.62 * imageHeight))
                            }
                            if cabGo == "4-6" || cab == "4-6" {
                                path.addQuadCurve(to: CGPoint(x: coord.x, y: coord.y - 17),
                                                  controlPoint: CGPoint(x: coord.x + 5, y: 0.62 * imageHeight))
                            }
                            if cabGo == "4-20" || cab == "4-20" {
                                path.addQuadCurve(to: CGPoint(x: coord.x, y: coord.y - 5),
                                                  controlPoint: CGPoint(x: coord.x + 5 , y: 0.5 * imageHeight))
                            }
                            if cabGo == "4-18" || cab == "4-18" {
                                path.addQuadCurve(to: CGPoint(x: coord.x + 10, y: coord.y - 5),
                                                  controlPoint: CGPoint(x: coord.x + 35 , y: 0.5 * imageHeight))
                            }
                            if cabGo == "4-23" || cab == "4-23" {
                                path.addQuadCurve(to: CGPoint(x: coord.x, y: coord.y + 28),
                                                  controlPoint: CGPoint(x: coord.x - 5, y: 0.62 * imageHeight))
                                
                            }
                            if cabGo == "4-8" || cab == "4-8" {
                                path.addQuadCurve(to: CGPoint(x: coord.x, y: coord.y - 10),
                                                  controlPoint: CGPoint(x: coord.x - 5, y: 0.62 * imageHeight))
                                
                            }
                        } else {
                            path.addQuadCurve(to: CGPoint(x: coord.x, y: coord.y + 10),
                                              controlPoint: CGPoint(x: coord.x - 5, y: 0.62 * imageHeight))
                        }
                        
                        addLine(greenPath: greenPath, imageView: imageView, path: path)
                        
                    }
                }
            }
            
        }
        
        
        
    //MARK: 5й этаж
        if (corpGo == "12" && numbImage == 2 && etazGo == 5) || (corp == "12" && etaz == 5 && isOnlyVhod == 0 && numbImage == 1 ) {
            
            but1.isEnabled = true
            but1.backgroundColor = UIColor(red: 0.9608, green: 0.8706, blue: 0.702, alpha: 1.0)
            but2.isEnabled = false
            but2.backgroundColor = .systemGray5
            
            
            if corp == "12" && etaz == 5 && isOnlyVhod == 0  {
                but1.isEnabled = false
                but1.backgroundColor = .systemGray5
                but2.isEnabled = true
                but2.backgroundColor = UIColor(red: 0.9608, green: 0.8706, blue: 0.702, alpha: 1.0)
                numbImage = 1
            }
            
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
                        
                        if cabGo == "5-3" || cab == "5-3" {
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
                        
                        
                        
                        if (cabGo == "5-6" || cabGo == "5-8" || cabGo == "5-20") ||
                            (cab == "5-6" || cab == "5-8" || cab == "5-20") {
                            if cabGo == "5-6" || cab == "5-6" {
                                path.addQuadCurve(to: CGPoint(x: coord.x + 20, y: coord.y - 7),
                                                  controlPoint: CGPoint(x: coord.x + 8 , y: 0.5 * imageHeight))
                            }
                            if cabGo == "5-8" || cab == "5-8" {
                                path.addQuadCurve(to: CGPoint(x: coord.x - 10, y: coord.y - 7),
                                                  controlPoint: CGPoint(x: coord.x - 15, y: 0.62 * imageHeight))
                            }
                            
                            if cabGo == "5-20" || cab == "5-20" {
                                path.addQuadCurve(to: CGPoint(x: coord.x, y: coord.y - 13),
                                                  controlPoint: CGPoint(x: coord.x + 5 , y: 0.5 * imageHeight))
                            }
                            
                            
                        } else {
                            if (cabGo == "5-14" || cabGo == "5-18") || (cab == "5-14" || cab == "5-18") {
                                path.addQuadCurve(to: CGPoint(x: coord.x, y: coord.y - 16),
                                                  controlPoint: CGPoint(x: coord.x - 5, y: 0.62 * imageHeight))
                            }
                            if (cabGo == "5-5" || cabGo == "5-7" || cabGo == "5-9" || cabGo == "5-11" || cabGo == "5-13") ||
                               (cab == "5-5" || cab == "5-7" || cab == "5-9" || cab == "5-11" || cab == "5-13") {
                                path.addQuadCurve(to: CGPoint(x: coord.x, y: coord.y + 10),
                                                  controlPoint: CGPoint(x: coord.x - 5, y: 0.62 * imageHeight))
                            }
                           
                        }
                        
                        
                        
                        
                        addLine(greenPath: greenPath, imageView: imageView, path: path)
                        
                    }
                }
            }
            
        }
        
    
    
    //MARK: 6й этаж
        if (corpGo == "12" && numbImage == 2 && etazGo == 6) || (corp == "12" && etaz == 6 && isOnlyVhod == 0 && numbImage == 1 ) {
            
            but1.isEnabled = true
            but1.backgroundColor = UIColor(red: 0.9608, green: 0.8706, blue: 0.702, alpha: 1.0)
            but2.isEnabled = false
            but2.backgroundColor = .systemGray5
            
            
            if corp == "12" && etaz == 6 && isOnlyVhod == 0  {
                but1.isEnabled = false
                but1.backgroundColor = .systemGray5
                but2.isEnabled = true
                but2.backgroundColor = UIColor(red: 0.9608, green: 0.8706, blue: 0.702, alpha: 1.0)
                numbImage = 1
            }
            
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
                        
                        if (cabGo == "6-1" || cabGo == "6-3") || (cab == "6-1" || cab == "6-3") {
                            path.addQuadCurve(to: CGPoint(x: coord.x, y: coord.y + 12),
                                              controlPoint: CGPoint(x: 0.13 * imageWidth, y: 0.62 * imageHeight))
                            if cabGo == "6-3" || cab == "6-3" {
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
                        
                        if (cabGo == "6-5" || cabGo == "6-7" || cabGo == "6-11" || cabGo == "6-13" || cabGo == "6-15") ||
                            (cab == "6-5" || cab == "6-7" || cab == "6-11" || cab == "6-13" || cab == "6-15") {
                            path.addQuadCurve(to: CGPoint(x: coord.x, y: coord.y + 14),
                                              controlPoint: CGPoint(x: coord.x - 5, y: 0.62 * imageHeight))
                        } 
                        if (cabGo == "6-4" || cabGo == "6-6" || cabGo == "6-8" || cabGo == "6-12" || cabGo == "6-10" || cabGo == "6-16") ||
                            (cab == "6-4" || cab == "6-6" || cab == "6-8" || cab == "6-12" || cab == "6-10" || cab == "6-16") {
                            if cabGo == "6-4" || cab == "6-4" {
                                path.addQuadCurve(to: CGPoint(x: coord.x, y: coord.y - 7),
                                                  controlPoint: CGPoint(x: coord.x + 8 , y: 0.5 * imageHeight))
                            }
                            if cabGo == "6-8" || cab == "6-8"  {
                                path.addQuadCurve(to: CGPoint(x: coord.x, y: coord.y - 13),
                                                  controlPoint: CGPoint(x: coord.x + 5, y: 0.62 * imageHeight))
                            }
                            if cabGo == "6-6" || cab == "6-6"  {
                                path.addQuadCurve(to: CGPoint(x: coord.x, y: coord.y - 33),
                                                  controlPoint: CGPoint(x: coord.x + 5, y: 0.62 * imageHeight))
                            }
                            
                            if cabGo == "6-12" || cab == "6-12"  {
                                path.addQuadCurve(to: CGPoint(x: coord.x, y: coord.y - 13),
                                                  controlPoint: CGPoint(x: coord.x + 5, y: 0.5 * imageHeight))
                            }
                            if cabGo == "6-10" || cab == "6-10"  {
                                path.addQuadCurve(to: CGPoint(x: coord.x, y: coord.y - 33),
                                                  controlPoint: CGPoint(x: coord.x + 5, y: 0.5 * imageHeight))
                            }
                            
                            if cabGo == "6-16" || cab == "6-16"  {
                                path.addQuadCurve(to: CGPoint(x: coord.x + 17, y: coord.y - 12),
                                                  controlPoint: CGPoint(x: coord.x + 30, y: 0.5 * imageHeight))
                            }
                        }
                        
                        
                        
                        
                        addLine(greenPath: greenPath, imageView: imageView, path: path)
                        
                    }
                }
            }
            
        }
        
        
    //MARK: 7й этаж
        if (corpGo == "12" && numbImage == 2 && etazGo == 7) || (corp == "12" && etaz == 7 && isOnlyVhod == 0 && numbImage == 1 ) {
            
            but1.isEnabled = true
            but1.backgroundColor = UIColor(red: 0.9608, green: 0.8706, blue: 0.702, alpha: 1.0)
            but2.isEnabled = false
            but2.backgroundColor = .systemGray5
            
            
            if corp == "12" && etaz == 7 && isOnlyVhod == 0  {
                but1.isEnabled = false
                but1.backgroundColor = .systemGray5
                but2.isEnabled = true
                but2.backgroundColor = UIColor(red: 0.9608, green: 0.8706, blue: 0.702, alpha: 1.0)
                numbImage = 1
            }
            
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
                        
                        
                        if cabGo == "7-3" || cab == "7-3" {
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
                        
                        if (cabGo == "7-5" || cabGo == "7-9" || cabGo == "7-11" || cabGo == "7-15" || cabGo == "7-17" || cabGo == "7-13") ||
                            (cab == "7-5" || cab == "7-9" || cab == "7-11" || cab == "7-15" || cab == "7-17" || cab == "7-13") {
                            
                            path.addQuadCurve(to: CGPoint(x: coord.x, y: coord.y + 14),
                                              controlPoint: CGPoint(x: coord.x - 5, y: 0.62 * imageHeight))
                        }
                        if (cabGo == "7-4" || cabGo == "7-6" || cabGo == "7-8" || cabGo == "7-14") ||
                            (cab == "7-4" || cab == "7-6" || cab == "7-8" || cab == "7-14") {
                            path.addQuadCurve(to: CGPoint(x: coord.x, y: coord.y - 28),
                                              controlPoint: CGPoint(x: coord.x + 5, y: 0.5 * imageHeight))
                        }
                        if (cabGo == "7-10" || cabGo == "7-12") || (cab == "7-10" || cab == "7-12")  {
                            if cabGo == "7-12" || cab == "7-12" {
                                path.addQuadCurve(to: CGPoint(x: coord.x, y: coord.y - 30),
                                                  controlPoint: CGPoint(x: coord.x + 5, y: 0.5 * imageHeight))
                            }
                            if cabGo == "7-10" || cab == "7-10" {
                                path.addQuadCurve(to: CGPoint(x: coord.x, y: coord.y - 15),
                                                  controlPoint: CGPoint(x: coord.x + 5, y: 0.5 * imageHeight))
                            }
                        }
                        
                        if cabGo == "7-16" || cab == "7-16" {
                            path.addQuadCurve(to: CGPoint(x: coord.x, y: coord.y - 10),
                                              controlPoint: CGPoint(x: coord.x + 15, y: 0.4 * imageHeight))
                        }
                        
                        addLine(greenPath: greenPath, imageView: imageView, path: path)
                        
                    }
                }
            }
            
        }
        
        
    
        //MARK: 8й этаж
        if (corpGo == "12" && numbImage == 2 && etazGo == 8) || (corp == "12" && etaz == 8 && isOnlyVhod == 0 && numbImage == 1 ) {
            
            but1.isEnabled = true
            but1.backgroundColor = UIColor(red: 0.9608, green: 0.8706, blue: 0.702, alpha: 1.0)
            but2.isEnabled = false
            but2.backgroundColor = .systemGray5
            
            
            if corp == "12" && etaz == 8 && isOnlyVhod == 0  {
                but1.isEnabled = false
                but1.backgroundColor = .systemGray5
                but2.isEnabled = true
                but2.backgroundColor = UIColor(red: 0.9608, green: 0.8706, blue: 0.702, alpha: 1.0)
                numbImage = 1
            }
            
            imageView.image = nil
            imageView.image = UIImage(named: "12corp8")
            
            DispatchQueue.global().async {
                
                if let coord = recognizeDigits(imageView: imageView, path: path) {
                    DispatchQueue.main.async {
                        
                                                
                        
                        
                        path.addArc(withCenter: CGPoint(x: 0.13 * imageWidth, y: 0.9 * imageHeight), radius: 5, startAngle: 0, endAngle: CGFloat(2 * Double.pi), clockwise: true)
                        path.move(to: CGPoint(x: 0.13 * imageWidth, y: 0.87 * imageHeight))
                        path.addLine(to: CGPoint(x: 0.13 * imageWidth, y: 0.8 * imageHeight))
                        path.move(to: CGPoint(x: 0.13 * imageWidth, y: 0.8 * imageHeight))
                        
                        greenPath.move(to: CGPoint(x: 0.13 * imageWidth, y: 0.34 * imageHeight))
                        
                        
                        if cabGo == "8-3" || cab == "8-3" {
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
                        
                        if (cabGo == "8-5" || cabGo == "8-7" || cabGo == "8-9" || cabGo == "8-11" || cabGo == "8-13" || cabGo == "8-15" || cabGo == "8-17") ||
                            (cab == "8-5" || cab == "8-7" || cab == "8-9" || cab == "8-11" || cab == "8-13" || cab == "8-15" || cab == "8-17") {
                            path.addQuadCurve(to: CGPoint(x: coord.x, y: coord.y + 14),
                                              controlPoint: CGPoint(x: coord.x - 5, y: 0.62 * imageHeight))
                        }
                        if (cabGo == "8-6" || cabGo == "8-4" || cabGo == "8-8" || cabGo == "8-12" || cabGo == "8-14" || cabGo == "8-16" || cabGo == "8-10" ) ||
                            (cab == "8-6" || cab == "8-4" || cab == "8-8" || cab == "8-12" || cab == "8-14" || cab == "8-16" || cab == "8-10")  {
                            if cabGo == "8-4" || cab == "8-4" {
                                path.addQuadCurve(to: CGPoint(x: coord.x - 10, y: coord.y - 7),
                                                  controlPoint: CGPoint(x: coord.x - 5, y: 0.62 * imageHeight))
                            }
                            if cabGo == "8-6" || cab == "8-6" {
                                path.addQuadCurve(to: CGPoint(x: coord.x , y: coord.y - 3),
                                                  controlPoint: CGPoint(x: coord.x - 5, y: 0.62 * imageHeight))
                            }
                            if (cabGo == "8-8" || cabGo == "8-10" || cabGo == "8-12" || cabGo == "8-14") || (cab == "8-8" || cab == "8-10" || cab == "8-12" || cab == "8-14") {
                                path.addQuadCurve(to: CGPoint(x: coord.x , y: coord.y - 27),
                                                  controlPoint: CGPoint(x: coord.x - 5, y: 0.5 * imageHeight))
                            }
                            if cabGo == "8-16" || cab == "8-16" {
                                path.addQuadCurve(to: CGPoint(x: coord.x, y: coord.y - 10),
                                                  controlPoint: CGPoint(x: coord.x + 15, y: 0.4 * imageHeight))
                            }
                        }
                        
                        
                        addLine(greenPath: greenPath, imageView: imageView, path: path)
                        
                    }
                }
            }
            
        }
        
    
        //MARK: 9й этаж
        if (corpGo == "12" && numbImage == 2 && etazGo == 9) || (corp == "12" && etaz == 9 && isOnlyVhod == 0 && numbImage == 1 ) {
            
            but1.isEnabled = true
            but1.backgroundColor = UIColor(red: 0.9608, green: 0.8706, blue: 0.702, alpha: 1.0)
            but2.isEnabled = false
            but2.backgroundColor = .systemGray5
            
            
            if corp == "12" && etaz == 9 && isOnlyVhod == 0  {
                but1.isEnabled = false
                but1.backgroundColor = .systemGray5
                but2.isEnabled = true
                but2.backgroundColor = UIColor(red: 0.9608, green: 0.8706, blue: 0.702, alpha: 1.0)
                numbImage = 1
            }
            
            imageView.image = nil
            imageView.image = UIImage(named: "12corp9")
            
            DispatchQueue.global().async {
                
                if let coord = recognizeDigits(imageView: imageView, path: path) {
                    DispatchQueue.main.async {
                        
                                                
                        
                        
                        path.addArc(withCenter: CGPoint(x: 0.13 * imageWidth, y: 0.9 * imageHeight), radius: 5, startAngle: 0, endAngle: CGFloat(2 * Double.pi), clockwise: true)
                        path.move(to: CGPoint(x: 0.13 * imageWidth, y: 0.87 * imageHeight))
                        path.addLine(to: CGPoint(x: 0.13 * imageWidth, y: 0.8 * imageHeight))
                        path.move(to: CGPoint(x: 0.13 * imageWidth, y: 0.8 * imageHeight))
                        
                        greenPath.move(to: CGPoint(x: 0.13 * imageWidth, y: 0.34 * imageHeight))
                        
                        
                        if cabGo == "9-3" || cab == "9-3" {
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
                        
                        if (cabGo == "9-5" || cabGo == "9-7" || cabGo == "9-9" || cabGo == "9-11" || cabGo == "9-13" || cabGo == "9-15") || (cab == "9-5" || cab == "9-7" || cab == "9-9" || cab == "9-11" || cab == "9-13" || cab == "9-15") {
                            path.addQuadCurve(to: CGPoint(x: coord.x, y: coord.y + 14),
                                              controlPoint: CGPoint(x: coord.x - 5, y: 0.62 * imageHeight))
                        }
                        
                        if (cabGo == "9-45" || cabGo == "9-44" || cabGo == "9-43" || cabGo == "9-42" || cabGo == "9-41" || cabGo == "9-28" || cabGo == "9-6" || cabGo == "9-8" || cabGo == "9-12") || (cab == "9-45" || cab == "9-44" || cab == "9-43" || cab == "9-42" || cab == "9-41" || cab == "9-28" || cab == "9-6" || cab == "9-8" || cab == "9-12") {
                            
                            if (cabGo == "9-45" || cabGo == "9-41" || cabGo == "9-28" || cabGo == "9-6" || cabGo == "9-8") || (cab == "9-45" || cab == "9-41" || cab == "9-28" || cab == "9-6" || cab == "9-8") {
                                path.addQuadCurve(to: CGPoint(x: coord.x, y: coord.y - 30),
                                                  controlPoint: CGPoint(x: coord.x - 5, y: 0.5 * imageHeight))
                            }
                            if (cabGo == "9-44" || cabGo == "9-43" || cabGo == "9-42") || (cab == "9-44" || cab == "9-43" || cab == "9-42") {
                                path.addQuadCurve(to: CGPoint(x: coord.x, y: coord.y - 12),
                                                  controlPoint: CGPoint(x: coord.x - 5, y: 0.5 * imageHeight))
                            }
                            if cabGo == "9-12" || cab == "9-12" {
                                path.addQuadCurve(to: CGPoint(x: coord.x + 10, y: coord.y - 10),
                                                  controlPoint: CGPoint(x: coord.x - 5, y: 0.45 * imageHeight))
                            }
                            
                        }
                        
                        
                        
                        
                        addLine(greenPath: greenPath, imageView: imageView, path: path)
                        
                    }
                }
            }
            
        }
        
    
    //MARK: 10й этаж
    if (corpGo == "12" && numbImage == 2 && etazGo == 10) || (corp == "12" && etaz == 10 && isOnlyVhod == 0 && numbImage == 1 ) {
        
        but1.isEnabled = true
        but1.backgroundColor = UIColor(red: 0.9608, green: 0.8706, blue: 0.702, alpha: 1.0)
        but2.isEnabled = false
        but2.backgroundColor = .systemGray5
        
        
        //ЛОГИКА ДЛЯ 11 ЭТАЖА
        
        
        
        if corp == "12" && etaz == 10 && isOnlyVhod == 0  {
            but1.isEnabled = false
            but1.backgroundColor = .systemGray5
            but2.isEnabled = true
            but2.backgroundColor = UIColor(red: 0.9608, green: 0.8706, blue: 0.702, alpha: 1.0)
            numbImage = 1
        }
        
        imageView.image = nil
        imageView.image = UIImage(named: "12corp10")
        
        DispatchQueue.global().async {
            
            if let coord = recognizeDigits(imageView: imageView, path: path) {
                DispatchQueue.main.async {
                    
                    
                    
                    
                    path.addArc(withCenter: CGPoint(x: 0.13 * imageWidth, y: 0.9 * imageHeight), radius: 5, startAngle: 0, endAngle: CGFloat(2 * Double.pi), clockwise: true)
                    path.move(to: CGPoint(x: 0.13 * imageWidth, y: 0.87 * imageHeight))
                    path.addLine(to: CGPoint(x: 0.13 * imageWidth, y: 0.8 * imageHeight))
                    path.move(to: CGPoint(x: 0.13 * imageWidth, y: 0.8 * imageHeight))
                    
                    greenPath.move(to: CGPoint(x: 0.13 * imageWidth, y: 0.34 * imageHeight))
                    
                    path.addQuadCurve(to: CGPoint(x: 0.17 * imageWidth, y: 0.6 * imageHeight),
                                      controlPoint: CGPoint(x: 0.13 * imageWidth, y: 0.6 * imageHeight))
                    
                    
                    greenPath.addQuadCurve(to: CGPoint(x: 0.17 * imageWidth, y: 0.6 * imageHeight),
                                           controlPoint: CGPoint(x: 0.13 * imageWidth, y: 0.45 * imageHeight))
                    
                    
                    if cabGo == "10-14" || cab == "10-14" {
                        path.addQuadCurve(to: CGPoint(x: coord.x, y: coord.y - 7),
                                          controlPoint: CGPoint(x: coord.x, y: 0.6 * imageHeight))
                    }
                    if cabGo == "10-3" || cab == "10-3" {
                        path.addQuadCurve(to: CGPoint(x: coord.x, y: coord.y - 33),
                                          controlPoint: CGPoint(x: coord.x , y: 0.4 * imageHeight))
                    }

                    addLine(greenPath: greenPath, imageView: imageView, path: path)
                    
                }
            }
        }
        
    }
    
    

    
}





