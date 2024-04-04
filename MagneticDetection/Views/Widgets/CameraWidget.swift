//
//  CameraWidget.swift
//  MagneticDetection
//
//  Created by Олексій Гаєвський on 04.04.2024.
//

import UIKit

class CameraWidget: UIView {
    
    let cellLeftText = ["Connection Type", "IP Address", "MAC Address", "Hostname"]
    let cellRightText = ["Wifi", "192.168.1.1", "Not Available", "gwpc-21141234.local"]
    
    var cameraTitle = MDTitleLabel(fontSize: 28)
    var ipAddress = MDLabel(fontSize: 15)
    let tableView = UITableView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        tableView.dataSource = self
        tableView.delegate = self
        self.translatesAutoresizingMaskIntoConstraints = false
        tableView.rowHeight = 50
        configure()

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func configure() {
        self.backgroundColor = UIColor(red: 16/255, green: 13/255, blue: 44/255, alpha: 1)
        self.layer.cornerRadius = 8
        tableView.register(CameraCell.self, forCellReuseIdentifier: CameraCell.reuseIdentifier)
        
        addSubview(tableView)
        addSubview(ipAddress)
        addSubview(cameraTitle)
        
        cameraTitle.text = "Camera"
        ipAddress.text = "192.168.1.1"
        ipAddress.textColor = .white
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.bottomAnchor.constraint(equalTo: bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: trailingAnchor),
            tableView.heightAnchor.constraint(equalToConstant: 200),
            
            ipAddress.topAnchor.constraint(equalTo: cameraTitle.bottomAnchor),
            ipAddress.centerXAnchor.constraint(equalTo: cameraTitle.centerXAnchor),
            ipAddress.heightAnchor.constraint(equalToConstant: 20),
            
            cameraTitle.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            cameraTitle.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            cameraTitle.heightAnchor.constraint(equalToConstant: 35)

        ])
    }

}





extension CameraWidget: UITableViewDelegate,
                        UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      guard let cell = tableView.dequeueReusableCell(withIdentifier: CameraCell.reuseIdentifier, for: indexPath) as? CameraCell else { return UITableViewCell() }
        
        cell.configure(leftText: cellLeftText[indexPath.row], rightText: cellRightText[indexPath.row])
        return cell
    }
    
    
}
