//
//  LazyVariable.swift
//  RxInstantiate
//
//  Created by tarunon on 2017/06/28.
//
//

import Foundation
import RxSwift
import RxCocoa

func never<X, Y>(message: String = "") -> (X) -> Y {
    return { _ in
        fatalError(message)
    }
}

public class LazyVariable<E> {
    let _subject = ReplaySubject<E>.create(bufferSize: 1)
    let _lock = NSRecursiveLock()

    var _element: E?
    public var element: E {
        get {
            _lock.lock()
            defer { _lock.unlock() }
            return _element!
        }
        set {
            _lock.lock()
            _element = newValue
            _lock.unlock()
            _subject.onNext(newValue)
        }
    }

    public init() {}

    deinit {
        _subject.onCompleted()
    }
}

extension LazyVariable: ObserverType {
    public func on(_ event: Event<E>) {
        switch event {
        case .next(let element):
            self.element = element
        case .error(let error):
            #if DEBUG
                fatalError("\(error)")
            #else
                print("Error occured: \(error)")
            #endif
        case .completed:
            break
        }
    }
}

extension LazyVariable: ObservableConvertibleType {
    public func asObservable() -> Observable<E> {
        return _subject.asObservable()
    }
}

extension LazyVariable {
    public func asSharedSequence<SharingStrategy: SharingStrategyProtocol>(strategy: SharingStrategy.Type = SharingStrategy.self) -> SharedSequence<SharingStrategy, E> {
        return self.asObservable()
            .observeOn(SharingStrategy.scheduler)
            .asSharedSequence(onErrorRecover: never(message: "LazyVariable should have no Error"))
    }
}

extension LazyVariable {
    public func asDriver() -> SharedSequence<DriverSharingStrategy, E> {
        return asSharedSequence()
    }
}
