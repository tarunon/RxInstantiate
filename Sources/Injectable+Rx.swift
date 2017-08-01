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
 RxViewProtocol has general `inject` function implementation that bind own viewModel. ViewModel should be Injectable that has same Dependency.
 
 Example
 ```
    // Notes: `MyViewController.init(with: "Hello")` make MyViewController instance that inject "Hello" into `MyViewController.viewModel`.
    class MyViewController: StoryboardInstantiatable, RxViewProtocol {
        let viewModel = LazyVariable<String>()
        let disposeBag = DisposeBag()
 
        override func viewDidLoad() {
            viewModel.asObservable()
                .bind(to: self.rx.title)
                .disposed(by: disposeBag)
        }
    }
 ```
 */
public protocol RxViewProtocol: Injectable {
    associatedtype ViewModel: Injectable
    var viewModel: ViewModel { get }
}

extension RxViewProtocol where ViewModel.Dependency == Dependency {
    public func inject(_ dependency: Dependency) {
        viewModel.inject(dependency)
    }
}
