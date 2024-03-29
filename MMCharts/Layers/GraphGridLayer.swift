//
//  GridLayer.swift
//  MMCharts
//
//  Created by MIGUEL MOLDES on 14/7/19.
//  Copyright © 2019 MIGUEL MOLDES. All rights reserved.
//

import Foundation
import QuartzCore
import UIKit

class GraphGridLayer : GraphLayer {
    
    let margins: UIEdgeInsets
    let gridHorizontalLines: Int
    let gridColor: UIColor
    let axisExtension: CGFloat
    let gridLinesWidth: CGFloat
    private let withVerticalLines: Bool
    private let lineDashPattern: [NSNumber]?
    
    init(margins: UIEdgeInsets,
         gridHorizontalLines:Int = 6,
         gridColor: UIColor = UIColor(red: 164/255, green: 164/255, blue: 164/255, alpha: 0.6),
         axisExtension:CGFloat = 0.0,
         gridLinesWidth:CGFloat = 1.0,
         withVerticalLines: Bool = true,
         lineDashPattern: [NSNumber]? = nil
        ) {
        self.margins = margins
        self.gridHorizontalLines = gridHorizontalLines
        self.gridColor = gridColor
        self.axisExtension = axisExtension
        self.gridLinesWidth = gridLinesWidth
        self.withVerticalLines = withVerticalLines
        self.lineDashPattern = lineDashPattern
        super.init()
    }
    
    override func drawLayer(rect: CGRect) {
        super.drawLayer(rect: rect)
        drawLines(rect: rect)
    }
    
    private func drawLines(rect: CGRect) {
        let allGridHeight = rect.height - self.margins.bottom - self.margins.top
        let finalXPos = rect.width - self.margins.right
        let smallBoxHeight = allGridHeight / CGFloat(self.gridHorizontalLines)
        
        var currentY = rect.height - self.margins.bottom - smallBoxHeight
        var currentX:CGFloat = self.margins.left - self.axisExtension
        for _ in 0..<self.gridHorizontalLines {
            path.move(to: CGPoint(x:currentX,y:currentY))
            path.addLine(to: CGPoint(x: finalXPos, y: currentY))
            currentY -= smallBoxHeight
        }
        
        currentY = rect.height - self.margins.bottom + self.axisExtension
        let graphWidth = rect.width - (self.margins.left + self.margins.right)
        let gridVerticalLines = Int(graphWidth / smallBoxHeight)
        let gridWidth = graphWidth / CGFloat(gridVerticalLines)
        let finalYPos = self.margins.top
        
        currentX = self.margins.left + gridWidth
        
        if self.withVerticalLines {
            for _ in 0..<gridVerticalLines {
                path.move(to: CGPoint(x:currentX,y:currentY))
                path.addLine(to: CGPoint(x: currentX, y: finalYPos))
                currentX += gridWidth
            }
        }
        
        self.layer.lineDashPattern = self.lineDashPattern
        self.layer.lineWidth = self.gridLinesWidth
        self.layer.strokeColor = self.gridColor.cgColor
        self.layer.path = path.cgPath
    }
    
    private func animate() {
        let animation = CABasicAnimation(keyPath: "strokeEnd")
        animation.fromValue = 0.0
        animation.toValue = 1.0
        animation.duration = 0.3
        self.layer.add(animation, forKey: "strokeEndAnimation")
    }
    
    
}
