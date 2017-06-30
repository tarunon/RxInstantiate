//
//  TestViewController.swift
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

class TestViewController: UIViewController, RxInjectable {
    struct Dependency {
        var title: String
        var dataSources: [TestCell.Dependency]
    }

    struct Section: SectionModelType {
        var items: [TestCell.Dependency]
        init(items: [TestCell.Dependency]) {
            self.items = items
        }

        init(original: Section, items: [TestCell.Dependency]) {
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
        tableView.registerNib(type: TestCell.self)

        storage.asDriver()
            .map { $0.title }
            .drive(self.rx.title)
            .disposed(by: disposeBag)
        
        storage.asDriver()
            .map { $0.dataSources }
            .map { [Section(items: $0)] }
            .drive(tableView.rx.reloadItems(for: TestCell.self)) { (dataSource) in
                
            }
            .disposed(by: disposeBag)
    }
}

extension TestViewController: StoryboardInstantiatable {

}
