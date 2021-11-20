//
//  IconView.swift
//  Weather
//
//  Created by Nikolai Krusser on 18.11.2021.
//

import UIKit

@IBDesignable class IconView: UIView {
    
    @IBInspectable var cornerRadius: CGFloat = 20 {
        didSet {
            setNeedsDisplay()
            self.layer.cornerRadius = self.cornerRadius
            self.clipsToBounds = true
        }
    }
    @IBInspectable var shadowColor: UIColor = UIColor.black {
        didSet{
            self.layer.shadowColor = self.shadowColor.cgColor
        }
    }
    @IBInspectable var shadowRadius: CGFloat = 0 {
        didSet {
            setNeedsDisplay()
            self.layer.shadowRadius = self.shadowRadius
        }
    }
    @IBInspectable var shadowOpacity: Float = 0.0 {
        didSet{
            self.layer.shadowOpacity = self.shadowOpacity
        }
    }
    @IBInspectable var shadowOffset: CGSize = CGSize(width: 0, height: 0) {
        didSet{
            self.layer.shadowOffset = self.shadowOffset}
    }
//    @IBInspectable var shadowPath: CGPath = UIBezierPath(rect: bounds).cgPath {
//        didSet{
//            self.layer.shadowPath = self.shadowPath
//        }
//    }
}
