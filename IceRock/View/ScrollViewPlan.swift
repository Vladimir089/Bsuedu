import UIKit

class ScrollViewPlan: UIScrollView, UIScrollViewDelegate {
    
    var imageView: UIImageView!
    var linesLayer: CAShapeLayer!
    var greenLinesLayer: CAShapeLayer!
    
    
    
    func createNav() {
        
        // let planImage = UIImage(named: "12corpHoll")
        
        let planImage = UIImage()
        imageView = UIImageView(image: planImage)
        imageView.contentMode = .scaleAspectFill
        addSubview(imageView)
        
        linesLayer = CAShapeLayer()
        linesLayer.strokeColor = UIColor.systemBlue.cgColor
        linesLayer.lineWidth = 2.0
        imageView.layer.addSublayer(linesLayer)
        
        greenLinesLayer = CAShapeLayer()
        greenLinesLayer.strokeColor = UIColor.green.cgColor
        greenLinesLayer.lineWidth = 2.0
        imageView.layer.addSublayer(greenLinesLayer)
        
        
        isScrollEnabled = true
        contentSize = imageView.frame.size
        imageView.frame = CGRect(x: 0, y: 0, width: frame.size.width, height: frame.size.height)
        
        // Настройка масштабирования
        minimumZoomScale = 1.0
        maximumZoomScale = 3.0
        zoomScale = 1.0
        
        
        self.delegate = self
        adjustContentInset()
        drawLines()
        zoomScale = 1.0
        
        
    }
    
    // MARK: - UIScrollViewDelegate
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return imageView
    }
    
    func drawLines() {
        let path = UIBezierPath()
        let greenPath = UIBezierPath()
        // Относительные координаты в процентах от размеров изображения
        let imageWidth = imageView.frame.size.width
        let imageHeight = imageView.frame.size.height
        
        
        if vhod == "вход 12 корпус" {
            twelverCorpus(path: path, greenPath: greenPath, imageView: imageView, numb: numbImage)
        }
        
        
        linesLayer.path = path.cgPath
        let animation = CABasicAnimation(keyPath: "strokeEnd")
        animation.fromValue = 0.0
        animation.toValue = 1.0
        animation.duration = 1.0 // Длительность анимации в секундах
        linesLayer.add(animation, forKey: "drawLineAnimation")
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            self.greenLinesLayer.path = greenPath.cgPath
            self.greenLinesLayer.add(animation, forKey: "drawLineAnimation")
        }
        
    }
    
    
    
    func scrollViewDidZoom(_ scrollView: UIScrollView) {
        adjustContentInset()
    }
    
    // MARK: - Private Methods
    
    private func adjustContentInset() {
        let contentWidth = max(bounds.width, contentSize.width * zoomScale)
        let contentHeight = max(bounds.height, contentSize.height * zoomScale)
        
        let offsetX = max((contentWidth - bounds.width) * 0, 0)
        let offsetY = max((contentHeight - bounds.height) * 0, 0)
        
        contentInset = UIEdgeInsets(top: offsetY, left: offsetX, bottom: offsetY, right: offsetX)
    }
}