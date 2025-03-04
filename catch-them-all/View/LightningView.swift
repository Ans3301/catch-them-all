//
//  LightningView.swift
//  catch-them-all
//
//  Created by Мария Анисович on 25.02.2025.
//

import SwifterSwift
import UIKit

final class LightningView: UIView {
    override func draw(_ rect: CGRect) {
        let firstLightningPath = UIBezierPath()
        firstLightningPath.move(to: CGPoint(x: rect.width * 0.06, y: rect.height))
        firstLightningPath.addLine(to: CGPoint(x: rect.width * 0.5, y: rect.height * 0.59))
        firstLightningPath.addLine(to: CGPoint(x: rect.width * 0.12, y: rect.height * 0.65))
        firstLightningPath.addLine(to: CGPoint(x: rect.width * 0.56, y: rect.height * 0.41))
        firstLightningPath.addLine(to: CGPoint(x: rect.width * 0.18, y: rect.height * 0.47))
        firstLightningPath.addLine(to: CGPoint(x: rect.width * 0.93, y: rect.height * 0.03))
        firstLightningPath.addLine(to: CGPoint(x: rect.width * 0.62, y: rect.height * 0.32))
        firstLightningPath.addLine(to: CGPoint(x: rect.width * 1.06, y: rect.height * 0.26))
        firstLightningPath.addLine(to: CGPoint(x: rect.width * 0.56, y: rect.height * 0.53))
        firstLightningPath.addLine(to: CGPoint(x: rect.width * 0.94, y: rect.height * 0.48))
        firstLightningPath.close()
        
        let firstLightning = CAShapeLayer()
        firstLightning.path = firstLightningPath.cgPath
        firstLightning.strokeColor = UIColor(hexString: "#FFCB05")?.cgColor
        firstLightning.fillColor = UIColor(hexString: "#FFCB05")?.cgColor
        firstLightning.lineWidth = 12
        firstLightning.lineJoin = .round
        
        let secondLightningPath = UIBezierPath()
        secondLightningPath.move(to: CGPoint(x: 0, y: rect.height * 0.97))
        secondLightningPath.addLine(to: CGPoint(x: rect.width * 0.44, y: rect.height * 0.56))
        secondLightningPath.addLine(to: CGPoint(x: rect.width * 0.06, y: rect.height * 0.62))
        secondLightningPath.addLine(to: CGPoint(x: rect.width * 0.5, y: rect.height * 0.38))
        secondLightningPath.addLine(to: CGPoint(x: rect.width * 0.12, y: rect.height * 0.44))
        secondLightningPath.addLine(to: CGPoint(x: rect.width * 0.87, y: 0))
        secondLightningPath.addLine(to: CGPoint(x: rect.width * 0.56, y: rect.height * 0.29))
        secondLightningPath.addLine(to: CGPoint(x: rect.width, y: rect.height * 0.23))
        secondLightningPath.addLine(to: CGPoint(x: rect.width * 0.5, y: rect.height * 0.5))
        secondLightningPath.addLine(to: CGPoint(x: rect.width * 0.88, y: rect.height * 0.45))
        secondLightningPath.close()
        
        let secondLightning = CAShapeLayer()
        secondLightning.path = secondLightningPath.cgPath
        secondLightning.lineWidth = 12
        secondLightning.strokeColor = UIColor(hexString: "#231F20")?.cgColor
        secondLightning.fillColor = UIColor.clear.cgColor
        secondLightning.lineJoin = .round
        
        layer.addSublayer(firstLightning)
        layer.addSublayer(secondLightning)
    }
}
