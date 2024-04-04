//
//  Tile.swift
//  MagneticDetection
//
//  Created by Олексій Гаєвський on 03.04.2024.
//
import UIKit

class Tile: UIView {
    var title: String = ""
    var imageName: String = ""
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    init(imageName: String, title: String) {
        super.init(frame: .zero)
        self.imageName = imageName
        self.title = title
        configure()
        self.translatesAutoresizingMaskIntoConstraints = false
    }

    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = self.title
        label.textAlignment = .center
        label.numberOfLines = 2
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    private lazy var tileImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: self.imageName)
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    
    
    private func configure() {
        self.backgroundColor = UIColor(red: 35/255, green: 23/255, blue: 95/255, alpha: 1)
        self.layer.cornerRadius = 8
        addSubview(tileImage)
        addSubview(titleLabel)
        NSLayoutConstraint.activate([
            tileImage.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            tileImage.topAnchor.constraint(equalTo: self.topAnchor, constant: 20),
            tileImage.heightAnchor.constraint(equalToConstant: 50),
            tileImage.widthAnchor.constraint(equalToConstant: 50),
            
            titleLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            titleLabel.topAnchor.constraint(equalTo: tileImage.bottomAnchor, constant: 10),
            titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 8),
            titleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -8) 
        ])
        
    }
    
    
}
