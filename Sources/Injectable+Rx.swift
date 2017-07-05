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

/**
 RxInjectable has general `inject` function implementation that bind own storage.
 
 Example
 ```
    // Notes: `MyViewController.init(with: "Hello")` make MyViewController instance that bind "Hello" into `MyViewController.storage`.
    class MyViewController: StoryboardInstantiatable, RxInjectable {
        let storage = LazyVariable<String>()
        let disposeBag = DisposeBag()
 
        override func viewDidLoad() {
            storage.asObservable()
                .bind(to: self.rx.title)
                .disposed(by: disposeBag)
        }
    }
 ```
 */
public protocol RxInjectable: Injectable {
    var storage: LazyVariable<Dependency> { get }
}

extension RxInjectable {
    public func inject(_ dependency: Dependency) {
        storage.element = dependency
    }
}

// Don't need workaround that force load view. 
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
