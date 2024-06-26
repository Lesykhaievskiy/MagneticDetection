//
//  UIImage+ext.swift
//  MagneticDetection
//
//  Created by Олексій Гаєвський on 03.04.2024.
//

import Foundation
import UIKit

extension UIImage {
    func resize(toWidth scaledToWidth: CGFloat) -> UIImage {
           let image = self
           let oldWidth = image.size.width
           let scaleFactor = scaledToWidth / oldWidth
           let newHeight = image.size.height * scaleFactor
           let newWidth = oldWidth * scaleFactor
           let scaledSize = CGSize(width:newWidth, height:newHeight)
           UIGraphicsBeginImageContextWithOptions(scaledSize, false, 0)
           image.draw(in: CGRect(x: 0, y: 0, width: scaledSize.width, height: scaledSize.height))
           let scaledImage = UIGraphicsGetImageFromCurrentImageContext()
           UIGraphicsEndImageContext()
        return scaledImage!
       }
}
