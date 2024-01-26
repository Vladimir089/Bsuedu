//
//  Logic.swift
//  IceRock
//
//  Created by Владимир on 20.01.2024.
//

import Foundation
import Vision
import UIKit



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
            
            if recognizedDigit.digit == cabGo {

                print("Lines drawn for digit: \(recognizedDigit.digit)")
                
                
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








struct RecognizedDigit {
    var digit: String
    var boundingBox: CGRect
    var coordinates: CGPoint
}



