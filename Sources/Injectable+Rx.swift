//
//  Injectable+Rx.swift
//  RxInstantiate
//
//  Created by tarunon on 2017/06/28.
//
//

import UIKit
import Instantiate
import RxSwift
import RxCocoa

public protocol RxInjectable: Injectable {
    var storage: LazyVariable<Dependency> { get }
}

extension RxInjectable {
    public func inject(_ dependency: Dependency) {
        storage.element = dependency
    }
}

extension StoryboardInstantiatable where Self: UIViewController, Self: RxInjectable {
    public init(with dependency: Self.Dependency) {
        let storyboard = (Self.self as StoryboardType.Type).storyboard
        switch Self.instantiateSource {
        case .initial:
            self = storyboard.instantiateInitialViewController() as! Self
        case .identifier(let identifier):
            self = storyboard.instantiateViewController(withIdentifier: identifier) as! Self
        }
        self.inject(dependency)
    }
}
