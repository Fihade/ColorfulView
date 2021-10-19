//
//  PointRandomization.swift
//  ColorfulView
//
//  Created by fihade on 2021/9/27.
//

import SwiftUI

extension ColorfulView {
    
    
    struct RandomPoint: Equatable, Hashable {
        
        var size: CGSize = CGSize()
        
        var radius: CGFloat = 0.0
        var x: CGFloat = 0.0
        var y: CGFloat = 0.0
        
        var offsetX: CGFloat {
            return size.width * x
        }
        
        var offsetY: CGFloat {
            return size.height * y
        }
        
        var radiusVal: CGFloat {
            return size.width * radius
        }
        
        init() {
            random()
        }
        
        init(size: CGSize) {
            self.size = size
            random()
        }
        
        mutating func random() {
            radius = CGFloat.random(in: CGFloat(0.25) ... CGFloat(0.5))
            x = CGFloat.random(in: CGFloat(-0.5) ... CGFloat(0.5))
            y = CGFloat.random(in: CGFloat(-0.5) ... CGFloat(0.5))
        }
        
        func hash(into hasher: inout Hasher) {
            hasher.combine(radius)
            hasher.combine(x)
            hasher.combine(y)
        }
    }
    
    struct PointRandomization: Equatable, Hashable {
        var diameter: CGFloat = 0
        var offsetX: CGFloat = 0
        var offsetY: CGFloat = 0
        
        var x: CGFloat = 0.0
        var y: CGFloat = 0.0
        
        var areaSize: CGSize = CGSize(width: 0, height: 0)
        
        mutating func random() {
            diameter = CGFloat.random(in: CGFloat(0.5) ... CGFloat(1.5))
            x = CGFloat.random(in: CGFloat(-0.5) ... CGFloat(0.5))
            y = CGFloat.random(in: CGFloat(-0.5) ... CGFloat(0.5))
        }
        
        mutating func randomizeIn(size: CGSize) {
            let decision = (size.width + size.height) / 4
            diameter = CGFloat.random(in: (decision * 0.25) ... (decision * 0.75))
            offsetX = CGFloat.random(in: -(size.width / 2) ... +(size.width / 2))
            offsetY = CGFloat.random(in: -(size.height / 2) ... +(size.height / 2))
        }

        func hash(into hasher: inout Hasher) {
            hasher.combine(diameter)
            hasher.combine(offsetX)
            hasher.combine(offsetY)
        }

        static func == (lhs: PointRandomization, rhs: PointRandomization) -> Bool {
            lhs.diameter == rhs.diameter &&
                lhs.offsetX == rhs.offsetX &&
                lhs.offsetY == rhs.offsetY
        }
    }
}
