//
//  UIView+.swift
//  ChallengeGOK
//
//  Created by Lilian on 17/04/21.
//

import UIKit


extension UIView {
    
    func addShadow(color: UIColor, offSet: CGSize, radius: CGFloat, scale: Bool, opacity: Float) {
        layer.masksToBounds = false
        layer.shadowColor = color.cgColor
        layer.shadowOpacity = opacity
        layer.shadowOffset = offSet
        layer.shadowRadius = radius
        layer.cornerRadius = radius
        layer.layoutIfNeeded()
        layer.setNeedsLayout()
        
        layer.shadowPath = UIBezierPath(roundedRect: self.bounds, cornerRadius: radius).cgPath
        //layer.shadowPath = UIBezierPath(rect: self.bounds).cgPath
        layer.shouldRasterize = true
        layer.rasterizationScale = scale ? UIScreen.main.scale : 1
    }
}
