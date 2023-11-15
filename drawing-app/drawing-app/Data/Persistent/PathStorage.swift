//
//  PathStorage.swift
//  drawing-app
//
//  Created by Jihee hwang on 2023/11/12.
//

import Foundation

final class PathStorage: StorageProtocol {
    typealias Item = Path
    
    private var paths: [Path]
    
    init() {
        self.paths = []
    }
    
    func count() -> Int {
        paths.count
    }
    
    func getAll() -> [Path]? {
        paths.isEmpty ? nil : paths
    }
    
    func reset() {
        paths.removeAll()
    }
    
    func add(_ item: Path) {
        paths.append(item)
    }
    
    func insert(_ item: Path, at: Int) {
        paths.insert(item, at: at)
    }

}
