//
//  NewDesignScroll.swift
//  IceRock
//
//  Created by Владимир on 07.02.2024.
//

import UIKit

class NewDesignScroll: UIScrollView, UIScrollViewDelegate {
    
    var imageView: UIImageView!
    var linesLayer: CAShapeLayer!
    var greenLinesLayer: CAShapeLayer!
    
    
    
    func createNav(but1: UIButton, but2: UIButton) {
        
        // let planImage = UIImage(named: "12corpHoll")
        var planImage = UIImage()
        
        
        imageView = UIImageView(image: planImage)
        imageView.contentMode = .scaleAspectFit
        
        removeAllSubviews()

        
        
        addSubview(imageView)
        showsHorizontalScrollIndicator = false
        showsVerticalScrollIndicator = false
       
        greenLinesLayer = CAShapeLayer()
        greenLinesLayer.fillColor = .none
        greenLinesLayer.strokeColor = UIColor(red: 188/255, green: 213/255, blue: 250/255, alpha: 1).cgColor
        greenLinesLayer.lineWidth = 2.0
        imageView.layer.addSublayer(greenLinesLayer)
        
        linesLayer = CAShapeLayer()
        linesLayer.fillColor = .none
        linesLayer.strokeColor = UIColor(red: 23/255, green: 88/255, blue: 226/255, alpha: 1).cgColor
        linesLayer.lineWidth = 2.0
        imageView.layer.addSublayer(linesLayer)
        
        
        
        
        
        isScrollEnabled = true
        contentSize = imageView.frame.size
        let imageViewHeight: CGFloat = 255
        let scrollViewHeight = frame.size.height
        let y = (scrollViewHeight - imageViewHeight) / 2.0
        
        imageView.frame = CGRect(x: 0, y: y, width: frame.size.width, height: 255)

        if cabGo == " " && corpGo == " " && etazGo == 0  {
            planImage = UIImage(systemName: "map" )!  
            imageView.image = planImage
            imageView.tintColor = UIColor(named: "topViewColor")

            print(imageView.frame.size)
            return
        }
        
        
        
        
        
        
        // Настройка масштабирования
        minimumZoomScale = 1.0 //менять на 2
        maximumZoomScale = 3.0
        zoomScale = 1.0 //менять на 2
        

        
        self.delegate = self
        adjustContentInset()
        drawLines(but1: but1, but2: but2)
        zoomScale = 1.0 //менять на 2
        
        
    }
    
    // MARK: - UIScrollViewDelegate
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return imageView
    }
    
    func drawLines(but1: UIButton, but2: UIButton) {
        let path = UIBezierPath()
        let greenPath = UIBezierPath()
        
        
        
        if vhod == "вход 12 корпус" && isOnlyVhod == 1 {
            twelverCorpus(path: path, greenPath: greenPath, imageView: imageView, numb: numbImage, but1: but1, but2: but2)
        }
        if corp == "12" && corpGo == "12" && isOnlyVhod == 0 {
            twelverCorpus(path: path, greenPath: greenPath, imageView: imageView, numb: numbImage, but1: but1, but2: but2)
        }
        
        
        linesLayer.path = path.cgPath
        let animation = CABasicAnimation(keyPath: "strokeEnd")
        animation.fromValue = 0.0
        animation.toValue = 1.0
        animation.duration = 1.0 // Длительность анимации в секундах
        linesLayer.lineJoin = .round
        linesLayer.lineCap = .round
        greenLinesLayer.lineJoin = .round
        greenLinesLayer.lineCap = .round
        linesLayer.add(animation, forKey: "drawLineAnimation")
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            self.greenLinesLayer.path = greenPath.cgPath
            self.greenLinesLayer.add(animation, forKey: "drawLineAnimation")
        }
        
    }
    
    func removeAllSubviews() {
        for subview in self.subviews {
            subview.removeFromSuperview()
        }
    }

    
    
    func scrollViewDidZoom(_ scrollView: UIScrollView) {
        adjustContentInset()
    }
    
    // MARK: - Private Methods
    
    private func adjustContentInset() {
        
        let imageViewHeight: CGFloat = 255
        let scrollViewHeight = frame.size.height
        let y = (scrollViewHeight - imageViewHeight) / 2.0
        
        let contentWidth = max(bounds.width, contentSize.width )
        let contentHeight = max(bounds.height, contentSize.height )
        
        let offsetX = max((contentWidth - bounds.width) * 0, 0)
        let offsetY = max((contentHeight + bounds.height) * 0.5, 0)
        
        contentInset = UIEdgeInsets(top: offsetY, left: offsetX, bottom: offsetY, right: offsetX)
    }
}
