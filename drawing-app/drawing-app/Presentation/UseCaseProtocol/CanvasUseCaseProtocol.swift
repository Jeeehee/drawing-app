//
//  CanvasUseCaseProtocol.swift
//  drawing-app
//
//  Created by Jihee hwang on 2023/11/15.
//

import Foundation
import RxSwift

protocol CanvasUseCaseProtocol {
    func calculateBoundary(canvas: CGRect)
    func makeSquare(_ completion: @escaping (Square?) -> ())
}
