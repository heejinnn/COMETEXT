import UIKit

class ProgressBarView: UIView, CAAnimationDelegate {
    
    private var circleLayer: CAShapeLayer!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        createCircleLayer()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        createCircleLayer()
    }
    
    private func createCircleLayer() {
        let circlePath = UIBezierPath(
            arcCenter: CGPoint(x: bounds.width / 2, y: bounds.height / 2),
            radius: (bounds.width - 10) / 4, // 크기를 반으로 줄임
            startAngle: -CGFloat.pi / 2,
            endAngle: 3 * CGFloat.pi / 2,
            clockwise: true)
        
        circleLayer = CAShapeLayer()
        circleLayer.path = circlePath.cgPath
        circleLayer.strokeColor = UIColor(named: "Primary")?.cgColor
        circleLayer.lineWidth = 20
        circleLayer.fillColor = UIColor.clear.cgColor
        circleLayer.strokeEnd = 0
        
        layer.addSublayer(circleLayer)
    }

    
    func fillProgressBar(duration: TimeInterval) {
           let animation = CABasicAnimation(keyPath: "strokeEnd")
           animation.toValue = 1
           animation.duration = duration
           animation.fillMode = CAMediaTimingFillMode.forwards
           animation.isRemovedOnCompletion = false
           animation.delegate = self // 델리게이트를 설정합니다.
           
           circleLayer.add(animation, forKey: "progressAnimation")
    }
    
    // 애니메이션이 완료될 때 호출되는 델리게이트 메서드
    func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
        if flag {
            circleLayer.removeFromSuperlayer() // ProgressBar를 제거합니다.
        }
    }
}

