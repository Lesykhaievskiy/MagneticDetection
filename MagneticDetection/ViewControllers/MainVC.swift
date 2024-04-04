//
//  MainVC.swift
//  MagneticDetection
//
//  Created by Олексій Гаєвський on 03.04.2024.
//

import UIKit

class MainVC: UIViewController {
    let magneticTile = Tile(imageName: "magnet", title: "Magnetic Detection")
    let antispyTile = Tile(imageName: "lamp", title: "Antispy Tips")
    let bluetoothTile = Tile(imageName: "bluetooth", title: "Bluetooth Detection")
    let infraredTile = Tile(imageName: "infrared", title: "Infrared Detection")
    let wifiWidget = WIFIWidget()
    let backgroundImage = BackgroundImage(imageName: "mainImage")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        overrideUserInterfaceStyle = .dark
        configureBackGroundImage(backgroundImage: backgroundImage)
        configureLogoImage(backgroundImage: backgroundImage, imageName: "router", height: 300, width: 300)
        setupTiles()
        configureWidget()
        
        let editButton = UIBarButtonItem(image: UIImage(systemName: "slider.vertical.3"), style: .plain, target: nil, action: nil)
        editButton.tintColor = .white
        navigationItem.rightBarButtonItem = editButton
        
        wifiWidget.parentViewController = self
    }
    
    
    
    private func configureWidget() {
        view.addSubview(wifiWidget)
        
        NSLayoutConstraint.activate([
            wifiWidget.bottomAnchor.constraint(equalTo: infraredTile.topAnchor, constant: -15),
            wifiWidget.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            wifiWidget.heightAnchor.constraint(equalToConstant: 200),
            wifiWidget.widthAnchor.constraint(equalToConstant: 350)
        ])
    }
     
    
    private func configureTiles(tile: Tile, constraints: [NSLayoutConstraint]) {
        view.addSubview(tile)
        NSLayoutConstraint.activate(constraints)
        let magneticTileTapGesture = UITapGestureRecognizer(target: self, action: #selector(magneticTileTapped))
           magneticTile.addGestureRecognizer(magneticTileTapGesture)
    }
    
    
    @objc private func magneticTileTapped() {
        let magneticVC = MagneticDetectionVC()
        navigationController?.pushViewController(magneticVC, animated: true)
    }
    
    
    
    
    private func setupTiles() {
        configureTiles(tile: magneticTile, constraints: [
            magneticTile.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Constants.padding),
            magneticTile.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            magneticTile.heightAnchor.constraint(equalToConstant: Constants.tileSize),
            magneticTile.widthAnchor.constraint(equalToConstant: Constants.tileSize)
        ])
        
        configureTiles(tile: antispyTile, constraints: [
            antispyTile.leadingAnchor.constraint(equalTo: magneticTile.trailingAnchor, constant:  Constants.padding),
            antispyTile.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            antispyTile.heightAnchor.constraint(equalToConstant: Constants.tileSize),
            antispyTile.widthAnchor.constraint(equalToConstant: Constants.tileSize)
        ])
        
        
        configureTiles(tile: infraredTile, constraints: [
            infraredTile.bottomAnchor.constraint(equalTo: magneticTile.topAnchor, constant: -Constants.padding),
            infraredTile.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant:  Constants.padding),
            infraredTile.heightAnchor.constraint(equalToConstant: Constants.tileSize),
            infraredTile.widthAnchor.constraint(equalToConstant: Constants.tileSize)
            
        ])
        
        configureTiles(tile: bluetoothTile, constraints: [
            bluetoothTile.leadingAnchor.constraint(equalTo: infraredTile.trailingAnchor, constant:  Constants.padding),
            bluetoothTile.bottomAnchor.constraint(equalTo: antispyTile.topAnchor, constant: -Constants.padding),
            bluetoothTile.heightAnchor.constraint(equalToConstant: Constants.tileSize),
            bluetoothTile.widthAnchor.constraint(equalToConstant: Constants.tileSize)
        ])
    }

}
