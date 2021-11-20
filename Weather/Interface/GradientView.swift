//
//  GradientView.swift
//  Weather
//
//  Created by Nikolai Krusser on 20.11.2021.
//

import UIKit

@IBDesignable class GradientView: UIView {

    //  MARK:  переменная для удобной работы со слоем
    var gradientLayer: CAGradientLayer {
        return self.layer as! CAGradientLayer
    }
//    var startColor: UIColor = .white // Начальный цвет градиента
//    var endColor: UIColor = .black // Конечный цвет градиента
    
//    var startLocation: CGFloat = 0 // Начало градиента
//    var endLocation: CGFloat = 1 // Конец градиента
//    var startPoint: CGPoint = .zero // Точка начала градиента
//    var endPoint: CGPoint = CGPoint(x: 0, y: 1) // Точка конца градиента
    
    
//    MARK: вызs методов после изменения свойств, а также атрибуты @IBDesignable и @IBInspectable для поддержки редактирования и визуализации view в storyboard
    @IBInspectable var startColor: UIColor = .white {
        didSet {
            self.updateColors()
        }
    }
    @IBInspectable var endColor: UIColor = .black {
        didSet {
            self.updateColors()
        }
    }
        
    @IBInspectable var startLocation: CGFloat = 0 {
        didSet {
            self.updateLocations()
        }
    }
    @IBInspectable var endLocation: CGFloat = 1 {
        didSet {
            self.updateLocations()
        }
    }
        
    @IBInspectable var startPoint: CGPoint = .zero {
        didSet {
            self.updateStartPoint()
        }
    }
    @IBInspectable var endPoint: CGPoint = CGPoint(x: 0, y: 1) {
        didSet {
            self.updateEndPoint()
        }
    }

    //    уточняем класс слоя
    override static var layerClass: AnyClass {
        return CAGradientLayer.self
    }
    
    // MARK: методы, которые будут обновлять параметры слоя с градиентом
    func updateLocations() {
        self.gradientLayer.locations = [self.startLocation as NSNumber,
                                        self.endLocation as NSNumber]
    }
    
    func updateColors() {
        self.gradientLayer.colors = [self.startColor.cgColor,
                                     self.endColor.cgColor]
    }
    
    func updateStartPoint() {
        self.gradientLayer.startPoint = startPoint
    }
    
    func updateEndPoint() {
        self.gradientLayer.endPoint = endPoint
    }
}
