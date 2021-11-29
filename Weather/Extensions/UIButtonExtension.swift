//
//  UIButtonExtension.swift
//  Weather
//
//  Created by Nikolai Krusser on 28.11.2021.
//

import UIKit

extension UIButton {
    
    func pulsate(reverse: Bool) {
        let pulse = CASpringAnimation(keyPath: "transform.scale")
        pulse.duration = 0.5
        pulse.fromValue = 0.85
        pulse.toValue = 1.25
        pulse.autoreverses = reverse
        pulse.repeatCount = 1
        pulse.initialVelocity = 0.5
        pulse.damping = 1.0
        
        layer.add(pulse, forKey: nil)
    }
    func scale() {
        let scale = CABasicAnimation(keyPath: "transform.scale.y")
        scale.duration = 0.6
        scale.fromValue = 0.8
        scale.toValue = 1.5
        
        layer.add(scale, forKey: nil)
    }
    
    func shake() {
        let shake = CABasicAnimation(keyPath: "position")
        shake.duration = 0.1
        shake.repeatCount = 2
        shake.autoreverses = true
        
        let fromPoint = CGPoint(x: center.x - 5, y: center.y)
        let fromValue = NSValue(cgPoint: fromPoint)
        
        let toPoint = CGPoint(x: center.x + 5, y: center.y)
        let toValue = NSValue(cgPoint: toPoint)
        
        shake.fromValue = fromValue
        shake.toValue = toValue
        
        layer.add(shake, forKey: nil)
    }
//    func rotate3D() {
//        let rotate = CATransform3DMakeRotation(.pi, 0, 1, 0)
//        
//        
//        
//    }
}
