//
//  Path.swift
//  drawing-app
//
//  Created by Jihee hwang on 2023/11/12.
//

import Foundation

struct Path {
    
    // MARK: - Property
    
    let id: UUID
    let lineColor: SystemColor
    let lineWidth: CGFloat
    var lastPoint: CGPoint
    var currentPoint: CGPoint

    init(id: UUID = .init(),
         lineColor: SystemColor = .random,
         lineWidth: CGFloat = 10.0,
         lastPoint: CGPoint = CGPoint.zero,
         currentPoint: CGPoint = CGPoint.zero
    ) {
        self.id = id
        self.lineColor = lineColor
        self.lineWidth = lineWidth
        self.lastPoint = lastPoint
        self.currentPoint = currentPoint
    }
    
}
