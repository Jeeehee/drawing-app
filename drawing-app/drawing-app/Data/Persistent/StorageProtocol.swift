//
//  StorageProtocol.swift
//  drawing-app
//
//  Created by Jihee hwang on 2023/11/15.
//

import Foundation

protocol StorageProtocol {
    associatedtype Item
    
    func count() -> Int
    func getAll() -> [Item]?
    func reset()
    func add(_ item: Item)
    func insert(_ item: Item, at: Int)
}
