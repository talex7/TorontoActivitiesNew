//
//  TAView.swift
//  Customs
//
//  Created by Thomas Alexanian on 2017-04-11.
//  Copyright © 2017 Thomas Alexanian. All rights reserved.
//

import UIKit

@IBDesignable public class TAView: UIView {
    
    //Custom Properties for IB
    
    @IBInspectable public var cornerRadius : CGFloat = 0.00 {
        didSet {
            layer.cornerRadius = cornerRadius
        }
    }
    
    @IBInspectable public var borderWidth : CGFloat = 0.00 {
        didSet {
            layer.borderWidth = borderWidth
        }
    }
    
    @IBInspectable public var borderColor : UIColor = UIColor.clear {
        didSet {
            layer.borderColor = borderColor.cgColor
        }
    }
    
    @IBInspectable public var masksToBounds : Bool = false {
        didSet {
            layer.masksToBounds = masksToBounds
        }
    }
    
    @IBInspectable public var firstColor : UIColor = UIColor.white {
        didSet {
            setupGradientLayer()
        }
    }
    
    @IBInspectable public var secondColor: UIColor = UIColor.black {
        didSet {
            setupGradientLayer()
        }
    }
    
    @IBInspectable var isHorizontal: Bool = false {
        didSet{
            setupGradientLayer()
        }
    }
    
    
    //Overrides
    override public class var layerClass: AnyClass {
        return CAGradientLayer.self
    }
    
    override public init(frame: CGRect) {
        super.init(frame: frame)
        setupGradientLayer()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupGradientLayer()
    }
    
    //Function to update all properties with input values
    private func setupGradientLayer() {
        
        let gradientColors = [firstColor.cgColor, secondColor.cgColor]
        gradientLayer.colors = gradientColors
        
        if isHorizontal {
            gradientLayer.endPoint = CGPoint(x: 1, y: 0)
        }else{
            gradientLayer.endPoint = CGPoint(x: 0, y: 1)
        }
        
        self.setNeedsDisplay()
        
    }
    
    var gradientLayer : CAGradientLayer {
        return layer as! CAGradientLayer
    }
    
}
