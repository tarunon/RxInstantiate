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

class MultipleCellTableViewController: UIViewController, RxInjectable {
    struct Dependency {
        enum CellModel: Enum3Convertible {
            case label(LabelCell.Dependency)
            case `switch`(SwitchCell.Dependency)
            case slider(SliderCell.Dependency)

            var asEnum: Enum3<LabelCell.Dependency, SwitchCell.Dependency, SliderCell.Dependency> {
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

    var storage = LazyVariable<Dependency>()
    let disposeBag = DisposeBag()

    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 44.0
        tableView.registerNib(type: LabelCell.self)
        tableView.registerNib(type: SwitchCell.self)
        tableView.registerNib(type: SliderCell.self)
        
        storage.asDriver()
            .map { $0.dataSources }
            .map { [Section(items: $0)] }
            .drive(tableView.rx.items(.reload, for: LabelCell.self, SwitchCell.self, SliderCell.self))
            .disposed(by: disposeBag)
    }
}

extension MultipleCellTableViewController: StoryboardInstantiatable {

}
