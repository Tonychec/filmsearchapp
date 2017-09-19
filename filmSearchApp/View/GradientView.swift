//
//  GradientView.swift
//  filmSearchApp
//
//  Created by Nomad on 9/19/17.
//  Copyright © 2017 ios.Nomad. All rights reserved.
//

import UIKit

class GradientView: UIView {

    @IBInspectable var topColor: UIColor = #colorLiteral(red: 0.4197305441, green: 0.2098149061, blue: 0.2073803544, alpha: 1) {
        didSet {
            self.setNeedsLayout()
        }
    }
    
    @IBInspectable var bottomColor: UIColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1) {
        didSet {
            self.setNeedsLayout()
        }
    }
    
    override func layoutSubviews() {
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [topColor.cgColor, bottomColor.cgColor]
        gradientLayer.startPoint = CGPoint(x: 0, y: 0)
        gradientLayer.endPoint = CGPoint(x: 1, y: 1)
        gradientLayer.frame = self.bounds
        self.layer.insertSublayer(gradientLayer, at: 0)
    }
}
