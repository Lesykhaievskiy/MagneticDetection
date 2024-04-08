//
//  ResultVC.swift
//  MagneticDetection
//
//  Created by Олексій Гаєвський on 04.04.2024.
//

import UIKit


class ResultVC: UIViewController {
    let tableView = UITableView()
    var devicesLabel = MDTitleLabel(fontSize: 28)
    var wifiName = MDLabel(fontSize: 15)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
        configureLabels()
        navigationItem.title = "Result"
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        navigationController?.navigationBar.barTintColor = .black
        overrideUserInterfaceStyle = .dark
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Back", style: .plain, target: self, action: #selector(backButtonTapped))
    }
    
     @objc func backButtonTapped() {
       dismissToRootViewController()
     }

    
    private func configureLabels() {
        devicesLabel.text = "5 Devices"
        devicesLabel.textColor = .white
        
        wifiName.text = "WIFI_NAME"
        wifiName.textColor = .systemGray4
        view.addSubview(devicesLabel)
        view.addSubview(wifiName)
        
        NSLayoutConstraint.activate([
            wifiName.bottomAnchor.constraint(equalTo: tableView.topAnchor, constant: -30),
            wifiName.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            wifiName.heightAnchor.constraint(equalToConstant: 20),
            
            devicesLabel.bottomAnchor.constraint(equalTo: wifiName.topAnchor),
            devicesLabel.centerXAnchor.constraint(equalTo: wifiName.centerXAnchor),
            devicesLabel.heightAnchor.constraint(equalToConstant: 35)
        ])
    }
    
    
    
    private func configureTableView() {
        tableView.rowHeight = 55
        tableView.delegate = self
        tableView.dataSource = self
        tableView.layer.cornerRadius = 8
        tableView.register(CustomCell.self, forCellReuseIdentifier: CustomCell.reuseIdentifier)
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 200),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)

        ])
        
    }

}




