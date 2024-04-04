//
//  CustomCell.swift
//  MagneticDetection
//
//  Created by Олексій Гаєвський on 04.04.2024.
//

import UIKit

class CustomCell: UITableViewCell {
    var isAnError: Bool = false
    var routerName: String = ""
    var ipName: String = ""
    static let reuseIdentifier = "RouterCell"
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configure(isAnError: self.isAnError, routerName: self.routerName, ipName: self.ipName)
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

    
    
    private var wifiImage: UIImageView = {
        let imageview = UIImageView()
        imageview.image = UIImage(systemName: "icloud.slash")
        imageview.contentMode = .scaleAspectFit
        imageview.tintColor = .white
        imageview.translatesAutoresizingMaskIntoConstraints = false
        return imageview
    }()
    
    private var routerNameLabel: UILabel = {
        let label = UILabel()
        label.text = "Default router"
        label.font = UIFont.systemFont(ofSize: 17, weight: .bold)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    private var ipLabel: UILabel = {
        let label = UILabel()
        label.text = "192.168.1.1"
        label.font = UIFont.systemFont(ofSize: 13)
        label.textColor = .systemGray2
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    func configure(isAnError: Bool, routerName: String, ipName: String){
        self.backgroundColor = UIColor(red: 16/255, green: 13/255, blue: 44/255, alpha: 1)
        self.accessoryType = .disclosureIndicator
        self.isAnError = isAnError
        self.routerName = routerName
        self.ipName = ipName
        
        wifiImage.image = isAnError ? UIImage(named: "failedImage") : UIImage(named: "correctImage")
        routerNameLabel.text = routerName
        ipLabel.text = ipName
        
        addSubview(wifiImage)
        addSubview(routerNameLabel)
        addSubview(ipLabel)
        
        
        NSLayoutConstraint.activate([
            wifiImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            wifiImage.centerYAnchor.constraint(equalTo: centerYAnchor),
            wifiImage.widthAnchor.constraint(equalToConstant: 38),
            wifiImage.heightAnchor.constraint(equalToConstant: 38),
            
            routerNameLabel.leadingAnchor.constraint(equalTo: wifiImage.trailingAnchor, constant: 8),
            routerNameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            routerNameLabel.heightAnchor.constraint(equalToConstant: 20),
            
            ipLabel.leadingAnchor.constraint(equalTo: routerNameLabel.leadingAnchor),
            ipLabel.topAnchor.constraint(equalTo: routerNameLabel.bottomAnchor),
            ipLabel.heightAnchor.constraint(equalToConstant: 20)
        ])
    }
}
