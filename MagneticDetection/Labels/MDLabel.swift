//
//  MDLabel.swift
//  MagneticDetection
//
//  Created by Олексій Гаєвський on 04.04.2024.
//

import UIKit

class MDLabel: UILabel {

       override init(frame: CGRect) {
           super.init(frame: frame)
           configure()
       }
       
       required init?(coder: NSCoder) {
           fatalError("init(coder:) has not been implemented")
       }
       
       
       init(fontSize: CGFloat){
           super.init(frame: .zero)
           self.font = UIFont.systemFont(ofSize: fontSize, weight: .medium)
           configure()
       }
       
       
       private func configure(){
           adjustsFontSizeToFitWidth = true
           minimumScaleFactor = 0.9
           lineBreakMode = .byTruncatingTail
           translatesAutoresizingMaskIntoConstraints = false
       }

}
