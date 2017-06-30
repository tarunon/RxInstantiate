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
    // MARK: configureCells
    private func configureCell<C: Reusable, X>(for type: C.Type)
        -> (X, UITableView, IndexPath, C.Dependency)
        -> UITableViewCell
        where C: UITableViewCell
    {
        return { (_, tableView, indexPath, item) in
            return C.dequeue(from: tableView, for: indexPath, with: item)
        }
    }
    
    private func configureCell<C0: Reusable, C1: Reusable, X, E: Enum2Convertible>(for type0: C0.Type, _ type1: C1.Type)
        -> (X, UITableView, IndexPath, E)
        -> UITableViewCell
        where C0: UITableViewCell
        , C1: UITableViewCell
        , E.T0 == C0.Dependency
        , E.T1 == C1.Dependency
    {
        return { (_, tableView, indexPath, item) in
            switch item.asEnum {
            case .case0(let x): return C0.dequeue(from: tableView, for: indexPath, with: x)
            case .case1(let x): return C1.dequeue(from: tableView, for: indexPath, with: x)
            }
        }
    }
    
    private func configureCell<C0: Reusable, C1: Reusable, C2: Reusable, X, E: Enum3Convertible>(for type0: C0.Type, _ type1: C1.Type, _ type2: C2.Type)
        -> (X, UITableView, IndexPath, E)
        -> UITableViewCell
        where C0: UITableViewCell
        , C1: UITableViewCell
        , C2: UITableViewCell
        , E.T0 == C0.Dependency
        , E.T1 == C1.Dependency
        , E.T2 == C2.Dependency
    {
        return { (_, tableView, indexPath, item) in
            switch item.asEnum {
            case .case0(let x): return C0.dequeue(from: tableView, for: indexPath, with: x)
            case .case1(let x): return C1.dequeue(from: tableView, for: indexPath, with: x)
            case .case2(let x): return C2.dequeue(from: tableView, for: indexPath, with: x)
            }
        }
    }
    
    private func configureCell<C0: Reusable, C1: Reusable, C2: Reusable, C3: Reusable, X, E: Enum4Convertible>(for type0: C0.Type, _ type1: C1.Type, _ type2: C2.Type, _ type3: C3.Type)
        -> (X, UITableView, IndexPath, E)
        -> UITableViewCell
        where C0: UITableViewCell
        , C1: UITableViewCell
        , C2: UITableViewCell
        , C3: UITableViewCell
        , E.T0 == C0.Dependency
        , E.T1 == C1.Dependency
        , E.T2 == C2.Dependency
        , E.T3 == C3.Dependency
    {
        return { (_, tableView, indexPath, item) in
            switch item.asEnum {
            case .case0(let x): return C0.dequeue(from: tableView, for: indexPath, with: x)
            case .case1(let x): return C1.dequeue(from: tableView, for: indexPath, with: x)
            case .case2(let x): return C2.dequeue(from: tableView, for: indexPath, with: x)
            case .case3(let x): return C3.dequeue(from: tableView, for: indexPath, with: x)
            }
        }
    }
    
    private func configureCell<C0: Reusable, C1: Reusable, C2: Reusable, C3: Reusable, C4: Reusable, X, E: Enum5Convertible>(for type0: C0.Type, _ type1: C1.Type, _ type2: C2.Type, _ type3: C3.Type, _ type4: C4.Type)
        -> (X, UITableView, IndexPath, E)
        -> UITableViewCell
        where C0: UITableViewCell
        , C1: UITableViewCell
        , C2: UITableViewCell
        , C3: UITableViewCell
        , C4: UITableViewCell
        , E.T0 == C0.Dependency
        , E.T1 == C1.Dependency
        , E.T2 == C2.Dependency
        , E.T3 == C3.Dependency
        , E.T4 == C4.Dependency
    {
        return { (_, tableView, indexPath, item) in
            switch item.asEnum {
            case .case0(let x): return C0.dequeue(from: tableView, for: indexPath, with: x)
            case .case1(let x): return C1.dequeue(from: tableView, for: indexPath, with: x)
            case .case2(let x): return C2.dequeue(from: tableView, for: indexPath, with: x)
            case .case3(let x): return C3.dequeue(from: tableView, for: indexPath, with: x)
            case .case4(let x): return C4.dequeue(from: tableView, for: indexPath, with: x)
            }
        }
    }
    
    // MARK: reloadItems with configuration

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
    
    public func reloadItems<S: SectionModelType, O: ObservableType, C0: Reusable, C1: Reusable>(for type0: C0.Type, _ type1: C1.Type)
        -> (O)
        -> (@escaping (RxTableViewSectionedReloadDataSource<S>) -> ())
        -> Disposable
        where C0: UITableViewCell
        , C1: UITableViewCell
        , S.Item: Enum2Convertible
        , S.Item.T0 == C0.Dependency
        , S.Item.T1 == C1.Dependency
        , O.E == [S]
    {
        return { (source) in
            { (configureDataSources) in
                let dataSource = RxTableViewSectionedReloadDataSource<S>()
                dataSource.configureCell = self.configureCell(for: type0, type1)
                configureDataSources(dataSource)
                return source
                    .bind(to: self.items(dataSource: dataSource))
            }
        }
    }
    
    public func reloadItems<S: SectionModelType, O: ObservableType, C0: Reusable, C1: Reusable, C2: Reusable>(for type0: C0.Type, _ type1: C1.Type, _ type2: C2.Type)
        -> (O)
        -> (@escaping (RxTableViewSectionedReloadDataSource<S>) -> ())
        -> Disposable
        where C0: UITableViewCell
        , C1: UITableViewCell
        , C2: UITableViewCell
        , S.Item: Enum3Convertible
        , S.Item.T0 == C0.Dependency
        , S.Item.T1 == C1.Dependency
        , S.Item.T2 == C2.Dependency
        , O.E == [S]
    {
        return { (source) in
            { (configureDataSources) in
                let dataSource = RxTableViewSectionedReloadDataSource<S>()
                dataSource.configureCell = self.configureCell(for: type0, type1, type2)
                configureDataSources(dataSource)
                return source
                    .bind(to: self.items(dataSource: dataSource))
            }
        }
    }
    
    public func reloadItems<S: SectionModelType, O: ObservableType, C0: Reusable, C1: Reusable, C2: Reusable, C3: Reusable>(for type0: C0.Type, _ type1: C1.Type, _ type2: C2.Type, _ type3: C3.Type)
        -> (O)
        -> (@escaping (RxTableViewSectionedReloadDataSource<S>) -> ())
        -> Disposable
        where C0: UITableViewCell
        , C1: UITableViewCell
        , C2: UITableViewCell
        , C3: UITableViewCell
        , S.Item: Enum4Convertible
        , S.Item.T0 == C0.Dependency
        , S.Item.T1 == C1.Dependency
        , S.Item.T2 == C2.Dependency
        , S.Item.T3 == C3.Dependency
        , O.E == [S]
    {
        return { (source) in
            { (configureDataSources) in
                let dataSource = RxTableViewSectionedReloadDataSource<S>()
                dataSource.configureCell = self.configureCell(for: type0, type1, type2, type3)
                configureDataSources(dataSource)
                return source
                    .bind(to: self.items(dataSource: dataSource))
            }
        }
    }
    
    public func reloadItems<S: SectionModelType, O: ObservableType, C0: Reusable, C1: Reusable, C2: Reusable, C3: Reusable, C4: Reusable>(for type0: C0.Type, _ type1: C1.Type, _ type2: C2.Type, _ type3: C3.Type, _ type4: C4.Type)
        -> (O)
        -> (@escaping (RxTableViewSectionedReloadDataSource<S>) -> ())
        -> Disposable
        where C0: UITableViewCell
        , C1: UITableViewCell
        , C2: UITableViewCell
        , C3: UITableViewCell
        , C4: UITableViewCell
        , S.Item: Enum5Convertible
        , S.Item.T0 == C0.Dependency
        , S.Item.T1 == C1.Dependency
        , S.Item.T2 == C2.Dependency
        , S.Item.T3 == C3.Dependency
        , S.Item.T4 == C4.Dependency
        , O.E == [S]
    {
        return { (source) in
            { (configureDataSources) in
                let dataSource = RxTableViewSectionedReloadDataSource<S>()
                dataSource.configureCell = self.configureCell(for: type0, type1, type2, type3, type4)
                configureDataSources(dataSource)
                return source
                    .bind(to: self.items(dataSource: dataSource))
            }
        }
    }
    
    // MARK: animatedItems with configuration
    
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
    
    public func animatedItems<S: AnimatableSectionModelType, O: ObservableType, C0: Reusable, C1: Reusable>(for type0: C0.Type, _ type1: C1.Type)
        -> (O)
        -> (@escaping (RxTableViewSectionedAnimatedDataSource<S>) -> ())
        -> Disposable
        where C0: UITableViewCell
        , C1: UITableViewCell
        , S.Item: Enum2Convertible
        , S.Item.T0 == C0.Dependency
        , S.Item.T1 == C1.Dependency
        , O.E == [S]
    {
        return { (source) in
            { (configureDataSources) in
                let dataSource = RxTableViewSectionedAnimatedDataSource<S>()
                dataSource.configureCell = self.configureCell(for: type0, type1)
                configureDataSources(dataSource)
                return source
                    .bind(to: self.items(dataSource: dataSource))
            }
        }
    }
    
    public func animatedItems<S: AnimatableSectionModelType, O: ObservableType, C0: Reusable, C1: Reusable, C2: Reusable>(for type0: C0.Type, _ type1: C1.Type, _ type2: C2.Type)
        -> (O)
        -> (@escaping (RxTableViewSectionedAnimatedDataSource<S>) -> ())
        -> Disposable
        where C0: UITableViewCell
        , C1: UITableViewCell
        , C2: UITableViewCell
        , S.Item: Enum3Convertible
        , S.Item.T0 == C0.Dependency
        , S.Item.T1 == C1.Dependency
        , S.Item.T2 == C2.Dependency
        , O.E == [S]
    {
        return { (source) in
            { (configureDataSources) in
                let dataSource = RxTableViewSectionedAnimatedDataSource<S>()
                dataSource.configureCell = self.configureCell(for: type0, type1, type2)
                configureDataSources(dataSource)
                return source
                    .bind(to: self.items(dataSource: dataSource))
            }
        }
    }
    
    public func animatedItems<S: AnimatableSectionModelType, O: ObservableType, C0: Reusable, C1: Reusable, C2: Reusable, C3: Reusable>(for type0: C0.Type, _ type1: C1.Type, _ type2: C2.Type, _ type3: C3.Type)
        -> (O)
        -> (@escaping (RxTableViewSectionedAnimatedDataSource<S>) -> ())
        -> Disposable
        where C0: UITableViewCell
        , C1: UITableViewCell
        , C2: UITableViewCell
        , C3: UITableViewCell
        , S.Item: Enum4Convertible
        , S.Item.T0 == C0.Dependency
        , S.Item.T1 == C1.Dependency
        , S.Item.T2 == C2.Dependency
        , S.Item.T3 == C3.Dependency
        , O.E == [S]
    {
        return { (source) in
            { (configureDataSources) in
                let dataSource = RxTableViewSectionedAnimatedDataSource<S>()
                dataSource.configureCell = self.configureCell(for: type0, type1, type2, type3)
                configureDataSources(dataSource)
                return source
                    .bind(to: self.items(dataSource: dataSource))
            }
        }
    }
    
    public func animatedItems<S: AnimatableSectionModelType, O: ObservableType, C0: Reusable, C1: Reusable, C2: Reusable, C3: Reusable, C4: Reusable>(for type0: C0.Type, _ type1: C1.Type, _ type2: C2.Type, _ type3: C3.Type, _ type4: C4.Type)
        -> (O)
        -> (@escaping (RxTableViewSectionedAnimatedDataSource<S>) -> ())
        -> Disposable
        where C0: UITableViewCell
        , C1: UITableViewCell
        , C2: UITableViewCell
        , C3: UITableViewCell
        , C4: UITableViewCell
        , S.Item: Enum5Convertible
        , S.Item.T0 == C0.Dependency
        , S.Item.T1 == C1.Dependency
        , S.Item.T2 == C2.Dependency
        , S.Item.T3 == C3.Dependency
        , S.Item.T4 == C4.Dependency
        , O.E == [S]
    {
        return { (source) in
            { (configureDataSources) in
                let dataSource = RxTableViewSectionedAnimatedDataSource<S>()
                dataSource.configureCell = self.configureCell(for: type0, type1, type2, type3, type4)
                configureDataSources(dataSource)
                return source
                    .bind(to: self.items(dataSource: dataSource))
            }
        }
    }
    
    // MARK: reloadItems without configuration
    
    public func reloadItems<S: SectionModelType, O: ObservableType, C: Reusable>(for type: C.Type)
        -> (O)
        -> Disposable
        where C: UITableViewCell
        , S.Item == C.Dependency
        , O.E == [S]
    {
        return { self.reloadItems(for: type)($0)({ _ in }) }
    }
    
    public func reloadItems<S: SectionModelType, O: ObservableType, C0: Reusable, C1: Reusable>(for type0: C0.Type, _ type1: C1.Type)
        -> (O)
        -> Disposable
        where C0: UITableViewCell
        , C1: UITableViewCell
        , S.Item: Enum2Convertible
        , S.Item.T0 == C0.Dependency
        , S.Item.T1 == C1.Dependency
        , O.E == [S]
    {
        return { self.reloadItems(for: type0, type1)($0)({ _ in }) }
    }
    
    public func reloadItems<S: SectionModelType, O: ObservableType, C0: Reusable, C1: Reusable, C2: Reusable>(for type0: C0.Type, _ type1: C1.Type, _ type2: C2.Type)
        -> (O)
        -> Disposable
        where C0: UITableViewCell
        , C1: UITableViewCell
        , C2: UITableViewCell
        , S.Item: Enum3Convertible
        , S.Item.T0 == C0.Dependency
        , S.Item.T1 == C1.Dependency
        , S.Item.T2 == C2.Dependency
        , O.E == [S]
    {
        return { self.reloadItems(for: type0, type1, type2)($0)({ _ in }) }
    }
    
    public func reloadItems<S: SectionModelType, O: ObservableType, C0: Reusable, C1: Reusable, C2: Reusable, C3: Reusable>(for type0: C0.Type, _ type1: C1.Type, _ type2: C2.Type, _ type3: C3.Type)
        -> (O)
        -> Disposable
        where C0: UITableViewCell
        , C1: UITableViewCell
        , C2: UITableViewCell
        , C3: UITableViewCell
        , S.Item: Enum4Convertible
        , S.Item.T0 == C0.Dependency
        , S.Item.T1 == C1.Dependency
        , S.Item.T2 == C2.Dependency
        , S.Item.T3 == C3.Dependency
        , O.E == [S]
    {
        return { self.reloadItems(for: type0, type1, type2, type3)($0)({ _ in }) }
    }
    
    public func reloadItems<S: SectionModelType, O: ObservableType, C0: Reusable, C1: Reusable, C2: Reusable, C3: Reusable, C4: Reusable>(for type0: C0.Type, _ type1: C1.Type, _ type2: C2.Type, _ type3: C3.Type, _ type4: C4.Type)
        -> (O)
        -> Disposable
        where C0: UITableViewCell
        , C1: UITableViewCell
        , C2: UITableViewCell
        , C3: UITableViewCell
        , C4: UITableViewCell
        , S.Item: Enum5Convertible
        , S.Item.T0 == C0.Dependency
        , S.Item.T1 == C1.Dependency
        , S.Item.T2 == C2.Dependency
        , S.Item.T3 == C3.Dependency
        , S.Item.T4 == C4.Dependency
        , O.E == [S]
    {
        return { self.reloadItems(for: type0, type1, type2, type3, type4)($0)({ _ in }) }
    }
    
    // MARK: animatedItems without configuration
    
    public func animatedItems<S: AnimatableSectionModelType, O: ObservableType, C: Reusable>(for type: C.Type)
        -> (O)
        -> Disposable
        where C: UITableViewCell
        , S.Item == C.Dependency
        , O.E == [S]
    {
        return { self.animatedItems(for: type)($0)({ _ in }) }
    }
    
    public func animatedItems<S: AnimatableSectionModelType, O: ObservableType, C0: Reusable, C1: Reusable>(for type0: C0.Type, _ type1: C1.Type)
        -> (O)
        -> Disposable
        where C0: UITableViewCell
        , C1: UITableViewCell
        , S.Item: Enum2Convertible
        , S.Item.T0 == C0.Dependency
        , S.Item.T1 == C1.Dependency
        , O.E == [S]
    {
        return { self.animatedItems(for: type0, type1)($0)({ _ in }) }
    }
    
    public func animatedItems<S: AnimatableSectionModelType, O: ObservableType, C0: Reusable, C1: Reusable, C2: Reusable>(for type0: C0.Type, _ type1: C1.Type, _ type2: C2.Type)
        -> (O)
        -> Disposable
        where C0: UITableViewCell
        , C1: UITableViewCell
        , C2: UITableViewCell
        , S.Item: Enum3Convertible
        , S.Item.T0 == C0.Dependency
        , S.Item.T1 == C1.Dependency
        , S.Item.T2 == C2.Dependency
        , O.E == [S]
    {
        return { self.animatedItems(for: type0, type1, type2)($0)({ _ in }) }
    }
    
    public func animatedItems<S: AnimatableSectionModelType, O: ObservableType, C0: Reusable, C1: Reusable, C2: Reusable, C3: Reusable>(for type0: C0.Type, _ type1: C1.Type, _ type2: C2.Type, _ type3: C3.Type)
        -> (O)
        -> Disposable
        where C0: UITableViewCell
        , C1: UITableViewCell
        , C2: UITableViewCell
        , C3: UITableViewCell
        , S.Item: Enum4Convertible
        , S.Item.T0 == C0.Dependency
        , S.Item.T1 == C1.Dependency
        , S.Item.T2 == C2.Dependency
        , S.Item.T3 == C3.Dependency
        , O.E == [S]
    {
        return { self.animatedItems(for: type0, type1, type2, type3)($0)({ _ in }) }
    }
    
    public func animatedItems<S: AnimatableSectionModelType, O: ObservableType, C0: Reusable, C1: Reusable, C2: Reusable, C3: Reusable, C4: Reusable>(for type0: C0.Type, _ type1: C1.Type, _ type2: C2.Type, _ type3: C3.Type, _ type4: C4.Type)
        -> (O)
        -> Disposable
        where C0: UITableViewCell
        , C1: UITableViewCell
        , C2: UITableViewCell
        , C3: UITableViewCell
        , C4: UITableViewCell
        , S.Item: Enum5Convertible
        , S.Item.T0 == C0.Dependency
        , S.Item.T1 == C1.Dependency
        , S.Item.T2 == C2.Dependency
        , S.Item.T3 == C3.Dependency
        , S.Item.T4 == C4.Dependency
        , O.E == [S]
    {
        return { self.animatedItems(for: type0, type1, type2, type3, type4)($0)({ _ in }) }
    }
}

extension Reactive where Base: UICollectionView {
    
    // MARK: configureCell
    
    private func configureCell<C: Reusable, X>(for type: C.Type)
        -> (X, UICollectionView, IndexPath, C.Dependency)
        -> UICollectionViewCell
        where C: UICollectionViewCell
    {
        return { (_, collectionView, indexPath, item) in
            return C.dequeue(from: collectionView, for: indexPath, with: item)
        }
    }
    
    private func configureCell<C0: Reusable, C1: Reusable, X, E: Enum2Convertible>(for type0: C0.Type, _ type1: C1.Type)
        -> (X, UICollectionView, IndexPath, E)
        -> UICollectionViewCell
        where C0: UICollectionViewCell
        , C1: UICollectionViewCell
        , E.T0 == C0.Dependency
        , E.T1 == C1.Dependency
    {
        return { (_, collectionView, indexPath, item) in
            switch item.asEnum {
            case .case0(let x): return C0.dequeue(from: collectionView, for: indexPath, with: x)
            case .case1(let x): return C1.dequeue(from: collectionView, for: indexPath, with: x)
            }
        }
    }
    
    private func configureCell<C0: Reusable, C1: Reusable, C2: Reusable, X, E: Enum3Convertible>(for type0: C0.Type, _ type1: C1.Type, _ type2: C2.Type)
        -> (X, UICollectionView, IndexPath, E)
        -> UICollectionViewCell
        where C0: UICollectionViewCell
        , C1: UICollectionViewCell
        , C2: UICollectionViewCell
        , E.T0 == C0.Dependency
        , E.T1 == C1.Dependency
        , E.T2 == C2.Dependency
    {
        return { (_, collectionView, indexPath, item) in
            switch item.asEnum {
            case .case0(let x): return C0.dequeue(from: collectionView, for: indexPath, with: x)
            case .case1(let x): return C1.dequeue(from: collectionView, for: indexPath, with: x)
            case .case2(let x): return C2.dequeue(from: collectionView, for: indexPath, with: x)
            }
        }
    }
    
    private func configureCell<C0: Reusable, C1: Reusable, C2: Reusable, C3: Reusable, X, E: Enum4Convertible>(for type0: C0.Type, _ type1: C1.Type, _ type2: C2.Type, _ type3: C3.Type)
        -> (X, UICollectionView, IndexPath, E)
        -> UICollectionViewCell
        where C0: UICollectionViewCell
        , C1: UICollectionViewCell
        , C2: UICollectionViewCell
        , C3: UICollectionViewCell
        , E.T0 == C0.Dependency
        , E.T1 == C1.Dependency
        , E.T2 == C2.Dependency
        , E.T3 == C3.Dependency
    {
        return { (_, collectionView, indexPath, item) in
            switch item.asEnum {
            case .case0(let x): return C0.dequeue(from: collectionView, for: indexPath, with: x)
            case .case1(let x): return C1.dequeue(from: collectionView, for: indexPath, with: x)
            case .case2(let x): return C2.dequeue(from: collectionView, for: indexPath, with: x)
            case .case3(let x): return C3.dequeue(from: collectionView, for: indexPath, with: x)
            }
        }
    }
    
    private func configureCell<C0: Reusable, C1: Reusable, C2: Reusable, C3: Reusable, C4: Reusable, X, E: Enum5Convertible>(for type0: C0.Type, _ type1: C1.Type, _ type2: C2.Type, _ type3: C3.Type, _ type4: C4.Type)
        -> (X, UICollectionView, IndexPath, E)
        -> UICollectionViewCell
        where C0: UICollectionViewCell
        , C1: UICollectionViewCell
        , C2: UICollectionViewCell
        , C3: UICollectionViewCell
        , C4: UICollectionViewCell
        , E.T0 == C0.Dependency
        , E.T1 == C1.Dependency
        , E.T2 == C2.Dependency
        , E.T3 == C3.Dependency
        , E.T4 == C4.Dependency
    {
        return { (_, collectionView, indexPath, item) in
            switch item.asEnum {
            case .case0(let x): return C0.dequeue(from: collectionView, for: indexPath, with: x)
            case .case1(let x): return C1.dequeue(from: collectionView, for: indexPath, with: x)
            case .case2(let x): return C2.dequeue(from: collectionView, for: indexPath, with: x)
            case .case3(let x): return C3.dequeue(from: collectionView, for: indexPath, with: x)
            case .case4(let x): return C4.dequeue(from: collectionView, for: indexPath, with: x)
            }
        }
    }
    
    // MARK: reloadItems with configuration
    
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
    
    public func reloadItems<S: SectionModelType, O: ObservableType, C0: Reusable, C1: Reusable>(for type0: C0.Type, _ type1: C1.Type)
        -> (O)
        -> (@escaping (RxCollectionViewSectionedReloadDataSource<S>) -> ())
        -> Disposable
        where C0: UICollectionViewCell
        , C1: UICollectionViewCell
        , S.Item: Enum2Convertible
        , S.Item.T0 == C0.Dependency
        , S.Item.T1 == C1.Dependency
        , O.E == [S]
    {
        return { (source) in
            { (configureDataSources) in
                let dataSource = RxCollectionViewSectionedReloadDataSource<S>()
                dataSource.configureCell = self.configureCell(for: type0, type1)
                configureDataSources(dataSource)
                return source
                    .bind(to: self.items(dataSource: dataSource))
            }
        }
    }
    
    public func reloadItems<S: SectionModelType, O: ObservableType, C0: Reusable, C1: Reusable, C2: Reusable>(for type0: C0.Type, _ type1: C1.Type, _ type2: C2.Type)
        -> (O)
        -> (@escaping (RxCollectionViewSectionedReloadDataSource<S>) -> ())
        -> Disposable
        where C0: UICollectionViewCell
        , C1: UICollectionViewCell
        , C2: UICollectionViewCell
        , S.Item: Enum3Convertible
        , S.Item.T0 == C0.Dependency
        , S.Item.T1 == C1.Dependency
        , S.Item.T2 == C2.Dependency
        , O.E == [S]
    {
        return { (source) in
            { (configureDataSources) in
                let dataSource = RxCollectionViewSectionedReloadDataSource<S>()
                dataSource.configureCell = self.configureCell(for: type0, type1, type2)
                configureDataSources(dataSource)
                return source
                    .bind(to: self.items(dataSource: dataSource))
            }
        }
    }
    
    public func reloadItems<S: SectionModelType, O: ObservableType, C0: Reusable, C1: Reusable, C2: Reusable, C3: Reusable>(for type0: C0.Type, _ type1: C1.Type, _ type2: C2.Type, _ type3: C3.Type)
        -> (O)
        -> (@escaping (RxCollectionViewSectionedReloadDataSource<S>) -> ())
        -> Disposable
        where C0: UICollectionViewCell
        , C1: UICollectionViewCell
        , C2: UICollectionViewCell
        , C3: UICollectionViewCell
        , S.Item: Enum4Convertible
        , S.Item.T0 == C0.Dependency
        , S.Item.T1 == C1.Dependency
        , S.Item.T2 == C2.Dependency
        , S.Item.T3 == C3.Dependency
        , O.E == [S]
    {
        return { (source) in
            { (configureDataSources) in
                let dataSource = RxCollectionViewSectionedReloadDataSource<S>()
                dataSource.configureCell = self.configureCell(for: type0, type1, type2, type3)
                configureDataSources(dataSource)
                return source
                    .bind(to: self.items(dataSource: dataSource))
            }
        }
    }
    
    public func reloadItems<S: SectionModelType, O: ObservableType, C0: Reusable, C1: Reusable, C2: Reusable, C3: Reusable, C4: Reusable>(for type0: C0.Type, _ type1: C1.Type, _ type2: C2.Type, _ type3: C3.Type, _ type4: C4.Type)
        -> (O)
        -> (@escaping (RxCollectionViewSectionedReloadDataSource<S>) -> ())
        -> Disposable
        where C0: UICollectionViewCell
        , C1: UICollectionViewCell
        , C2: UICollectionViewCell
        , C3: UICollectionViewCell
        , C4: UICollectionViewCell
        , S.Item: Enum5Convertible
        , S.Item.T0 == C0.Dependency
        , S.Item.T1 == C1.Dependency
        , S.Item.T2 == C2.Dependency
        , S.Item.T3 == C3.Dependency
        , S.Item.T4 == C4.Dependency
        , O.E == [S]
    {
        return { (source) in
            { (configureDataSources) in
                let dataSource = RxCollectionViewSectionedReloadDataSource<S>()
                dataSource.configureCell = self.configureCell(for: type0, type1, type2, type3, type4)
                configureDataSources(dataSource)
                return source
                    .bind(to: self.items(dataSource: dataSource))
            }
        }
    }
    
    // MARK: animatedItems with configuration
    
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
    
    public func animatedItems<S: AnimatableSectionModelType, O: ObservableType, C0: Reusable, C1: Reusable>(for type0: C0.Type, _ type1: C1.Type)
        -> (O)
        -> (@escaping (RxCollectionViewSectionedAnimatedDataSource<S>) -> ())
        -> Disposable
        where C0: UICollectionViewCell
        , C1: UICollectionViewCell
        , S.Item: Enum2Convertible
        , S.Item.T0 == C0.Dependency
        , S.Item.T1 == C1.Dependency
        , O.E == [S]
    {
        return { (source) in
            { (configureDataSources) in
                let dataSource = RxCollectionViewSectionedAnimatedDataSource<S>()
                dataSource.configureCell = self.configureCell(for: type0, type1)
                configureDataSources(dataSource)
                return source
                    .bind(to: self.items(dataSource: dataSource))
            }
        }
    }
    
    public func animatedItems<S: AnimatableSectionModelType, O: ObservableType, C0: Reusable, C1: Reusable, C2: Reusable>(for type0: C0.Type, _ type1: C1.Type, _ type2: C2.Type)
        -> (O)
        -> (@escaping (RxCollectionViewSectionedAnimatedDataSource<S>) -> ())
        -> Disposable
        where C0: UICollectionViewCell
        , C1: UICollectionViewCell
        , C2: UICollectionViewCell
        , S.Item: Enum3Convertible
        , S.Item.T0 == C0.Dependency
        , S.Item.T1 == C1.Dependency
        , S.Item.T2 == C2.Dependency
        , O.E == [S]
    {
        return { (source) in
            { (configureDataSources) in
                let dataSource = RxCollectionViewSectionedAnimatedDataSource<S>()
                dataSource.configureCell = self.configureCell(for: type0, type1, type2)
                configureDataSources(dataSource)
                return source
                    .bind(to: self.items(dataSource: dataSource))
            }
        }
    }
    
    public func animatedItems<S: AnimatableSectionModelType, O: ObservableType, C0: Reusable, C1: Reusable, C2: Reusable, C3: Reusable>(for type0: C0.Type, _ type1: C1.Type, _ type2: C2.Type, _ type3: C3.Type)
        -> (O)
        -> (@escaping (RxCollectionViewSectionedAnimatedDataSource<S>) -> ())
        -> Disposable
        where C0: UICollectionViewCell
        , C1: UICollectionViewCell
        , C2: UICollectionViewCell
        , C3: UICollectionViewCell
        , S.Item: Enum4Convertible
        , S.Item.T0 == C0.Dependency
        , S.Item.T1 == C1.Dependency
        , S.Item.T2 == C2.Dependency
        , S.Item.T3 == C3.Dependency
        , O.E == [S]
    {
        return { (source) in
            { (configureDataSources) in
                let dataSource = RxCollectionViewSectionedAnimatedDataSource<S>()
                dataSource.configureCell = self.configureCell(for: type0, type1, type2, type3)
                configureDataSources(dataSource)
                return source
                    .bind(to: self.items(dataSource: dataSource))
            }
        }
    }
    
    public func animatedItems<S: AnimatableSectionModelType, O: ObservableType, C0: Reusable, C1: Reusable, C2: Reusable, C3: Reusable, C4: Reusable>(for type0: C0.Type, _ type1: C1.Type, _ type2: C2.Type, _ type3: C3.Type, _ type4: C4.Type)
        -> (O)
        -> (@escaping (RxCollectionViewSectionedAnimatedDataSource<S>) -> ())
        -> Disposable
        where C0: UICollectionViewCell
        , C1: UICollectionViewCell
        , C2: UICollectionViewCell
        , C3: UICollectionViewCell
        , C4: UICollectionViewCell
        , S.Item: Enum5Convertible
        , S.Item.T0 == C0.Dependency
        , S.Item.T1 == C1.Dependency
        , S.Item.T2 == C2.Dependency
        , S.Item.T3 == C3.Dependency
        , S.Item.T4 == C4.Dependency
        , O.E == [S]
    {
        return { (source) in
            { (configureDataSources) in
                let dataSource = RxCollectionViewSectionedAnimatedDataSource<S>()
                dataSource.configureCell = self.configureCell(for: type0, type1, type2, type3, type4)
                configureDataSources(dataSource)
                return source
                    .bind(to: self.items(dataSource: dataSource))
            }
        }
    }
    
    // MARK: reloadItems without configuration
    
    public func reloadItems<S: SectionModelType, O: ObservableType, C: Reusable>(for type: C.Type)
        -> (O)
        -> Disposable
        where C: UICollectionViewCell
        , S.Item == C.Dependency
        , O.E == [S]
    {
        return { self.reloadItems(for: type)($0)({ _ in }) }
    }
    
    public func reloadItems<S: SectionModelType, O: ObservableType, C0: Reusable, C1: Reusable>(for type0: C0.Type, _ type1: C1.Type)
        -> (O)
        -> Disposable
        where C0: UICollectionViewCell
        , C1: UICollectionViewCell
        , S.Item: Enum2Convertible
        , S.Item.T0 == C0.Dependency
        , S.Item.T1 == C1.Dependency
        , O.E == [S]
    {
        return { self.reloadItems(for: type0, type1)($0)({ _ in }) }
    }
    
    public func reloadItems<S: SectionModelType, O: ObservableType, C0: Reusable, C1: Reusable, C2: Reusable>(for type0: C0.Type, _ type1: C1.Type, _ type2: C2.Type)
        -> (O)
        -> Disposable
        where C0: UICollectionViewCell
        , C1: UICollectionViewCell
        , C2: UICollectionViewCell
        , S.Item: Enum3Convertible
        , S.Item.T0 == C0.Dependency
        , S.Item.T1 == C1.Dependency
        , S.Item.T2 == C2.Dependency
        , O.E == [S]
    {
        return { self.reloadItems(for: type0, type1, type2)($0)({ _ in }) }
    }
    
    public func reloadItems<S: SectionModelType, O: ObservableType, C0: Reusable, C1: Reusable, C2: Reusable, C3: Reusable>(for type0: C0.Type, _ type1: C1.Type, _ type2: C2.Type, _ type3: C3.Type)
        -> (O)
        -> Disposable
        where C0: UICollectionViewCell
        , C1: UICollectionViewCell
        , C2: UICollectionViewCell
        , C3: UICollectionViewCell
        , S.Item: Enum4Convertible
        , S.Item.T0 == C0.Dependency
        , S.Item.T1 == C1.Dependency
        , S.Item.T2 == C2.Dependency
        , S.Item.T3 == C3.Dependency
        , O.E == [S]
    {
        return { self.reloadItems(for: type0, type1, type2, type3)($0)({ _ in }) }
    }
    
    public func reloadItems<S: SectionModelType, O: ObservableType, C0: Reusable, C1: Reusable, C2: Reusable, C3: Reusable, C4: Reusable>(for type0: C0.Type, _ type1: C1.Type, _ type2: C2.Type, _ type3: C3.Type, _ type4: C4.Type)
        -> (O)
        -> Disposable
        where C0: UICollectionViewCell
        , C1: UICollectionViewCell
        , C2: UICollectionViewCell
        , C3: UICollectionViewCell
        , C4: UICollectionViewCell
        , S.Item: Enum5Convertible
        , S.Item.T0 == C0.Dependency
        , S.Item.T1 == C1.Dependency
        , S.Item.T2 == C2.Dependency
        , S.Item.T3 == C3.Dependency
        , S.Item.T4 == C4.Dependency
        , O.E == [S]
    {
        return { self.reloadItems(for: type0, type1, type2, type3, type4)($0)({ _ in }) }
    }
    
    // MARK: animatedItems without configuration
    
    public func animatedItems<S: AnimatableSectionModelType, O: ObservableType, C: Reusable>(for type: C.Type)
        -> (O)
        -> Disposable
        where C: UICollectionViewCell
        , S.Item == C.Dependency
        , O.E == [S]
    {
        return { self.animatedItems(for: type)($0)({ _ in }) }
    }
    
    public func animatedItems<S: AnimatableSectionModelType, O: ObservableType, C0: Reusable, C1: Reusable>(for type0: C0.Type, _ type1: C1.Type)
        -> (O)
        -> Disposable
        where C0: UICollectionViewCell
        , C1: UICollectionViewCell
        , S.Item: Enum2Convertible
        , S.Item.T0 == C0.Dependency
        , S.Item.T1 == C1.Dependency
        , O.E == [S]
    {
        return { self.animatedItems(for: type0, type1)($0)({ _ in }) }
    }
    
    public func animatedItems<S: AnimatableSectionModelType, O: ObservableType, C0: Reusable, C1: Reusable, C2: Reusable>(for type0: C0.Type, _ type1: C1.Type, _ type2: C2.Type)
        -> (O)
        -> Disposable
        where C0: UICollectionViewCell
        , C1: UICollectionViewCell
        , C2: UICollectionViewCell
        , S.Item: Enum3Convertible
        , S.Item.T0 == C0.Dependency
        , S.Item.T1 == C1.Dependency
        , S.Item.T2 == C2.Dependency
        , O.E == [S]
    {
        return { self.animatedItems(for: type0, type1, type2)($0)({ _ in }) }
    }
    
    public func animatedItems<S: AnimatableSectionModelType, O: ObservableType, C0: Reusable, C1: Reusable, C2: Reusable, C3: Reusable>(for type0: C0.Type, _ type1: C1.Type, _ type2: C2.Type, _ type3: C3.Type)
        -> (O)
        -> Disposable
        where C0: UICollectionViewCell
        , C1: UICollectionViewCell
        , C2: UICollectionViewCell
        , C3: UICollectionViewCell
        , S.Item: Enum4Convertible
        , S.Item.T0 == C0.Dependency
        , S.Item.T1 == C1.Dependency
        , S.Item.T2 == C2.Dependency
        , S.Item.T3 == C3.Dependency
        , O.E == [S]
    {
        return { self.animatedItems(for: type0, type1, type2, type3)($0)({ _ in }) }
    }
    
    public func animatedItems<S: AnimatableSectionModelType, O: ObservableType, C0: Reusable, C1: Reusable, C2: Reusable, C3: Reusable, C4: Reusable>(for type0: C0.Type, _ type1: C1.Type, _ type2: C2.Type, _ type3: C3.Type, _ type4: C4.Type)
        -> (O)
        -> Disposable
        where C0: UICollectionViewCell
        , C1: UICollectionViewCell
        , C2: UICollectionViewCell
        , C3: UICollectionViewCell
        , C4: UICollectionViewCell
        , S.Item: Enum5Convertible
        , S.Item.T0 == C0.Dependency
        , S.Item.T1 == C1.Dependency
        , S.Item.T2 == C2.Dependency
        , S.Item.T3 == C3.Dependency
        , S.Item.T4 == C4.Dependency
        , O.E == [S]
    {
        return { self.animatedItems(for: type0, type1, type2, type3, type4)($0)({ _ in }) }
    }
}
