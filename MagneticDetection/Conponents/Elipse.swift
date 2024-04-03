import UIKit

class Elipse: UIView {
    var gradientColors: [CGColor] = []
    var startPoint: CGPoint = CGPoint()
    var endPoint: CGPoint = CGPoint()
    var radius: CGFloat = 0
    var lineWdth: CGFloat = 0

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .clear
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        
        let path = UIBezierPath(arcCenter: CGPoint(x: rect.midX, y: rect.midY),
                                radius: radius,
                                startAngle: CGFloat.pi,
                                endAngle: 0,
                                clockwise: true)
        
     
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = path.cgPath
        shapeLayer.lineWidth = lineWdth
        shapeLayer.fillColor = nil
        shapeLayer.strokeColor = UIColor.black.cgColor
      
        let gradientLayer = CAGradientLayer()
        gradientLayer.startPoint = startPoint
        gradientLayer.endPoint = endPoint
        gradientLayer.colors = gradientColors

        gradientLayer.frame = rect
        gradientLayer.mask = shapeLayer
        

        self.layer.sublayers?.forEach { $0.removeFromSuperlayer() }
        
        self.layer.addSublayer(gradientLayer)
    }
}
