//
//  WIFIWidget.swift
//  MagneticDetection
//
//  Created by Олексій Гаєвський on 03.04.2024.
//

import UIKit

class WIFIWidget: UIView {
    var button = MDButton(backgroundColor: Constants.buttonColor, title: "Scan current network")
    var wifiName: String = "Wi-Fi_Name"
    weak var parentViewController: UIViewController?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.translatesAutoresizingMaskIntoConstraints = false
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(wifiName: String) {
        super.init(frame: .zero)
        self.wifiName = wifiName
        configure()
        self.translatesAutoresizingMaskIntoConstraints = false

    }
    
    
    private var currLabel: UILabel = {
        let label = UILabel()
        label.text = "Current Wi-Fi"
        label.textAlignment = .center
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    private lazy var wifiNameLabel: UILabel = {
        let label = UILabel()
        label.text = wifiName
        label.font = UIFont.systemFont(ofSize: 28, weight: .bold)
        label.textAlignment = .center
        label.textColor = Constants.buttonColor
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    private var readyLabel: UILabel = {
        let label = UILabel()
        label.text = "Ready to scan this network"
        label.textAlignment = .center
        label.textColor = .systemGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private func configure() {
        self.backgroundColor = UIColor(red: 16/255, green: 13/255, blue: 44/255, alpha: 1)
        self.layer.cornerRadius = 8
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        addSubview(button)
        addSubview(readyLabel)
        addSubview(wifiNameLabel)
        addSubview(currLabel)
        
        NSLayoutConstraint.activate([
            button.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -25),
            button.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            button.widthAnchor.constraint(equalToConstant: 320),
            button.heightAnchor.constraint(equalToConstant: 50),
            
            readyLabel.bottomAnchor.constraint(equalTo: button.topAnchor, constant: -8),
            readyLabel.centerXAnchor.constraint(equalTo: button.centerXAnchor),
            readyLabel.heightAnchor.constraint(equalToConstant: 22),
            readyLabel.widthAnchor.constraint(equalToConstant: 350),
            
            wifiNameLabel.bottomAnchor.constraint(equalTo: readyLabel.topAnchor, constant: -16),
            wifiNameLabel.centerXAnchor.constraint(equalTo: button.centerXAnchor),
            
            currLabel.bottomAnchor.constraint(equalTo: wifiNameLabel.topAnchor, constant: -10),
            currLabel.centerXAnchor.constraint(equalTo: button.centerXAnchor)
            
            
        ])
    }
    
    @objc func buttonTapped() {
           guard let parentVC = parentViewController else { return }
           let detectionSearchVC = DetectionSearchVC()
           parentVC.navigationController?.pushViewController(detectionSearchVC, animated: true)
       }
}
