//
//  MagneticDetectionVC.swift
//  MagneticDetection
//
//  Created by Олексій Гаєвський on 01.04.2024.
//

import UIKit
let buttonColor: UIColor = UIColor(red: 109/255, green: 89/255, blue: 211/255, alpha: 1)
var isButtonTapped: Bool = false

class MagneticDetectionVC: UIViewController {
    let SearchLable = UILabel()
    let mdButton = MDButton(backgroundColor: buttonColor, title: "Search")
    let elipse = Elipse()
    let rainbowElipse = Elipse()
    let grayElipse = Elipse()
    let pointer = Pointer()
    let backgroundImage = BackgroundImage()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        setupUI()
        self.navigationItem.title = "Magnetic Detection"
    }

    
    private func setupUI() {
            configureBackGroundImage()
            configureButton()
            configureLabel()
            configurePurpleElipse()
            configureRainbowElipse()
            configurePointer()
            configureLogoImage()
        }
    
    
    func configureLogoImage() {
        let image = UIImageView()
        image.image = UIImage(named: "logo")
        image.contentMode = .scaleAspectFit
        image.clipsToBounds = true
        image.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(image)
        NSLayoutConstraint.activate([
            image.centerXAnchor.constraint(equalTo: backgroundImage.centerXAnchor),
            image.centerYAnchor.constraint(equalTo: backgroundImage.centerYAnchor),
            image.heightAnchor.constraint(equalToConstant: 300),
            image.widthAnchor.constraint(equalToConstant: 300)
        ])
    }
    
    func configureBackGroundImage() {
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

    func configurePointer() {
        pointer.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(pointer)
        NSLayoutConstraint.activate([
            pointer.bottomAnchor.constraint(equalTo: SearchLable.topAnchor, constant: -60),
            pointer.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            pointer.heightAnchor.constraint(equalToConstant: 100),
            pointer.widthAnchor.constraint(equalToConstant: 100)
        ])
    }
    
    func configureRainbowElipse() {
        rainbowElipse.gradientColors = [
            UIColor(red: 0, green: 1, blue: 0, alpha: 0.7).cgColor,
            UIColor(red: 1, green: 0.8, blue: 0, alpha: 0.7).cgColor,
            UIColor(red: 1, green: 0, blue: 0, alpha: 0.7).cgColor
        ]
        
        rainbowElipse.startPoint = CGPoint(x: 0, y: 0)
        rainbowElipse.endPoint = CGPoint(x: 1, y: 0)
        rainbowElipse.radius = 150
        rainbowElipse.lineWdth = 20
        view.addSubview(rainbowElipse)

        NSLayoutConstraint.activate([
            rainbowElipse.bottomAnchor.constraint(equalTo: elipse.topAnchor, constant: 290),
            rainbowElipse.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            rainbowElipse.heightAnchor.constraint(equalToConstant: 400),
            rainbowElipse.widthAnchor.constraint(equalToConstant: 400)
        ])
    }
    
    func configurePurpleElipse() {
        elipse.gradientColors = [
            UIColor(red: 110/255, green: 90/255, blue: 211/255, alpha: 1).cgColor,
            UIColor(red: 109/255, green: 89/255, blue: 211/255, alpha: 0).cgColor,
            UIColor.clear.cgColor

        ]
        elipse.startPoint = CGPoint(x: 0.5, y: 0)
        elipse.endPoint = CGPoint(x: 0.5, y: 1)
        elipse.radius = 80
        elipse.lineWdth = 10
        view.addSubview(elipse)
        NSLayoutConstraint.activate([
            elipse.bottomAnchor.constraint(equalTo: mdButton.topAnchor, constant: -100),
            elipse.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            elipse.heightAnchor.constraint(equalToConstant: 200),
            elipse.widthAnchor.constraint(equalToConstant: 200)
        ])
    }
    
    func configureLabel() {
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
    
    func configureButton() {
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


