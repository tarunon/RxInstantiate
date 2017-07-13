//
//  Injectable+Rx.swift
//  RxInstantiate
//
//  Created by tarunon on 2017/06/28.
//
//

import Instantiate
import RxSwift
import RxCocoa
import RxDataSources

public struct DataSourceUpdateMethod {
    public struct Reload {
        public static let reload = Reload()
    }

    public struct Animated {
        public static let animated = Animated()
    }
}

extension Reactive where Base: UITableView {

    private func configureCell<C: Reusable, X>(for type: C.Type)
        -> (X, UITableView, IndexPath, C.Dependency)
        -> UITableViewCell
        where C: UITableViewCell
    {
        return { (_, tableView, indexPath, item) in
            return C.dequeue(from: tableView, for: indexPath, with: item)
        }
    }
    
    /**
     Binds sequences of elements to table view rows using a custom reactive data used to perform the transformation.
     This method will make data source and retain it for as long as the subscription isn't disposed (result `Disposable` being disposed).
     In case `source` observable sequence terminates successfully, the data source will present latest element until the subscription isn't disposed.
     - parameters type: The reusable cell type that should be implemented `Reusable`, and `Dependency` should be equal to `SectionModel.Item`.
     - parameters source: Observable sequence of items.
     - parameters configureDataSource: Transform generated data source.
     - returns: Disposable object that ca be used to unbind.
     
     Example
     ```
        let items = Observable.just([
            SectionModel(model: "First section", items: [
                1.0,
                2.0,
                3.0
                ]),
            SectionModel(model: "Second section", items: [
                1.0,
                2.0,
                3.0
                ]),
            SectionModel(model: "Third section", items: [
                1.0,
                2.0,
                3.0
                ])
            ])
        items
            .bind(to: tableView.rx.items(.reload, for: Cell.self)) { (dataSource) in
                // dataSource configuration
            }
            .disposed(by: disposeBag)
     ```
     */
    public func items<S: SectionModelType, O: ObservableType, C: Reusable>(_ updateMethod: DataSourceUpdateMethod.Reload, for type: C.Type)
        -> (_ source: O)
        -> (_ configureDataSource: @escaping (RxTableViewSectionedReloadDataSource<S>) -> ())
        -> Disposable
        where C: UITableViewCell
        , S.Item == C.Dependency
        , O.E == [S]
    {
        return { (source) in
            { (configureDataSources) in
                let dataSource = RxTableViewSectionedReloadDataSource<S>()
                dataSource.configureCell = self.configureCell(for: type)
                configureDataSources(dataSource)
                return source
                    .bind(to: self.items(dataSource: dataSource))
            }
        }
    }
    
    /**
     Binds sequences of elements to table view rows using a custom reactive data used to perform the transformation.
     This method will make data source and retain it for as long as the subscription isn't disposed (result `Disposable` being disposed).
     In case `source` observable sequence terminates successfully, the data source will present latest element until the subscription isn't disposed.
     - parameters type: The reusable cell type that should be implemented `Reusable`, and `Dependency` should be equal to `SectionModel.Item`.
     - parameters source: Observable sequence of items.
     - parameters configureDataSource: Transform generated data source.
     - returns: Disposable object that ca be used to unbind.
     
     Example
     ```
        let items = Observable.just([
            AnimatableSectionModel(model: "First section", items: [
                1.0,
                2.0,
                3.0
                ]),
            AnimatableSectionModel(model: "Second section", items: [
                1.0,
                2.0,
                3.0
                ]),
            AnimatableSectionModel(model: "Third section", items: [
                1.0,
                2.0,
                3.0
                ])
            ])
        items
            .bind(to: tableView.rx.items(.animated, for: Cell.self)) { (dataSource) in
                // dataSource configuration
            }
            .disposed(by: disposeBag)
     ```
     */
    public func items<S: AnimatableSectionModelType, O: ObservableType, C: Reusable>(_ updateMethod: DataSourceUpdateMethod.Animated, for type: C.Type)
        -> (_ source: O)
        -> (_ configureDataSource: @escaping (RxTableViewSectionedAnimatedDataSource<S>) -> ())
        -> Disposable
        where C: UITableViewCell
        , S.Item == C.Dependency
        , O.E == [S]
    {
        return { (source) in
            { (configureDataSources) in
                let dataSource = RxTableViewSectionedAnimatedDataSource<S>()
                dataSource.configureCell = self.configureCell(for: type)
                configureDataSources(dataSource)
                return source
                    .bind(to: self.items(dataSource: dataSource))
            }
        }
    }
    
    /**
     Binds sequences of elements to table view rows using a custom reactive data used to perform the transformation.
     This method will make data source and retain it for as long as the subscription isn't disposed (result `Disposable` being disposed).
     In case `source` observable sequence terminates successfully, the data source will present latest element until the subscription isn't disposed.
     - parameters type: The reusable cell type that should be implemented `Reusable`, and `Dependency` should be equal to `SectionModel.Item`.
     - parameters source: Observable sequence of items.
     - returns: Disposable object that ca be used to unbind.
     
     Example
     ```
        let items = Observable.just([
            SectionModel(model: "First section", items: [
                1.0,
                2.0,
                3.0
                ]),
            SectionModel(model: "Second section", items: [
                1.0,
                2.0,
                3.0
                ]),
            SectionModel(model: "Third section", items: [
                1.0,
                2.0,
                3.0
                ])
            ])
        items
            .bind(to: tableView.rx.reloadItems(for: Cell.self))
            .disposed(by: disposeBag)
     ```
     */
    public func items<S: SectionModelType, O: ObservableType, C: Reusable>(_ updateMethod: DataSourceUpdateMethod.Reload, for type: C.Type)
        -> (O)
        -> Disposable
        where C: UITableViewCell
        , S.Item == C.Dependency
        , O.E == [S]
    {
        return { self.items(updateMethod, for: type)($0)({ _ in }) }
    }
    
    /**
     Binds sequences of elements to table view rows using a custom reactive data used to perform the transformation.
     This method will make data source and retain it for as long as the subscription isn't disposed (result `Disposable` being disposed).
     In case `source` observable sequence terminates successfully, the data source will present latest element until the subscription isn't disposed.
     - parameters type: The reusable cell type that should be implemented `Reusable`, and `Dependency` should be equal to `SectionModel.Item`.
     - parameters source: Observable sequence of items.
     - returns: Disposable object that ca be used to unbind.
     
     Example
     ```
        let items = Observable.just([
            AnimatableSectionModel(model: "First section", items: [
                1.0,
                2.0,
                3.0
                ]),
            AnimatableSectionModel(model: "Second section", items: [
                1.0,
                2.0,
                3.0
                ]),
            AnimatableSectionModel(model: "Third section", items: [
                1.0,
                2.0,
                3.0
                ])
            ])
        items
            .bind(to: tableView.rx.items(.animated, for: Cell.self))
            .disposed(by: disposeBag)
     ```
     */
    public func items<S: AnimatableSectionModelType, O: ObservableType, C: Reusable>(_ updateMethod: DataSourceUpdateMethod.Animated, for type: C.Type)
        -> (O)
        -> Disposable
        where C: UITableViewCell
        , S.Item == C.Dependency
        , O.E == [S]
    {
        return { self.items(updateMethod, for: type)($0)({ _ in }) }
    }
}

extension Reactive where Base: UICollectionView {

    private func configureCell<C: Reusable, X>(for type: C.Type)
        -> (X, UICollectionView, IndexPath, C.Dependency)
        -> UICollectionViewCell
        where C: UICollectionViewCell
    {
        return { (_, collectionView, indexPath, item) in
            return C.dequeue(from: collectionView, for: indexPath, with: item)
        }
    }
    
    /**
     Binds sequences of elements to collection view rows using a custom reactive data used to perform the transformation.
     This method will make data source and retain it for as long as the subscription isn't disposed (result `Disposable` being disposed).
     In case `source` observable sequence terminates successfully, the data source will present latest element until the subscription isn't disposed.
     - parameters type: The reusable cell type that should be implemented `Reusable`, and `Dependency` should be equal to `SectionModel.Item`.
     - parameters source: Observable sequence of items.
     - parameters configureDataSource: Transform generated data source.
     - returns: Disposable object that ca be used to unbind.
     
     Example
     ```
        let items = Observable.just([
            SectionModel(model: "First section", items: [
                1.0,
                2.0,
                3.0
                ]),
            SectionModel(model: "Second section", items: [
                1.0,
                2.0,
                3.0
                ]),
            SectionModel(model: "Third section", items: [
                1.0,
                2.0,
                3.0
                ])
            ])
        items
            .bind(to: collectionView.rx.items(.reload, for: Cell.self)) { (dataSource) in
                // dataSource configuration
            }
            .disposed(by: disposeBag)
     ```
     */
    public func items<S: SectionModelType, O: ObservableType, C: Reusable>(_ updateMethod: DataSourceUpdateMethod.Reload, for type: C.Type)
        -> (O)
        -> (@escaping (RxCollectionViewSectionedReloadDataSource<S>) -> ())
        -> Disposable
        where C: UICollectionViewCell
        , S.Item == C.Dependency
        , O.E == [S]
    {
        return { (source) in
            { (configureDataSources) in
                let dataSource = RxCollectionViewSectionedReloadDataSource<S>()
                dataSource.configureCell = self.configureCell(for: type)
                configureDataSources(dataSource)
                return source
                    .bind(to: self.items(dataSource: dataSource))
            }
        }
    }
    
    /**
     Binds sequences of elements to collection view rows using a custom reactive data used to perform the transformation.
     This method will make data source and retain it for as long as the subscription isn't disposed (result `Disposable` being disposed).
     In case `source` observable sequence terminates successfully, the data source will present latest element until the subscription isn't disposed.
     - parameters type: The reusable cell type that should be implemented `Reusable`, and `Dependency` should be equal to `SectionModel.Item`.
     - parameters source: Observable sequence of items.
     - parameters configureDataSource: Transform generated data source.
     - returns: Disposable object that ca be used to unbind.
     
     Example
     ```
        let items = Observable.just([
            AnimatableSectionModel(model: "First section", items: [
                1.0,
                2.0,
                3.0
                ]),
            AnimatableSectionModel(model: "Second section", items: [
                1.0,
                2.0,
                3.0
                ]),
            AnimatableSectionModel(model: "Third section", items: [
                1.0,
                2.0,
                3.0
                ])
            ])
        items
            .bind(to: collectionView.rx.items(.animated, for: Cell.self)) { (dataSource) in
                // dataSource configuration
            }
            .disposed(by: disposeBag)
     ```
     */
    public func items<S: AnimatableSectionModelType, O: ObservableType, C: Reusable>(_ updateMethod: DataSourceUpdateMethod.Animated, for type: C.Type)
        -> (O)
        -> (@escaping (RxCollectionViewSectionedAnimatedDataSource<S>) -> ())
        -> Disposable
        where C: UICollectionViewCell
        , S.Item == C.Dependency
        , O.E == [S]
    {
        return { (source) in
            { (configureDataSources) in
                let dataSource = RxCollectionViewSectionedAnimatedDataSource<S>()
                dataSource.configureCell = self.configureCell(for: type)
                configureDataSources(dataSource)
                return source
                    .bind(to: self.items(dataSource: dataSource))
            }
        }
    }
    
    /**
     Binds sequences of elements to collection view rows using a custom reactive data used to perform the transformation.
     This method will make data source and retain it for as long as the subscription isn't disposed (result `Disposable` being disposed).
     In case `source` observable sequence terminates successfully, the data source will present latest element until the subscription isn't disposed.
     - parameters type: The reusable cell type that should be implemented `Reusable`, and `Dependency` should be equal to `SectionModel.Item`.
     - parameters source: Observable sequence of items.
     - returns: Disposable object that ca be used to unbind.
     
     Example
     ```
        let items = Observable.just([
            SectionModel(model: "First section", items: [
                1.0,
                2.0,
                3.0
                ]),
            SectionModel(model: "Second section", items: [
                1.0,
                2.0,
                3.0
                ]),
            SectionModel(model: "Third section", items: [
                1.0,
                2.0,
                3.0
                ])
            ])
        items
            .bind(to: collectionView.rx.reloadItems(for: Cell.self))
            .disposed(by: disposeBag)
     ```
     */
    public func items<S: SectionModelType, O: ObservableType, C: Reusable>(_ updateMethod: DataSourceUpdateMethod.Reload, for type: C.Type)
        -> (O)
        -> Disposable
        where C: UICollectionViewCell
        , S.Item == C.Dependency
        , O.E == [S]
    {
        return { self.items(updateMethod, for: type)($0)({ _ in }) }
    }
    
    /**
     Binds sequences of elements to collection view rows using a custom reactive data used to perform the transformation.
     This method will make data source and retain it for as long as the subscription isn't disposed (result `Disposable` being disposed).
     In case `source` observable sequence terminates successfully, the data source will present latest element until the subscription isn't disposed.
     - parameters type: The reusable cell type that should be implemented `Reusable`, and `Dependency` should be equal to `SectionModel.Item`.
     - parameters source: Observable sequence of items.
     - returns: Disposable object that ca be used to unbind.
     
     Example
     ```
        let items = Observable.just([
            AnimatableSectionModel(model: "First section", items: [
                1.0,
                2.0,
                3.0
                ]),
            AnimatableSectionModel(model: "Second section", items: [
                1.0,
                2.0,
                3.0
                ]),
            AnimatableSectionModel(model: "Third section", items: [
                1.0,
                2.0,
                3.0
                ])
            ])
        items
            .bind(to: collectionView.rx.animatedItems(for: Cell.self))
            .disposed(by: disposeBag)
     ```
     */
    public func items<S: AnimatableSectionModelType, O: ObservableType, C: Reusable>(_ updateMethod: DataSourceUpdateMethod.Animated, for type: C.Type)
        -> (O)
        -> Disposable
        where C: UICollectionViewCell
        , S.Item == C.Dependency
        , O.E == [S]
    {
        return { self.items(updateMethod, for: type)($0)({ _ in }) }
    }
}
