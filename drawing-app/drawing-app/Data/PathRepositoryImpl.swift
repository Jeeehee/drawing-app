//
//  PathRepositoryImpl.swift
//  drawing-app
//
//  Created by Jihee hwang on 2023/11/15.
//

import Foundation

final class PathRepositoryImpl: PathRepository {
    
    private var storage: PathStorage?
    
    init(pathStorage: PathStorage = .init()) {
        storage = pathStorage
    }
    
    func setPath(_ path: Path) {
        storage?.add(path)
    }
    
}
