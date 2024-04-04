//
//  DeviceDetailsVC.swift
//  MagneticDetection
//
//  Created by Олексій Гаєвський on 04.04.2024.
//

import UIKit

class DeviceDetailsVC: UIViewController {
    let cameraWidget = CameraWidget()
    let backgroundImage = BackgroundImage(imageName: "mainImage")
    let wifiImage = UIImage(named: "correctImage")
    var isError: Bool = false
    override func viewDidLoad() {
        super.viewDidLoad()
        configureBackGroundImage(backgroundImage: backgroundImage)
        configureCameraWidget()
        configureLogoImage(backgroundImage: backgroundImage, imageName: isError ? "failedImage" : "correctImage", height: 130, width: 130)
    }
    


    
    private func configureCameraWidget(){
        view.addSubview(cameraWidget)
        cameraWidget.cameraTitle.textColor = isError ? UIColor.red : Constants.buttonColor
        NSLayoutConstraint.activate([
            cameraWidget.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            cameraWidget.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            cameraWidget.heightAnchor.constraint(equalToConstant: 300),
            cameraWidget.widthAnchor.constraint(equalToConstant: 350)
        ])
    }

}
