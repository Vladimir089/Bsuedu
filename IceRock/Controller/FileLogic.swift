//
//  FileLogic.swift
//  IceRock
//
//  Created by Владимир on 13.01.2024.
//

import Foundation
import UIKit

extension MainMenuViewController {
    
    func createNav() {
        
        var scrollView = mainMenuView.scrollView!
        
        
        let planImage = UIImage(named: "12corpHoll")
        
        let imageView = UIImageView(image: planImage)
        imageView.contentMode = .scaleAspectFill
        
        
        scrollView.addSubview(imageView)
        scrollView.isScrollEnabled = true
        scrollView.contentSize = imageView.frame.size
        imageView.frame = CGRect(x: 0, y: 0, width: scrollView.frame.size.width, height: scrollView.frame.size.height)


        
    }
    
}

