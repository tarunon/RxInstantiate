//
//  ViewModel.swift
//  RxInstantiate
//
//  Created by tarunon on 2018/02/27.
//

import RxSwift
import RxCocoa
import Instantiate

public class Nop: ObservableConvertibleType {
    static let shared = Nop()
    private init() {}
    
    public typealias E = Never
    
    public func asObservable() -> Observable<Never> {
        return .never()
    }
}

public protocol ViewModelProtocol {
    associatedtype Input = Never
    associatedtype Output: ObservableConvertibleType = Nop
    
    func input(_ input: Input)
    var output: Output { get }
}

public extension ViewModelProtocol where Input == Never {
    func input(_ input: Input) {}
}

public extension ViewModelProtocol where Output == Nop {
    public var output: Output {
        return .shared
    }
}

public extension ViewModelProtocol where Self: ObserverType, Input == Self.E {
    public func input(_ input: Input) {
        on(.next(input))
    }
}

public extension ViewModelProtocol where Self: ObservableType, Output == Observable<Self.E> {
    public var output: Output {
        return asObservable()
    }
}

public extension ViewModelProtocol where Self: SharedSequenceConvertibleType, Output == SharedSequence<Self.SharingStrategy, Self.E> {
    public var output: Output {
        return asSharedSequence()
    }
}

public extension ViewModelProtocol where Self: PrimitiveSequenceType, Output == PrimitiveSequence<Self.TraitType, Self.ElementType> {
    public var output: Output {
        return self.primitiveSequence
    }
}

public extension ViewModelProtocol where Self: Injectable, Input == Self.Dependency {
    public func input(_ input: Input) {
        inject(input)
    }
}

public extension ViewModelProtocol where Self: SubjectType, Input == Self.SubjectObserverType.E {
    public func input(_ input: Input) {
        asObserver().on(.next(input))
    }
}

public protocol RxViewProtocol {
    associatedtype ViewModel: ViewModelProtocol
    var viewModel: ViewModel { get }
}

public extension RxViewProtocol where Self: Injectable, Self.Dependency == ViewModel.Input {
    public func inject(_ dependency: Self.Dependency) {
        viewModel.input(dependency)
    }
}

public extension Reactive where Base: RxViewProtocol {
    public var input: AnyObserver<Base.ViewModel.Input> {
        return AnyObserver { event in
            switch event {
            case .next(let element):
                self.base.viewModel.input(element)
            case .completed:
                break
            case .error(let error):
                preconditionFailure(error.localizedDescription)
            }
        }
    }
    
    public var output: Base.ViewModel.Output {
        return base.viewModel.output
    }
}
