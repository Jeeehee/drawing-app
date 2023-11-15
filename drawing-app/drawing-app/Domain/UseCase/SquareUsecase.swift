//
//  SquareUsecase.swift
//  drawing-app
//
//  Created by Jihee hwang on 2023/11/15.
//

import Foundation

final class SquareUsecase: CanvasUseCaseProtocol {
    
    private var repository: SquareRepository?
    private var xRange: ClosedRange<CGFloat>?
    private var yRange: ClosedRange<CGFloat>?
    
    init(squareRepository: SquareRepository = SquareRepositoryImpl()) {
        repository = squareRepository
    }
    
    func calculateBoundary(canvas: CGRect) {
        let squareSize = Layout.square.size
        xRange = canvas.minX...canvas.maxX - squareSize
        yRange = canvas.minY...canvas.maxY - squareSize
    }
    
    func makeSquare(_ completion: @escaping (Square?) -> ()){
        guard let xRange,
              let yRange else {
            completion(nil)
            return
        }
        
        let square = Square(
            point: .init(
                x: .random(in: xRange),
                y: .random(in: yRange)),
            color: .random)
        
        repository?.setSquare(square)
        completion(square)
    }
    
}
