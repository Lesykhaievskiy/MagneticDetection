//
//  DetectionSearchVC.swift
//  MagneticDetection
//
//  Created by Олексій Гаєвський on 03.04.2024.
//

import Lottie
import UIKit
class DetectionSearchVC: UIViewController {
    let animationView = LottieAnimationView()
    let stopButton = MDButton(backgroundColor: Constants.buttonColor, title: "Stop")
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        addAnimation()
        configureComponents()
        overrideUserInterfaceStyle = .dark

    }
    
    
    private let scanningLabel: UILabel = {
        let label = UILabel()
        label.text = "Scanning Your Wi-Fi"
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 15)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let wifiNameLabel: UILabel = {
        let label = UILabel()
        label.text = "TLind_246_lp"
        label.font = UIFont.systemFont(ofSize: 28, weight: .bold)
        label.textAlignment = .center
        label.textColor = Constants.buttonColor
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let foundDevices: UILabel = {
        let label = UILabel()
        label.text = "23 Devices Found..."
        label.font = UIFont.systemFont(ofSize: 32, weight: .bold)
        label.textAlignment = .center
        label.textColor = Constants.buttonColor
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    private func configureComponents() {
        view.addSubview(wifiNameLabel)
        view.addSubview(scanningLabel)
        view.addSubview(foundDevices)
        view.addSubview(stopButton)
        stopButton.addTarget(self, action: #selector(stopButtonTapped), for: .touchUpInside)
        NSLayoutConstraint.activate([
            wifiNameLabel.bottomAnchor.constraint(equalTo: animationView.topAnchor, constant: -50),
            wifiNameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            wifiNameLabel.heightAnchor.constraint(equalToConstant: 35),
            
            scanningLabel.bottomAnchor.constraint(equalTo: wifiNameLabel.topAnchor),
            scanningLabel.centerXAnchor.constraint(equalTo: wifiNameLabel.centerXAnchor),
            scanningLabel.heightAnchor.constraint(equalToConstant: 20),
            
            foundDevices.topAnchor.constraint(equalTo: animationView.bottomAnchor, constant: 20),
            foundDevices.centerXAnchor.constraint(equalTo: animationView.centerXAnchor),
            foundDevices.heightAnchor.constraint(equalToConstant: 35),
            
            stopButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            stopButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stopButton.heightAnchor.constraint(equalToConstant: 50),
            stopButton.widthAnchor.constraint(equalToConstant: 350)
        ])
        
    }
    
    @objc func stopButtonTapped() {
        navigationController?.popViewController(animated: true)
    }
    
    
    private func addAnimation() {
        let path = Bundle.main.path(forResource: "animation", ofType: "json")
        animationView.animation = LottieAnimation.filepath(path!)
        self.view.addSubview(animationView)
        animationView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            animationView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            animationView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            animationView.heightAnchor.constraint(equalToConstant: 350),
            animationView.widthAnchor.constraint(equalToConstant: 350)
        ])
        
        animationView.play { [weak self] (finished) in
            if finished {
                let resultVC = ResultVC()
                self?.navigationController?.pushViewController(resultVC, animated: true)
            }
        }
    }
}

