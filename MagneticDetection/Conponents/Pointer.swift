//
//  Pointer.swift
//  MagneticDetection
//
//  Created by Олексій Гаєвський on 02.04.2024.
//
import UIKit

class Pointer: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.clear
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        let circlePath = UIBezierPath(arcCenter: CGPoint(x: rect.midX, y: rect.midY),
                                      radius: 25,
                                      startAngle: 0,
                                      endAngle:  Double.pi * 2,
                                      clockwise: true)
        
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = circlePath.cgPath
        shapeLayer.fillColor = UIColor(red: 225/255, green: 219/255, blue: 1, alpha: 1).cgColor
        self.layer.addSublayer(shapeLayer)
        
        let trianglePath = UIBezierPath()
        trianglePath.move(to: CGPoint(x: rect.midX - 75, y: rect.midY))
        trianglePath.addLine(to: CGPoint(x: rect.midX + 20, y: rect.midY - 7))
        trianglePath.addLine(to: CGPoint(x: rect.midX + 20, y: rect.midY + 7))
        trianglePath.close()
        
        let triangleLayer = CAShapeLayer()
        triangleLayer.path = trianglePath.cgPath
        triangleLayer.fillColor = UIColor(red: 225/255, green: 219/255, blue: 1, alpha: 1).cgColor
        self.layer.addSublayer(triangleLayer)
    }
}
