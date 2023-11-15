//
//  SquareRepositoryImpl.swift
//  drawing-app
//
//  Created by Jihee hwang on 2023/11/15.
//

import Foundation

final class SquareRepositoryImpl: SquareRepository {
    
    private var storage: SquareStorage?
    
    init(squareStorage: SquareStorage = .init()) {
        storage = squareStorage
    }
    
    func setSquare(_ square: Square) {
        storage?.add(square)
    }
    
}
