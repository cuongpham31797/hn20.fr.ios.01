//
//  ProgressView.swift
//  ProgressView_Ex_2
//
//  Created by Cuong  Pham on 4/8/20.
//  Copyright © 2020 Cuong  Pham. All rights reserved.
//

import UIKit

class ProgressView: UIView {
    private var backgroundLayer : CAShapeLayer!
    private var foregroundLayer : CAShapeLayer!
    var textLayer : CATextLayer!
    var count : Int!
    
    public var progress : CGFloat = 0 {
        didSet {
            didProgressUpdated()
        }
    }
    
    override func draw(_ rect: CGRect) {
        let width = rect.width
        let height = rect.height
        
        let lineWidth = 0.05 * min(width, height)
        backgroundLayer = createCircularLayer(rect: rect, strokeColor: UIColor.lightGray.cgColor,
                                              fillColor: UIColor.clear.cgColor, lineWidth: lineWidth)
        foregroundLayer = createCircularLayer(rect: rect, strokeColor: UIColor.green.cgColor, fillColor: UIColor.clear.cgColor, lineWidth: lineWidth)
        textLayer = createTextLayer(rect: rect, textColor: UIColor.white.cgColor)
        layer.addSublayer(backgroundLayer)
        layer.addSublayer(foregroundLayer)
        layer.addSublayer(textLayer)
    }
    
    func createCircularLayer(rect : CGRect, strokeColor : CGColor, fillColor : CGColor, lineWidth : CGFloat) -> CAShapeLayer{
        let width = rect.width
        let height = rect.height
        let center = CGPoint(x: width / 2, y: height / 2)
        let radius = (min(width, height) - lineWidth) / 2
        
        let startAngle = -CGFloat.pi / 2
        let endAngle = startAngle + 2 * CGFloat.pi
        
        let circularPath = UIBezierPath(arcCenter: center, radius: radius, startAngle: startAngle, endAngle: endAngle, clockwise: true)
        
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = circularPath.cgPath
        shapeLayer.strokeColor = strokeColor
        shapeLayer.fillColor = fillColor
        shapeLayer.lineWidth = lineWidth
        shapeLayer.lineCap = .round
        return shapeLayer
    }
    
    func createTextLayer(rect : CGRect, textColor : CGColor) -> CATextLayer {
        let width = rect.width
        let height = rect.height
        let fontSize = min(width, height) / 5
        let offset = min(width, height) * 0.1
        let layer = CATextLayer()
        layer.string = "\(progress * 100)"
        layer.string = "0"
        layer.backgroundColor = UIColor.clear.cgColor
        layer.fontSize = fontSize
        layer.alignmentMode = .center
        layer.frame = CGRect(x: 0, y: (height - fontSize - offset) / 2, width: width, height: fontSize + offset)
        return layer
    }
    
    func didProgressUpdated(){
        textLayer?.string = "\(progress * 100)"
        foregroundLayer?.strokeEnd = progress
    }
}
