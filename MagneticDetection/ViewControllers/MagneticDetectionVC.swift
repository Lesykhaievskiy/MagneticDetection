//
//  MagneticDetectionVC.swift
//  MagneticDetection
//
//  Created by Олексій Гаєвський on 01.04.2024.
//

import UIKit

var isButtonTapped: Bool = false

class MagneticDetectionVC: UIViewController {
    let SearchLable = UILabel()
    let mdButton = MDButton(backgroundColor: Constants.buttonColor, title: "Search")
    let pointer = Pointer()
    let backgroundImage = BackgroundImage(imageName: "diogo-fagundes-JWPHnl1_OVI-unsplash")

    
    override func viewDidLoad() {
        super.viewDidLoad()
        overrideUserInterfaceStyle = .dark
        setupUI()
        self.navigationItem.title = "Magnetic Detection"
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Back", style: .plain, target: self, action: #selector(popVC))
    }
    
    @objc func popVC() {
        dismissViewController()
    }
    

    
    private func setupUI() {
            configureBackGroundImage()
            configureButton()
            configureLabel()
            configurePointer()
            configureLogoImage()
            configureScaleImage()
        }
    
    
    private  func configureScaleImage() {
        let scaleImage = UIImageView()
        scaleImage.image = UIImage(named: "Scale")
        scaleImage.contentMode = .scaleAspectFit
        scaleImage.clipsToBounds = true
        scaleImage.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(scaleImage)
        NSLayoutConstraint.activate([
            scaleImage.bottomAnchor.constraint(equalTo: pointer.bottomAnchor, constant: -20),
            scaleImage.centerXAnchor.constraint(equalTo: pointer.centerXAnchor),
            scaleImage.widthAnchor.constraint(equalToConstant: 300),
            scaleImage.heightAnchor.constraint(equalToConstant: 200)
        ])
    }
    
    
    private func configureLogoImage() {
        let logoImage = UIImageView()
        logoImage.image = UIImage(named: "logo")
        logoImage.contentMode = .scaleAspectFit
        logoImage.clipsToBounds = true
        logoImage.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(logoImage)
        NSLayoutConstraint.activate([
            logoImage.centerXAnchor.constraint(equalTo: backgroundImage.centerXAnchor),
            logoImage.centerYAnchor.constraint(equalTo: backgroundImage.centerYAnchor),
            logoImage.heightAnchor.constraint(equalToConstant: 300),
            logoImage.widthAnchor.constraint(equalToConstant: 300)
        ])
    }
    
    
    private func configureBackGroundImage() {
        backgroundImage.frame = CGRect(x: 0, y: 100, width: view.bounds.width, height: 250)
        
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
            backgroundImage.topAnchor.constraint(equalTo: view.topAnchor, constant: 30),
            backgroundImage.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundImage.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backgroundImage.heightAnchor.constraint(equalToConstant: 250)
        ])
    }
    

    private func configurePointer() {
        pointer.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(pointer)
        
        NSLayoutConstraint.activate([
            pointer.bottomAnchor.constraint(equalTo: SearchLable.topAnchor, constant: -60),
            pointer.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            pointer.heightAnchor.constraint(equalToConstant: 100),
            pointer.widthAnchor.constraint(equalToConstant: 100)
        ])
    }
    
    
    private func configureLabel() {
        SearchLable.text = "Search checking"
        SearchLable.textColor = .white
        SearchLable.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(SearchLable)
        
        NSLayoutConstraint.activate([
            SearchLable.bottomAnchor.constraint(equalTo: mdButton.topAnchor, constant: -80),
            SearchLable.heightAnchor.constraint(equalToConstant: 20),
            SearchLable.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
    }
    
    
    private func configureButton() {
        view.addSubview(mdButton)
        mdButton.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            mdButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -50),
            mdButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30),
            mdButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor,constant: -30),
            mdButton.heightAnchor.constraint(equalToConstant: 50)
        
        ])
    }
    
 
    
    @objc func buttonTapped() {
        isButtonTapped.toggle()
        SearchLable.text =  isButtonTapped ? "50 µT" : "Search checking"
        mdButton.setTitle(isButtonTapped ? "Stop" : "Search", for: .normal)
        UIView.animate(withDuration: 0.5) {
            self.pointer.transform = isButtonTapped ? self.pointer.transform.rotated(by: CGFloat.pi / 2) : self.pointer.transform.rotated(by: -CGFloat.pi / 2)
        }
    }

}


