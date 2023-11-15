//
//  SquareStorage.swift
//  drawing-app
//
//  Created by Jihee hwang on 2023/11/15.
//

import Foundation

final class SquareStorage: StorageProtocol {
    typealias Item = Square

    private var squares: [Square]
    
    init() {
        self.squares = []
    }

    func count() -> Int {
        squares.count
    }
    
    func getAll() -> [Square]? {
        squares.isEmpty ? nil : squares
    }
    
    func reset() {
        squares.removeAll()
    }
    
    func add(_ item: Square) {
        squares.append(item)
    }
    
    func insert(_ item: Square, at: Int) {
        squares.insert(item, at: at)
    }
    
}
