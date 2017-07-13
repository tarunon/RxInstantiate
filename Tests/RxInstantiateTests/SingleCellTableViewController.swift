//
//  SingleCellTableViewController.swift
//  RxInstantiate
//
//  Created by ST90872 on 2017/06/28.
//
//

import UIKit
import Instantiate
import InstantiateStandard
import RxInstantiate
import RxSwift
import RxCocoa
import RxDataSources

class SingleCellTableViewController: UIViewController, RxInjectable {
    struct Dependency {
        var title: String
        var dataSources: [LabelCell.Dependency]
    }

    struct Section: SectionModelType {
        var items: [LabelCell.Dependency]
        init(items: [LabelCell.Dependency]) {
            self.items = items
        }

        init(original: Section, items: [LabelCell.Dependency]) {
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

        storage.asDriver()
            .map { $0.title }
            .drive(self.rx.title)
            .disposed(by: disposeBag)

        storage.asDriver()
            .map { $0.dataSources }
            .map { [Section(items: $0)] }
            .drive(tableView.rx.items(.reload, for: LabelCell.self))
            .disposed(by: disposeBag)
    }
}

extension SingleCellTableViewController: StoryboardInstantiatable {

}
