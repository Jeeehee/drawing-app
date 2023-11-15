//
//  CanvasViewModel.swift
//  drawing-app
//
//  Created by Jihee hwang on 2023/11/07.
//

import Foundation
import RxSwift
import RxCocoa

protocol CanvasViewModelInput {
    var canvasSize: PublishRelay<CGRect> { get }
    var didTapMakeSquareButton: PublishRelay<Void> { get }
}

protocol CanvasViewModelOutput {
    var showSquare: PublishRelay<Square> { get }
}

protocol CanvasViewModelProtocol: CanvasViewModelInput, CanvasViewModelOutput {
    var input: CanvasViewModelInput { get }
    var output: CanvasViewModelOutput { get }
}

final class CanvasViewModel: CanvasViewModelProtocol {
    
    // MARK: - Essential
    
    var input: CanvasViewModelInput { self }
    var output: CanvasViewModelOutput { self }
    
    // MARK: - Properties
    
    private let disposeBag = DisposeBag()
    private var xRange: ClosedRange<CGFloat>?
    private var yRange: ClosedRange<CGFloat>?
    
    // MARK: - Input
    
    let canvasSize = PublishRelay<CGRect>()
    let didTapMakeSquareButton = PublishRelay<Void>()
    
    // MARK: - Output
    
    let showSquare = PublishRelay<Square>()
    
    // MARK: - UseCase
    
    private var canvasUseCaseProtocol: CanvasUseCaseProtocol?
    
    // MARK: - Initialize
    
    init(canvasUseCaseProtocol: CanvasUseCaseProtocol = SquareUsecase()) {
        rxBind()
    }
    
    // MARK: - RxBind
    
    private func rxBind() {
        input.canvasSize
            .bind(with: self, onNext: { owner, canvas in
                owner.canvasUseCaseProtocol?.calculateBoundary(canvas: canvas)
            })
            .disposed(by: disposeBag)
        
        // TODO: 입출력 흐름 분리
        input.didTapMakeSquareButton
            .bind(with: self, onNext: { owner, _ in
                owner.canvasUseCaseProtocol?.makeSquare { square in
                    guard let square else { return }
                    owner.output.showSquare.accept(square)
                }
            })
            .disposed(by: disposeBag)
    }


}
