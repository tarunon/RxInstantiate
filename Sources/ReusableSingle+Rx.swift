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
import EnumConvertible

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
    
    public func reloadItems<S: SectionModelType, O: ObservableType, C: Reusable>(for type: C.Type)
        -> (O)
        -> (@escaping (RxTableViewSectionedReloadDataSource<S>) -> ())
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
    
    public func animatedItems<S: AnimatableSectionModelType, O: ObservableType, C: Reusable>(for type: C.Type)
        -> (O)
        -> (@escaping (RxTableViewSectionedAnimatedDataSource<S>) -> ())
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
    
    public func reloadItems<S: SectionModelType, O: ObservableType, C: Reusable>(for type: C.Type)
        -> (O)
        -> Disposable
        where C: UITableViewCell
        , S.Item == C.Dependency
        , O.E == [S]
    {
        return { self.reloadItems(for: type)($0)({ _ in }) }
    }
    
    public func animatedItems<S: AnimatableSectionModelType, O: ObservableType, C: Reusable>(for type: C.Type)
        -> (O)
        -> Disposable
        where C: UITableViewCell
        , S.Item == C.Dependency
        , O.E == [S]
    {
        return { self.animatedItems(for: type)($0)({ _ in }) }
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
    
    public func reloadItems<S: SectionModelType, O: ObservableType, C: Reusable>(for type: C.Type)
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
    
    public func animatedItems<S: AnimatableSectionModelType, O: ObservableType, C: Reusable>(for type: C.Type)
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
    
    public func reloadItems<S: SectionModelType, O: ObservableType, C: Reusable>(for type: C.Type)
        -> (O)
        -> Disposable
        where C: UICollectionViewCell
        , S.Item == C.Dependency
        , O.E == [S]
    {
        return { self.reloadItems(for: type)($0)({ _ in }) }
    }
    
    public func animatedItems<S: AnimatableSectionModelType, O: ObservableType, C: Reusable>(for type: C.Type)
        -> (O)
        -> Disposable
        where C: UICollectionViewCell
        , S.Item == C.Dependency
        , O.E == [S]
    {
        return { self.animatedItems(for: type)($0)({ _ in }) }
    }
}
