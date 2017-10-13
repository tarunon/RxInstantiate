//
//  MultipleCellTableViewController.swift
//  RxInstantiate
//
//  Created by ST90872 on 2017/07/13.
//
//

import UIKit
import Instantiate
import InstantiateStandard
import RxInstantiate
import RxSwift
import RxCocoa
import RxDataSources
import EnumConvertible

class MultipleCellTableViewController: UIViewController, RxViewProtocol {
    struct Dependency {
        enum CellModel: Enum3Convertible {
            case label(LabelCollectionViewCell.Dependency)
            case `switch`(SwitchCollectionViewCell.Dependency)
            case slider(SliderCollectionViewCell.Dependency)

            var asEnum: AnyEnum3<LabelCollectionViewCell.Dependency, SwitchCollectionViewCell.Dependency, SliderCollectionViewCell.Dependency> {
                switch self {
                case .label(let x): return .case0(x)
                case .switch(let x): return .case1(x)
                case .slider(let x): return .case2(x)
                }
            }
        }
        var dataSources: [CellModel]
    }

    struct Section: SectionModelType {
        var items: [Dependency.CellModel]
        init(items: [Dependency.CellModel]) {
            self.items = items
        }

        init(original: Section, items: [Dependency.CellModel]) {
            self = original
            self.items = items
        }
    }

    var viewModel = LazyVariable<Dependency>()
    let disposeBag = DisposeBag()

    @IBOutlet weak var collectionView: UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.registerNib(type: LabelCollectionViewCell.self)
        collectionView.registerNib(type: SwitchCollectionViewCell.self)
        collectionView.registerNib(type: SliderCollectionViewCell.self)
        
        viewModel.asDriver()
            .map { $0.dataSources }
            .map { [Section(items: $0)] }
            .drive(collectionView.rx.items(.reload, for: LabelCollectionViewCell.self, SwitchCollectionViewCell.self, SliderCollectionViewCell.self))
            .disposed(by: disposeBag)
    }
}

extension MultipleCellTableViewController: StoryboardInstantiatable {

}
