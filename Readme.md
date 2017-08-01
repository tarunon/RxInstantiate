# RxInstantiate

Useful protocols and default implementation using [RxSwift](https://github.com/ReactiveX/RxSwift), [RxDataSources](https://github.com/RxSwiftCommunity/RxDataSources) and [Instantiate](https://github.com/tarunon/Instantiate).

## LazyVariable
No Error `ReplaySubject(1)` wrapper. Don't need to inital value when init `LazyVariable`, but should set value before get value.

## RxInjectable
Actual view/viewController may have own ViewModel. In this case, `ViewModel` should be Injectable that has same Dependency of view/viewController, maybe useful that using LazyVariable. 
`RxInjectable` have default implementation of `func inject` that injecting value to ViewModel. It mean view/viewController that implemented `Instantiatable` and `RxInjectable` is require only binding with `ViewModel`.

## RxDataSources extensions
The cell type that implemented `Reusable`, can make default implementation of reuse cell and data binding.
RxInstantiate take function that generate RxDataSource instance.

### 1TableView(CollectionView) - 1Cell case
`observable.bind(to: tableView.rx.reloadDataSource(for: Cell.self))` is same of make `RxTableViewSectionedReloadDataSource` instance and setup `configureCell`.
The observable value type should be `[SectionModelType]` and the `SectionModelType.Item` should be equal to `Cell.Dependency`.

### 1TableView(CollectionView) - nCell case (2≤n≤5)
`observable.bind(to: tableView.rx.reloadDataSource(for: Cell1.self, Cell2.self, ...))` is same of make `RxTableViewSectionedReloadDataSource` instance and setup `configureCell`.
The observable value type should be `[SectionModelType]` and the `SectionModelType.Item` should implement `EnumNConvertible` and there case type should be equal to `Cell1.Dependency` , `Cell2.Dependency` and so on.

#### Needs 6 or more Cell...
It may be a bit complicated for your user, but can use environment variable `ENUM_CONVERTIBLE_MAX_SERIAL_NUMBER` or `ENUM_CONVERTIBLE_SPECIFIC_NUMBERS`. Please check [enum-convertible](https://github.com/tarunon/enum-convertible/tree/0.2.0#needs-6-or-more-cases)
