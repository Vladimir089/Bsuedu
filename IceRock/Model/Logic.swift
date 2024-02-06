//
//  Logic.swift
//  IceRock
//
//  Created by Владимир on 20.01.2024.
//

import Foundation
import Vision
import UIKit

let allCab12Corp = ["2-2", "2-4", "2-6", "2-7", "2-8", "2-9", "2-10","2-10A", "2-10Б", "2-10B", "2-10Г", "2-11", "2-13", "2-17", "2-26", "3-1", "3-2", "3-3", "3-4", "3-5", "3-7", "3-9", "3-11", "3-13", "3-14", "3-15", "3-16", "3-18", "3-20", "3-22", "3-24", "3-26", "3-27", "3-30", "3-32", "3-32A", "4-4", "4-5", "4-6", "4-7", "4-8","4-9","4-10", "4-11", "4-12","4-13","4-14","4-15","4-18","4-20","4-23", "5-3", "5-5", "5-6", "5-7", "5-8", "5-9", "5-11", "5-13", "5-14", "5-18", "5-20", "6-1", "6-3", "6-4", "6-5", "6-6", "6-7", "6-8", "6-10", "6-11", "6-12", "6-13", "6-15", "6-16", "7-3", "7-4", "7-5", "7-6", "7-8", "7-9", "7-10", "7-11", "7-12", "7-13", "7-14", "7-15", "7-16", "7-17", "8-3", "8-4", "8-5", "8-6", "8-7", "8-8", "8-9", "8-10", "8-11", "8-12", "8-13", "8-14", "8-15", "8-16", "8-17", "9-3", "9-5", "9-6", "9-7", "9-8", "9-9", "9-11", "9-12", "9-13", "9-15", "9-28", "9-41", "9-42", "9-43", "9-44", "9-45", "10-3", "10-14", "11-1", "11-4", "11-9", "12-1", "12-2", "12-3","12-4"]

//var redLineCoordinates: [CGPoint] = []
//
//func drawRedLines(on imageView: UIImageView, path: UIBezierPath, image: UIImage) {
//    redLineCoordinates.removeAll()
//    guard let cgImage = image.cgImage else { return }
//
//    // Получаем размеры изображения
//    let imageWidth = CGFloat(cgImage.width)
//    let imageHeight = CGFloat(cgImage.height)
//
//    // Получаем размеры рамки imageView
//    let viewWidth = imageView.frame.size.width
//    let viewHeight = imageView.frame.size.height
//
//    // Рассчитываем соотношение между размерами imageView и изображения
//    let widthRatio = viewWidth / imageWidth
//    let heightRatio = viewHeight / imageHeight
//
//    let colorSpace = CGColorSpaceCreateDeviceRGB()
//    let bytesPerPixel = 4
//    let bytesPerRow = bytesPerPixel * Int(imageWidth)
//    let bitsPerComponent = 8
//    let pixels = UnsafeMutablePointer<UInt8>.allocate(capacity: Int(imageWidth) * Int(imageHeight) * bytesPerPixel)
//
//    let context = CGContext(data: pixels, width: Int(imageWidth), height: Int(imageHeight), bitsPerComponent: bitsPerComponent, bytesPerRow: bytesPerRow, space: colorSpace, bitmapInfo: CGImageAlphaInfo.premultipliedLast.rawValue | CGBitmapInfo.byteOrder32Big.rawValue)
//
//    context?.draw(cgImage, in: CGRect(x: 0, y: 0, width: Int(imageWidth), height: Int(imageHeight)))
//
//    for y in 0..<Int(imageHeight) {
//        for x in 0..<Int(imageWidth) {
//            let offset = (y * Int(imageWidth) + x) * bytesPerPixel
//            let red = pixels[offset]
//            let green = pixels[offset + 1]
//            let blue = pixels[offset + 2]
//
//            // Проверка, является ли пиксель цветом (235, 235, 235)
//            if red == 0 && green == 0 && blue == 0 {
//                // Пересчитываем координаты в координаты imageView
//                let point = CGPoint(x: CGFloat(x) * widthRatio, y: CGFloat(y) * heightRatio)
//                path.move(to: point)
//                path.addLine(to: CGPoint(x: point.x + widthRatio, y: point.y + heightRatio))
//                redLineCoordinates.append(point)
//            }
//        }
//    }
//
//    pixels.deallocate()
//
//    // Нарисовать красную линию
//    let shapeLayer = CAShapeLayer()
//    shapeLayer.path = path.cgPath
//    shapeLayer.strokeColor = UIColor.red.cgColor
//    shapeLayer.lineWidth = 2.0
//    imageView.layer.addSublayer(shapeLayer)
//}


//распознание кабинета
func recognizeDigits(imageView: UIImageView, path: UIBezierPath ) -> CGPoint? {
    
    var coordinates: CGPoint?
    let imageWidth = imageView.frame.size.width
    let imageHeight = imageView.frame.size.height
    
    guard let image = imageView.image else { return nil }
    
    let request = VNRecognizeTextRequest(completionHandler: { request, error in
        if let error = error {
            print("Error recognizing text: \(error.localizedDescription)")
            return
        }
        
        guard let observations = request.results as? [VNRecognizedTextObservation] else { return }
        
        for observation in observations {
            guard let topCandidate = observation.topCandidates(1).first else { continue }
            
            let recognizedText = topCandidate.string
            let boundingBox = observation.boundingBox
            
            
            
            let recognizedDigit = RecognizedDigit(digit: String(recognizedText) , boundingBox: boundingBox, coordinates: CGPoint(x: boundingBox.midX * imageWidth, y: (1.0 - boundingBox.midY) * imageHeight))

            print("Recognized digit: \(recognizedDigit.digit)")
            
            if recognizedDigit.digit == cabGo || recognizedDigit.digit == cab {

                print("Lines drawn for digit: \(recognizedDigit.digit)")
                
                
                coordinates = recognizedDigit.coordinates
                break
            }
            if recognizedDigit.digit == "2-105" && (cabGo == "2-10Б" || cab == "2-10Б" ) {
                coordinates = recognizedDigit.coordinates
                break
            }
        }
    })
    
    let handler = VNImageRequestHandler(cgImage: image.cgImage!, options: [:])
    
    do {
        try handler.perform([request])
    } catch {
        print("Error performing text recognition: \(error.localizedDescription)")
    }
    
    return coordinates
}




func addLine(greenPath: UIBezierPath, imageView: UIImageView, path: UIBezierPath) {
    
    shapeLayerGreen.removeFromSuperlayer()
       shapeLayer.removeFromSuperlayer()
    
    let animation = CABasicAnimation(keyPath: "strokeEnd")
    animation.fromValue = 0.0
    animation.toValue = 1.0
    animation.duration = 1.0 // Длительность анимации в секундах
    
    if numbImage == 1   { //от лифта
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

           let animationGreen = CABasicAnimation(keyPath: "strokeStart")
           animationGreen.fromValue = 1.0 //  начальное значение как 1 (конец линии)
           animationGreen.toValue = 0.0 //  конечное значение как 0 (начало линии)
           animationGreen.duration = 1.0 //  длительность анимации
           shapeLayerGreen.add(animationGreen, forKey: "drawLineAnimationGreen")

           let animation = CABasicAnimation(keyPath: "strokeStart")
           animation.fromValue = 1.0
           animation.toValue = 0.0
           animation.duration = 1.0
           shapeLayer.add(animation, forKey: "drawLineAnimation")
    } else { //от кабинета
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



struct RecognizedDigit {
    var digit: String
    var boundingBox: CGRect
    var coordinates: CGPoint
}



