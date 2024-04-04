//
//  CameraCell.swift
//  MagneticDetection
//
//  Created by Олексій Гаєвський on 04.04.2024.
//

import UIKit

class CameraCell: UITableViewCell {
    static let reuseIdentifier = "CameraCell"
    var leftTextLabel = MDLabel(fontSize: 17)
    var rightTextLabel = MDLabel(fontSize: 17)
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configure(leftText: self.leftTextLabel.text ?? "Not found", rightText: self.rightTextLabel.text ?? "Not found")
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    
    
    func configure(leftText: String, rightText: String) {
        self.backgroundColor = UIColor(red: 16/255, green: 13/255, blue: 44/255, alpha: 1)
        leftTextLabel.text = leftText
        rightTextLabel.text = rightText
        leftTextLabel.textColor = .white
        rightTextLabel.textColor = .systemGray4
        
        addSubview(leftTextLabel)
        addSubview(rightTextLabel)
        
        NSLayoutConstraint.activate([
            leftTextLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            leftTextLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            leftTextLabel.heightAnchor.constraint(equalToConstant: 22),
            
            rightTextLabel.centerYAnchor.constraint(equalTo: leftTextLabel.centerYAnchor),
            rightTextLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
            rightTextLabel.heightAnchor.constraint(equalToConstant: 22)
        ])
    }
    
    
    
    
}
