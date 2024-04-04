//
//  ViewController+ext.swift
//  MagneticDetection
//
//  Created by Олексій Гаєвський on 04.04.2024.
//

import Foundation
import UIKit

extension UIViewController {
    func configureBackGroundImage(backgroundImage: BackgroundImage) {
       backgroundImage.frame = CGRect(x: 0, y: 0, width: view.bounds.width, height: 300)
       
       let gradientLayer = CAGradientLayer()
       gradientLayer.frame = backgroundImage.bounds
       gradientLayer.colors = [
           UIColor.black.cgColor,
           UIColor.clear.cgColor,
           UIColor.black.cgColor
       ]
       gradientLayer.locations = [0.0, 0.5, 1.0]
       
       backgroundImage.layer.addSublayer(gradientLayer)
       view.addSubview(backgroundImage)
       
       NSLayoutConstraint.activate([
           backgroundImage.topAnchor.constraint(equalTo: view.topAnchor),
           backgroundImage.leadingAnchor.constraint(equalTo: view.leadingAnchor),
           backgroundImage.trailingAnchor.constraint(equalTo: view.trailingAnchor),
           backgroundImage.heightAnchor.constraint(equalToConstant: 300)
       ])
   }
    
    
    func configureLogoImage(backgroundImage: BackgroundImage, imageName: String, height: CGFloat, width: CGFloat) {
        let logoImage = UIImageView()
        logoImage.image = UIImage(named: imageName)
        logoImage.contentMode = .scaleAspectFit
        logoImage.clipsToBounds = true
        logoImage.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(logoImage)
        NSLayoutConstraint.activate([
            logoImage.centerXAnchor.constraint(equalTo: backgroundImage.centerXAnchor),
            logoImage.centerYAnchor.constraint(equalTo: backgroundImage.centerYAnchor, constant: 30),
            logoImage.heightAnchor.constraint(equalToConstant: height),
            logoImage.widthAnchor.constraint(equalToConstant: width)
        ])
    }
    
   func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let defaultOffset = view.safeAreaInsets.top
        let offset = scrollView.contentOffset.y + defaultOffset
        navigationController?.navigationBar.transform = .init(translationX: 0, y: -offset)
    }
}
