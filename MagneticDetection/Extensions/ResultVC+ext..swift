//
//  ResultVC+ext..swift
//  MagneticDetection
//
//  Created by Олексій Гаєвський on 04.04.2024.
//

import Foundation
import UIKit
extension ResultVC: UITableViewDelegate,
                    UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CustomCell.reuseIdentifier, for: indexPath) as? CustomCell
        else { return UITableViewCell()}
        
        let isError = indexPath.row % 3 == 0
        cell.configure(isAnError: isError, routerName: "Router \(indexPath.row + 1)", ipName: "192.186.1\(indexPath.row + 1)")
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let cell = tableView.cellForRow(at: indexPath) as? CustomCell else {
            return
        }
        
        let isError = cell.isAnError
        let deviceDetailsVC = DeviceDetailsVC()
        deviceDetailsVC.isError = isError
        navigationController?.pushViewController(deviceDetailsVC, animated: true)
    }

    
    
}
