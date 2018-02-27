//
//  Deprecated.swift
//  RxInstantiate
//
//  Created by tarunon on 2018/02/27.
//

import UIKit
import Instantiate
import RxSwift
import RxCocoa

func never<X, Y>(message: String = "") -> (X) -> Y {
    return { _ in
        fatalError(message)
    }
}

/**
 LazyVariable is a wrapper for `ReplaySubject(1)`.
 
 Unlike `ReplaySubject` it can't terminate with error, and when variable is deallocated
 it will complete its observable sequence (`asObservable`).
 */
public class _LazyVariable<E> {
    let _subject = ReplaySubject<E>.create(bufferSize: 1)
    let _lock = NSRecursiveLock()
    
    var _element: E?
    
    /**
     Gets or sets current value of lazy variable.
     
     Whenever a new value is set, all the observers are notified of the change.
     
     Even if the newly set value is same as the old value, observers are still notified for change.
     
     Should set element before get element.
     */
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

extension _LazyVariable/* : ObservableConvertibleType */ {
    /// - returns: Canonical interface for push style sequence
    public func asObservable() -> Observable<E> {
        return _subject.asObservable()
    }
}

extension _LazyVariable {
    public func asSharedSequence<SharingStrategy: SharingStrategyProtocol>(strategy: SharingStrategy.Type = SharingStrategy.self) -> SharedSequence<SharingStrategy, E> {
        return self.asObservable()
            .observeOn(SharingStrategy.scheduler)
            .asSharedSequence(onErrorRecover: never(message: "LazyVariable should have no Error"))
    }
}

extension _LazyVariable {
    public func asDriver() -> SharedSequence<DriverSharingStrategy, E> {
        return asSharedSequence()
    }
}

extension _LazyVariable {
    internal func asObserver() -> AnyObserver<E> {
        return AnyObserver { [weak self] (event) in
            guard let `self`=self else { return }
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
}

extension _LazyVariable: Injectable {
    public typealias Dependency = E
    public func inject(_ dependency: E) {
        self.element = dependency
    }
}

extension _LazyVariable: ViewModelProtocol {
    public typealias Input = E
    public var output: Observable<E> {
        return asObservable()
    }
}

extension ObservableType {
    /**
     Creates new subscription and sends elements to lazy variable.
     
     In case error occurs in debug mode, `fatalError` will be raised.
     In case error occurs in release mode, `error` will be logged.
     
     - parameter to: Target lazy variable for sequence elements.
     - returns: Disposable object that can be used to unsubscribe the observer.
     */
    public func bind(to lazyVariable: _LazyVariable<E>) -> Disposable {
        return bind(to: lazyVariable.asObserver())
    }
    
    /**
     Creates new subscription and sends elements to lazy variable.
     
     In case error occurs in debug mode, `fatalError` will be raised.
     In case error occurs in release mode, `error` will be logged.
     
     - parameter to: Target lazy variable for sequence elements.
     - returns: Disposable object that can be used to unsubscribe the observer.
     */
    public func bind(to lazyVariable: _LazyVariable<E?>) -> Disposable {
        return bind(to: lazyVariable.asObserver())
    }
}

extension SharedSequenceConvertibleType where Self.SharingStrategy == RxCocoa.DriverSharingStrategy {
    /**
     Creates new subscription and sends elements to lazy variable.
     This method can be only called from `MainThread`.
     
     - parameter variable: Target lazy variable for sequence elements.
     - returns: Disposable object that can be used to unsubscribe the observer from the lazy variable.
     */
    public func drive(_ lazyVariable: _LazyVariable<E>) -> Disposable {
        return drive(lazyVariable.asObserver())
    }
    
    /**
     Creates new subscription and sends elements to lazy variable.
     This method can be only called from `MainThread`.
     
     - parameter variable: Target lazy variable for sequence elements.
     - returns: Disposable object that can be used to unsubscribe the observer from the lazy variable.
     */
    public func drive(_ lazyVariable: _LazyVariable<E?>) -> Disposable {
        return drive(lazyVariable.asObserver())
    }
}

@available(*, deprecated)
public typealias LazyVariable = _LazyVariable
