import Instantiate
import RxSwift
import RxCocoa
import RxDataSources
import EnumConvertible


extension Reactive where Base: UITableView {
    private func configureCell<C0, C1, X, E>(for type0: C0.Type, _ type1: C1.Type)
        -> (X, UITableView, IndexPath, E)
        -> UITableViewCell
        where E: Enum2Convertible
        , C0: Reusable
        , C0: UITableViewCell
        , E.T0 == C0.Dependency
        , C1: Reusable
        , C1: UITableViewCell
        , E.T1 == C1.Dependency
    {
        return { (_, tableView, indexPath, item) in
            switch item.asEnum {
            case .case0(let x): return C0.dequeue(from: tableView, for: indexPath, with: x)
            case .case1(let x): return C1.dequeue(from: tableView, for: indexPath, with: x)
            }
        }
    }

    public func reloadItems<C0, C1, S, O>(for type0: C0.Type, _ type1: C1.Type)
        -> (O)
        -> (@escaping (RxTableViewSectionedReloadDataSource<S>) -> ())
        -> Disposable
        where S: SectionModelType
        , O: ObservableType
        , O.E == [S]
        , S.Item: Enum2Convertible
        , C0: Reusable
        , C0: UITableViewCell
        , S.Item.T0 == C0.Dependency
        , C1: Reusable
        , C1: UITableViewCell
        , S.Item.T1 == C1.Dependency
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

    public func reloadItems<C0, C1, S, O>(for type0: C0.Type, _ type1: C1.Type)
        -> (O)
        -> Disposable
        where S: SectionModelType
        , O: ObservableType
        , O.E == [S]
        , S.Item: Enum2Convertible
        , C0: Reusable
        , C0: UITableViewCell
        , S.Item.T0 == C0.Dependency
        , C1: Reusable
        , C1: UITableViewCell
        , S.Item.T1 == C1.Dependency
    {
        return { self.reloadItems(for: type0, type1)($0)({ _ in }) }
    }

    public func animatedItems<C0, C1, S, O>(for type0: C0.Type, _ type1: C1.Type)
        -> (O)
        -> (@escaping (RxTableViewSectionedAnimatedDataSource<S>) -> ())
        -> Disposable
        where S: AnimatableSectionModelType
        , O: ObservableType
        , O.E == [S]
        , S.Item: Enum2Convertible
        , C0: Reusable
        , C0: UITableViewCell
        , S.Item.T0 == C0.Dependency
        , C1: Reusable
        , C1: UITableViewCell
        , S.Item.T1 == C1.Dependency
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

    public func animatedItems<C0, C1, S, O>(for type0: C0.Type, _ type1: C1.Type)
        -> (O)
        -> Disposable
        where S: AnimatableSectionModelType
        , O: ObservableType
        , O.E == [S]
        , S.Item: Enum2Convertible
        , C0: Reusable
        , C0: UITableViewCell
        , S.Item.T0 == C0.Dependency
        , C1: Reusable
        , C1: UITableViewCell
        , S.Item.T1 == C1.Dependency
    {
        return { self.animatedItems(for: type0, type1)($0)({ _ in }) }
    }

    private func configureCell<C0, C1, C2, X, E>(for type0: C0.Type, _ type1: C1.Type, _ type2: C2.Type)
        -> (X, UITableView, IndexPath, E)
        -> UITableViewCell
        where E: Enum3Convertible
        , C0: Reusable
        , C0: UITableViewCell
        , E.T0 == C0.Dependency
        , C1: Reusable
        , C1: UITableViewCell
        , E.T1 == C1.Dependency
        , C2: Reusable
        , C2: UITableViewCell
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

    public func reloadItems<C0, C1, C2, S, O>(for type0: C0.Type, _ type1: C1.Type, _ type2: C2.Type)
        -> (O)
        -> (@escaping (RxTableViewSectionedReloadDataSource<S>) -> ())
        -> Disposable
        where S: SectionModelType
        , O: ObservableType
        , O.E == [S]
        , S.Item: Enum3Convertible
        , C0: Reusable
        , C0: UITableViewCell
        , S.Item.T0 == C0.Dependency
        , C1: Reusable
        , C1: UITableViewCell
        , S.Item.T1 == C1.Dependency
        , C2: Reusable
        , C2: UITableViewCell
        , S.Item.T2 == C2.Dependency
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

    public func reloadItems<C0, C1, C2, S, O>(for type0: C0.Type, _ type1: C1.Type, _ type2: C2.Type)
        -> (O)
        -> Disposable
        where S: SectionModelType
        , O: ObservableType
        , O.E == [S]
        , S.Item: Enum3Convertible
        , C0: Reusable
        , C0: UITableViewCell
        , S.Item.T0 == C0.Dependency
        , C1: Reusable
        , C1: UITableViewCell
        , S.Item.T1 == C1.Dependency
        , C2: Reusable
        , C2: UITableViewCell
        , S.Item.T2 == C2.Dependency
    {
        return { self.reloadItems(for: type0, type1, type2)($0)({ _ in }) }
    }

    public func animatedItems<C0, C1, C2, S, O>(for type0: C0.Type, _ type1: C1.Type, _ type2: C2.Type)
        -> (O)
        -> (@escaping (RxTableViewSectionedAnimatedDataSource<S>) -> ())
        -> Disposable
        where S: AnimatableSectionModelType
        , O: ObservableType
        , O.E == [S]
        , S.Item: Enum3Convertible
        , C0: Reusable
        , C0: UITableViewCell
        , S.Item.T0 == C0.Dependency
        , C1: Reusable
        , C1: UITableViewCell
        , S.Item.T1 == C1.Dependency
        , C2: Reusable
        , C2: UITableViewCell
        , S.Item.T2 == C2.Dependency
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

    public func animatedItems<C0, C1, C2, S, O>(for type0: C0.Type, _ type1: C1.Type, _ type2: C2.Type)
        -> (O)
        -> Disposable
        where S: AnimatableSectionModelType
        , O: ObservableType
        , O.E == [S]
        , S.Item: Enum3Convertible
        , C0: Reusable
        , C0: UITableViewCell
        , S.Item.T0 == C0.Dependency
        , C1: Reusable
        , C1: UITableViewCell
        , S.Item.T1 == C1.Dependency
        , C2: Reusable
        , C2: UITableViewCell
        , S.Item.T2 == C2.Dependency
    {
        return { self.animatedItems(for: type0, type1, type2)($0)({ _ in }) }
    }

    private func configureCell<C0, C1, C2, C3, X, E>(for type0: C0.Type, _ type1: C1.Type, _ type2: C2.Type, _ type3: C3.Type)
        -> (X, UITableView, IndexPath, E)
        -> UITableViewCell
        where E: Enum4Convertible
        , C0: Reusable
        , C0: UITableViewCell
        , E.T0 == C0.Dependency
        , C1: Reusable
        , C1: UITableViewCell
        , E.T1 == C1.Dependency
        , C2: Reusable
        , C2: UITableViewCell
        , E.T2 == C2.Dependency
        , C3: Reusable
        , C3: UITableViewCell
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

    public func reloadItems<C0, C1, C2, C3, S, O>(for type0: C0.Type, _ type1: C1.Type, _ type2: C2.Type, _ type3: C3.Type)
        -> (O)
        -> (@escaping (RxTableViewSectionedReloadDataSource<S>) -> ())
        -> Disposable
        where S: SectionModelType
        , O: ObservableType
        , O.E == [S]
        , S.Item: Enum4Convertible
        , C0: Reusable
        , C0: UITableViewCell
        , S.Item.T0 == C0.Dependency
        , C1: Reusable
        , C1: UITableViewCell
        , S.Item.T1 == C1.Dependency
        , C2: Reusable
        , C2: UITableViewCell
        , S.Item.T2 == C2.Dependency
        , C3: Reusable
        , C3: UITableViewCell
        , S.Item.T3 == C3.Dependency
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

    public func reloadItems<C0, C1, C2, C3, S, O>(for type0: C0.Type, _ type1: C1.Type, _ type2: C2.Type, _ type3: C3.Type)
        -> (O)
        -> Disposable
        where S: SectionModelType
        , O: ObservableType
        , O.E == [S]
        , S.Item: Enum4Convertible
        , C0: Reusable
        , C0: UITableViewCell
        , S.Item.T0 == C0.Dependency
        , C1: Reusable
        , C1: UITableViewCell
        , S.Item.T1 == C1.Dependency
        , C2: Reusable
        , C2: UITableViewCell
        , S.Item.T2 == C2.Dependency
        , C3: Reusable
        , C3: UITableViewCell
        , S.Item.T3 == C3.Dependency
    {
        return { self.reloadItems(for: type0, type1, type2, type3)($0)({ _ in }) }
    }

    public func animatedItems<C0, C1, C2, C3, S, O>(for type0: C0.Type, _ type1: C1.Type, _ type2: C2.Type, _ type3: C3.Type)
        -> (O)
        -> (@escaping (RxTableViewSectionedAnimatedDataSource<S>) -> ())
        -> Disposable
        where S: AnimatableSectionModelType
        , O: ObservableType
        , O.E == [S]
        , S.Item: Enum4Convertible
        , C0: Reusable
        , C0: UITableViewCell
        , S.Item.T0 == C0.Dependency
        , C1: Reusable
        , C1: UITableViewCell
        , S.Item.T1 == C1.Dependency
        , C2: Reusable
        , C2: UITableViewCell
        , S.Item.T2 == C2.Dependency
        , C3: Reusable
        , C3: UITableViewCell
        , S.Item.T3 == C3.Dependency
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

    public func animatedItems<C0, C1, C2, C3, S, O>(for type0: C0.Type, _ type1: C1.Type, _ type2: C2.Type, _ type3: C3.Type)
        -> (O)
        -> Disposable
        where S: AnimatableSectionModelType
        , O: ObservableType
        , O.E == [S]
        , S.Item: Enum4Convertible
        , C0: Reusable
        , C0: UITableViewCell
        , S.Item.T0 == C0.Dependency
        , C1: Reusable
        , C1: UITableViewCell
        , S.Item.T1 == C1.Dependency
        , C2: Reusable
        , C2: UITableViewCell
        , S.Item.T2 == C2.Dependency
        , C3: Reusable
        , C3: UITableViewCell
        , S.Item.T3 == C3.Dependency
    {
        return { self.animatedItems(for: type0, type1, type2, type3)($0)({ _ in }) }
    }

    private func configureCell<C0, C1, C2, C3, C4, X, E>(for type0: C0.Type, _ type1: C1.Type, _ type2: C2.Type, _ type3: C3.Type, _ type4: C4.Type)
        -> (X, UITableView, IndexPath, E)
        -> UITableViewCell
        where E: Enum5Convertible
        , C0: Reusable
        , C0: UITableViewCell
        , E.T0 == C0.Dependency
        , C1: Reusable
        , C1: UITableViewCell
        , E.T1 == C1.Dependency
        , C2: Reusable
        , C2: UITableViewCell
        , E.T2 == C2.Dependency
        , C3: Reusable
        , C3: UITableViewCell
        , E.T3 == C3.Dependency
        , C4: Reusable
        , C4: UITableViewCell
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

    public func reloadItems<C0, C1, C2, C3, C4, S, O>(for type0: C0.Type, _ type1: C1.Type, _ type2: C2.Type, _ type3: C3.Type, _ type4: C4.Type)
        -> (O)
        -> (@escaping (RxTableViewSectionedReloadDataSource<S>) -> ())
        -> Disposable
        where S: SectionModelType
        , O: ObservableType
        , O.E == [S]
        , S.Item: Enum5Convertible
        , C0: Reusable
        , C0: UITableViewCell
        , S.Item.T0 == C0.Dependency
        , C1: Reusable
        , C1: UITableViewCell
        , S.Item.T1 == C1.Dependency
        , C2: Reusable
        , C2: UITableViewCell
        , S.Item.T2 == C2.Dependency
        , C3: Reusable
        , C3: UITableViewCell
        , S.Item.T3 == C3.Dependency
        , C4: Reusable
        , C4: UITableViewCell
        , S.Item.T4 == C4.Dependency
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

    public func reloadItems<C0, C1, C2, C3, C4, S, O>(for type0: C0.Type, _ type1: C1.Type, _ type2: C2.Type, _ type3: C3.Type, _ type4: C4.Type)
        -> (O)
        -> Disposable
        where S: SectionModelType
        , O: ObservableType
        , O.E == [S]
        , S.Item: Enum5Convertible
        , C0: Reusable
        , C0: UITableViewCell
        , S.Item.T0 == C0.Dependency
        , C1: Reusable
        , C1: UITableViewCell
        , S.Item.T1 == C1.Dependency
        , C2: Reusable
        , C2: UITableViewCell
        , S.Item.T2 == C2.Dependency
        , C3: Reusable
        , C3: UITableViewCell
        , S.Item.T3 == C3.Dependency
        , C4: Reusable
        , C4: UITableViewCell
        , S.Item.T4 == C4.Dependency
    {
        return { self.reloadItems(for: type0, type1, type2, type3, type4)($0)({ _ in }) }
    }

    public func animatedItems<C0, C1, C2, C3, C4, S, O>(for type0: C0.Type, _ type1: C1.Type, _ type2: C2.Type, _ type3: C3.Type, _ type4: C4.Type)
        -> (O)
        -> (@escaping (RxTableViewSectionedAnimatedDataSource<S>) -> ())
        -> Disposable
        where S: AnimatableSectionModelType
        , O: ObservableType
        , O.E == [S]
        , S.Item: Enum5Convertible
        , C0: Reusable
        , C0: UITableViewCell
        , S.Item.T0 == C0.Dependency
        , C1: Reusable
        , C1: UITableViewCell
        , S.Item.T1 == C1.Dependency
        , C2: Reusable
        , C2: UITableViewCell
        , S.Item.T2 == C2.Dependency
        , C3: Reusable
        , C3: UITableViewCell
        , S.Item.T3 == C3.Dependency
        , C4: Reusable
        , C4: UITableViewCell
        , S.Item.T4 == C4.Dependency
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

    public func animatedItems<C0, C1, C2, C3, C4, S, O>(for type0: C0.Type, _ type1: C1.Type, _ type2: C2.Type, _ type3: C3.Type, _ type4: C4.Type)
        -> (O)
        -> Disposable
        where S: AnimatableSectionModelType
        , O: ObservableType
        , O.E == [S]
        , S.Item: Enum5Convertible
        , C0: Reusable
        , C0: UITableViewCell
        , S.Item.T0 == C0.Dependency
        , C1: Reusable
        , C1: UITableViewCell
        , S.Item.T1 == C1.Dependency
        , C2: Reusable
        , C2: UITableViewCell
        , S.Item.T2 == C2.Dependency
        , C3: Reusable
        , C3: UITableViewCell
        , S.Item.T3 == C3.Dependency
        , C4: Reusable
        , C4: UITableViewCell
        , S.Item.T4 == C4.Dependency
    {
        return { self.animatedItems(for: type0, type1, type2, type3, type4)($0)({ _ in }) }
    }

}

extension Reactive where Base: UICollectionView {
    private func configureCell<C0, C1, X, E>(for type0: C0.Type, _ type1: C1.Type)
        -> (X, UICollectionView, IndexPath, E)
        -> UICollectionViewCell
        where E: Enum2Convertible
        , C0: Reusable
        , C0: UICollectionViewCell
        , E.T0 == C0.Dependency
        , C1: Reusable
        , C1: UICollectionViewCell
        , E.T1 == C1.Dependency
    {
        return { (_, collectionView, indexPath, item) in
            switch item.asEnum {
            case .case0(let x): return C0.dequeue(from: collectionView, for: indexPath, with: x)
            case .case1(let x): return C1.dequeue(from: collectionView, for: indexPath, with: x)
            }
        }
    }

    public func reloadItems<C0, C1, S, O>(for type0: C0.Type, _ type1: C1.Type)
        -> (O)
        -> (@escaping (RxCollectionViewSectionedReloadDataSource<S>) -> ())
        -> Disposable
        where S: SectionModelType
        , O: ObservableType
        , O.E == [S]
        , S.Item: Enum2Convertible
        , C0: Reusable
        , C0: UICollectionViewCell
        , S.Item.T0 == C0.Dependency
        , C1: Reusable
        , C1: UICollectionViewCell
        , S.Item.T1 == C1.Dependency
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

    public func reloadItems<C0, C1, S, O>(for type0: C0.Type, _ type1: C1.Type)
        -> (O)
        -> Disposable
        where S: SectionModelType
        , O: ObservableType
        , O.E == [S]
        , S.Item: Enum2Convertible
        , C0: Reusable
        , C0: UICollectionViewCell
        , S.Item.T0 == C0.Dependency
        , C1: Reusable
        , C1: UICollectionViewCell
        , S.Item.T1 == C1.Dependency
    {
        return { self.reloadItems(for: type0, type1)($0)({ _ in }) }
    }

    public func animatedItems<C0, C1, S, O>(for type0: C0.Type, _ type1: C1.Type)
        -> (O)
        -> (@escaping (RxCollectionViewSectionedAnimatedDataSource<S>) -> ())
        -> Disposable
        where S: AnimatableSectionModelType
        , O: ObservableType
        , O.E == [S]
        , S.Item: Enum2Convertible
        , C0: Reusable
        , C0: UICollectionViewCell
        , S.Item.T0 == C0.Dependency
        , C1: Reusable
        , C1: UICollectionViewCell
        , S.Item.T1 == C1.Dependency
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

    public func animatedItems<C0, C1, S, O>(for type0: C0.Type, _ type1: C1.Type)
        -> (O)
        -> Disposable
        where S: AnimatableSectionModelType
        , O: ObservableType
        , O.E == [S]
        , S.Item: Enum2Convertible
        , C0: Reusable
        , C0: UICollectionViewCell
        , S.Item.T0 == C0.Dependency
        , C1: Reusable
        , C1: UICollectionViewCell
        , S.Item.T1 == C1.Dependency
    {
        return { self.animatedItems(for: type0, type1)($0)({ _ in }) }
    }

    private func configureCell<C0, C1, C2, X, E>(for type0: C0.Type, _ type1: C1.Type, _ type2: C2.Type)
        -> (X, UICollectionView, IndexPath, E)
        -> UICollectionViewCell
        where E: Enum3Convertible
        , C0: Reusable
        , C0: UICollectionViewCell
        , E.T0 == C0.Dependency
        , C1: Reusable
        , C1: UICollectionViewCell
        , E.T1 == C1.Dependency
        , C2: Reusable
        , C2: UICollectionViewCell
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

    public func reloadItems<C0, C1, C2, S, O>(for type0: C0.Type, _ type1: C1.Type, _ type2: C2.Type)
        -> (O)
        -> (@escaping (RxCollectionViewSectionedReloadDataSource<S>) -> ())
        -> Disposable
        where S: SectionModelType
        , O: ObservableType
        , O.E == [S]
        , S.Item: Enum3Convertible
        , C0: Reusable
        , C0: UICollectionViewCell
        , S.Item.T0 == C0.Dependency
        , C1: Reusable
        , C1: UICollectionViewCell
        , S.Item.T1 == C1.Dependency
        , C2: Reusable
        , C2: UICollectionViewCell
        , S.Item.T2 == C2.Dependency
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

    public func reloadItems<C0, C1, C2, S, O>(for type0: C0.Type, _ type1: C1.Type, _ type2: C2.Type)
        -> (O)
        -> Disposable
        where S: SectionModelType
        , O: ObservableType
        , O.E == [S]
        , S.Item: Enum3Convertible
        , C0: Reusable
        , C0: UICollectionViewCell
        , S.Item.T0 == C0.Dependency
        , C1: Reusable
        , C1: UICollectionViewCell
        , S.Item.T1 == C1.Dependency
        , C2: Reusable
        , C2: UICollectionViewCell
        , S.Item.T2 == C2.Dependency
    {
        return { self.reloadItems(for: type0, type1, type2)($0)({ _ in }) }
    }

    public func animatedItems<C0, C1, C2, S, O>(for type0: C0.Type, _ type1: C1.Type, _ type2: C2.Type)
        -> (O)
        -> (@escaping (RxCollectionViewSectionedAnimatedDataSource<S>) -> ())
        -> Disposable
        where S: AnimatableSectionModelType
        , O: ObservableType
        , O.E == [S]
        , S.Item: Enum3Convertible
        , C0: Reusable
        , C0: UICollectionViewCell
        , S.Item.T0 == C0.Dependency
        , C1: Reusable
        , C1: UICollectionViewCell
        , S.Item.T1 == C1.Dependency
        , C2: Reusable
        , C2: UICollectionViewCell
        , S.Item.T2 == C2.Dependency
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

    public func animatedItems<C0, C1, C2, S, O>(for type0: C0.Type, _ type1: C1.Type, _ type2: C2.Type)
        -> (O)
        -> Disposable
        where S: AnimatableSectionModelType
        , O: ObservableType
        , O.E == [S]
        , S.Item: Enum3Convertible
        , C0: Reusable
        , C0: UICollectionViewCell
        , S.Item.T0 == C0.Dependency
        , C1: Reusable
        , C1: UICollectionViewCell
        , S.Item.T1 == C1.Dependency
        , C2: Reusable
        , C2: UICollectionViewCell
        , S.Item.T2 == C2.Dependency
    {
        return { self.animatedItems(for: type0, type1, type2)($0)({ _ in }) }
    }

    private func configureCell<C0, C1, C2, C3, X, E>(for type0: C0.Type, _ type1: C1.Type, _ type2: C2.Type, _ type3: C3.Type)
        -> (X, UICollectionView, IndexPath, E)
        -> UICollectionViewCell
        where E: Enum4Convertible
        , C0: Reusable
        , C0: UICollectionViewCell
        , E.T0 == C0.Dependency
        , C1: Reusable
        , C1: UICollectionViewCell
        , E.T1 == C1.Dependency
        , C2: Reusable
        , C2: UICollectionViewCell
        , E.T2 == C2.Dependency
        , C3: Reusable
        , C3: UICollectionViewCell
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

    public func reloadItems<C0, C1, C2, C3, S, O>(for type0: C0.Type, _ type1: C1.Type, _ type2: C2.Type, _ type3: C3.Type)
        -> (O)
        -> (@escaping (RxCollectionViewSectionedReloadDataSource<S>) -> ())
        -> Disposable
        where S: SectionModelType
        , O: ObservableType
        , O.E == [S]
        , S.Item: Enum4Convertible
        , C0: Reusable
        , C0: UICollectionViewCell
        , S.Item.T0 == C0.Dependency
        , C1: Reusable
        , C1: UICollectionViewCell
        , S.Item.T1 == C1.Dependency
        , C2: Reusable
        , C2: UICollectionViewCell
        , S.Item.T2 == C2.Dependency
        , C3: Reusable
        , C3: UICollectionViewCell
        , S.Item.T3 == C3.Dependency
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

    public func reloadItems<C0, C1, C2, C3, S, O>(for type0: C0.Type, _ type1: C1.Type, _ type2: C2.Type, _ type3: C3.Type)
        -> (O)
        -> Disposable
        where S: SectionModelType
        , O: ObservableType
        , O.E == [S]
        , S.Item: Enum4Convertible
        , C0: Reusable
        , C0: UICollectionViewCell
        , S.Item.T0 == C0.Dependency
        , C1: Reusable
        , C1: UICollectionViewCell
        , S.Item.T1 == C1.Dependency
        , C2: Reusable
        , C2: UICollectionViewCell
        , S.Item.T2 == C2.Dependency
        , C3: Reusable
        , C3: UICollectionViewCell
        , S.Item.T3 == C3.Dependency
    {
        return { self.reloadItems(for: type0, type1, type2, type3)($0)({ _ in }) }
    }

    public func animatedItems<C0, C1, C2, C3, S, O>(for type0: C0.Type, _ type1: C1.Type, _ type2: C2.Type, _ type3: C3.Type)
        -> (O)
        -> (@escaping (RxCollectionViewSectionedAnimatedDataSource<S>) -> ())
        -> Disposable
        where S: AnimatableSectionModelType
        , O: ObservableType
        , O.E == [S]
        , S.Item: Enum4Convertible
        , C0: Reusable
        , C0: UICollectionViewCell
        , S.Item.T0 == C0.Dependency
        , C1: Reusable
        , C1: UICollectionViewCell
        , S.Item.T1 == C1.Dependency
        , C2: Reusable
        , C2: UICollectionViewCell
        , S.Item.T2 == C2.Dependency
        , C3: Reusable
        , C3: UICollectionViewCell
        , S.Item.T3 == C3.Dependency
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

    public func animatedItems<C0, C1, C2, C3, S, O>(for type0: C0.Type, _ type1: C1.Type, _ type2: C2.Type, _ type3: C3.Type)
        -> (O)
        -> Disposable
        where S: AnimatableSectionModelType
        , O: ObservableType
        , O.E == [S]
        , S.Item: Enum4Convertible
        , C0: Reusable
        , C0: UICollectionViewCell
        , S.Item.T0 == C0.Dependency
        , C1: Reusable
        , C1: UICollectionViewCell
        , S.Item.T1 == C1.Dependency
        , C2: Reusable
        , C2: UICollectionViewCell
        , S.Item.T2 == C2.Dependency
        , C3: Reusable
        , C3: UICollectionViewCell
        , S.Item.T3 == C3.Dependency
    {
        return { self.animatedItems(for: type0, type1, type2, type3)($0)({ _ in }) }
    }

    private func configureCell<C0, C1, C2, C3, C4, X, E>(for type0: C0.Type, _ type1: C1.Type, _ type2: C2.Type, _ type3: C3.Type, _ type4: C4.Type)
        -> (X, UICollectionView, IndexPath, E)
        -> UICollectionViewCell
        where E: Enum5Convertible
        , C0: Reusable
        , C0: UICollectionViewCell
        , E.T0 == C0.Dependency
        , C1: Reusable
        , C1: UICollectionViewCell
        , E.T1 == C1.Dependency
        , C2: Reusable
        , C2: UICollectionViewCell
        , E.T2 == C2.Dependency
        , C3: Reusable
        , C3: UICollectionViewCell
        , E.T3 == C3.Dependency
        , C4: Reusable
        , C4: UICollectionViewCell
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

    public func reloadItems<C0, C1, C2, C3, C4, S, O>(for type0: C0.Type, _ type1: C1.Type, _ type2: C2.Type, _ type3: C3.Type, _ type4: C4.Type)
        -> (O)
        -> (@escaping (RxCollectionViewSectionedReloadDataSource<S>) -> ())
        -> Disposable
        where S: SectionModelType
        , O: ObservableType
        , O.E == [S]
        , S.Item: Enum5Convertible
        , C0: Reusable
        , C0: UICollectionViewCell
        , S.Item.T0 == C0.Dependency
        , C1: Reusable
        , C1: UICollectionViewCell
        , S.Item.T1 == C1.Dependency
        , C2: Reusable
        , C2: UICollectionViewCell
        , S.Item.T2 == C2.Dependency
        , C3: Reusable
        , C3: UICollectionViewCell
        , S.Item.T3 == C3.Dependency
        , C4: Reusable
        , C4: UICollectionViewCell
        , S.Item.T4 == C4.Dependency
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

    public func reloadItems<C0, C1, C2, C3, C4, S, O>(for type0: C0.Type, _ type1: C1.Type, _ type2: C2.Type, _ type3: C3.Type, _ type4: C4.Type)
        -> (O)
        -> Disposable
        where S: SectionModelType
        , O: ObservableType
        , O.E == [S]
        , S.Item: Enum5Convertible
        , C0: Reusable
        , C0: UICollectionViewCell
        , S.Item.T0 == C0.Dependency
        , C1: Reusable
        , C1: UICollectionViewCell
        , S.Item.T1 == C1.Dependency
        , C2: Reusable
        , C2: UICollectionViewCell
        , S.Item.T2 == C2.Dependency
        , C3: Reusable
        , C3: UICollectionViewCell
        , S.Item.T3 == C3.Dependency
        , C4: Reusable
        , C4: UICollectionViewCell
        , S.Item.T4 == C4.Dependency
    {
        return { self.reloadItems(for: type0, type1, type2, type3, type4)($0)({ _ in }) }
    }

    public func animatedItems<C0, C1, C2, C3, C4, S, O>(for type0: C0.Type, _ type1: C1.Type, _ type2: C2.Type, _ type3: C3.Type, _ type4: C4.Type)
        -> (O)
        -> (@escaping (RxCollectionViewSectionedAnimatedDataSource<S>) -> ())
        -> Disposable
        where S: AnimatableSectionModelType
        , O: ObservableType
        , O.E == [S]
        , S.Item: Enum5Convertible
        , C0: Reusable
        , C0: UICollectionViewCell
        , S.Item.T0 == C0.Dependency
        , C1: Reusable
        , C1: UICollectionViewCell
        , S.Item.T1 == C1.Dependency
        , C2: Reusable
        , C2: UICollectionViewCell
        , S.Item.T2 == C2.Dependency
        , C3: Reusable
        , C3: UICollectionViewCell
        , S.Item.T3 == C3.Dependency
        , C4: Reusable
        , C4: UICollectionViewCell
        , S.Item.T4 == C4.Dependency
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

    public func animatedItems<C0, C1, C2, C3, C4, S, O>(for type0: C0.Type, _ type1: C1.Type, _ type2: C2.Type, _ type3: C3.Type, _ type4: C4.Type)
        -> (O)
        -> Disposable
        where S: AnimatableSectionModelType
        , O: ObservableType
        , O.E == [S]
        , S.Item: Enum5Convertible
        , C0: Reusable
        , C0: UICollectionViewCell
        , S.Item.T0 == C0.Dependency
        , C1: Reusable
        , C1: UICollectionViewCell
        , S.Item.T1 == C1.Dependency
        , C2: Reusable
        , C2: UICollectionViewCell
        , S.Item.T2 == C2.Dependency
        , C3: Reusable
        , C3: UICollectionViewCell
        , S.Item.T3 == C3.Dependency
        , C4: Reusable
        , C4: UICollectionViewCell
        , S.Item.T4 == C4.Dependency
    {
        return { self.animatedItems(for: type0, type1, type2, type3, type4)($0)({ _ in }) }
    }

}

