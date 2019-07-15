//
//  AxisGraphLayer.swift
//  MMCharts
//
//  Created by MIGUEL MOLDES on 14/7/19.
//  Copyright © 2019 MIGUEL MOLDES. All rights reserved.
//

import Foundation
import QuartzCore
import UIKit

class AxisGraphLayer : GraphLayer {
    
    private let margins: UIEdgeInsets
    private let axisColor: UIColor
    private let axisExtension: CGFloat
    private let axisLineWidth: CGFloat
    
    
    init(margins: UIEdgeInsets, axisColor: UIColor = UIColor.red, axisExtension: CGFloat = 5.0, axisLineWidth: CGFloat = 1.0) {
        self.margins = margins
        self.axisColor = axisColor
        self.axisExtension = axisExtension
        self.axisLineWidth = axisLineWidth
        super.init()
    }
    
    override func drawLayer(rect: CGRect) {
        super.drawLayer(rect: rect)
        drawYAxis(rect: rect)
        drawXAxis(rect: rect)
        animate()
    }
    
    private func drawYAxis(rect: CGRect) {
        path.move(to:CGPoint(x:self.margins.left,
                             y:self.margins.top))
        path.addLine(to:CGPoint(x:self.margins.left,
                                y:rect.height - self.margins.bottom + self.axisExtension))
        self.layer.lineWidth = self.axisLineWidth
        self.layer.strokeColor = self.axisColor.cgColor
        self.layer.path = path.cgPath
    }
    
    private func drawXAxis(rect: CGRect) {
        path.move(to:CGPoint(x:self.margins.left - self.axisExtension,
                             y:rect.height - self.margins.bottom))
        path.addLine(to:CGPoint(x:rect.width - self.margins.right,
                                y:rect.height - self.margins.bottom))
        self.layer.lineWidth = self.axisLineWidth
        self.layer.strokeColor = self.axisColor.cgColor
        self.layer.path = path.cgPath
    }
    
    private func animate() {
        let animation = CABasicAnimation(keyPath: "strokeEnd")
        animation.fromValue = 0.0
        animation.toValue = 1.0
        animation.duration = 0.4
        self.layer.add(animation, forKey: "strokeEndAnimation")
    }
    
    
}
