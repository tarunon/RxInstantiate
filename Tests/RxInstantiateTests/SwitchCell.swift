//
//  SwitchCell.swift
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

class SwitchCell: UITableViewCell, RxInjectable {
    typealias Dependency = Bool
    var storage = LazyVariable<Bool>()
    let disposeBag = DisposeBag()

    @IBOutlet weak var `switch`: UISwitch!

    override func awakeFromNib() {
        super.awakeFromNib()
        storage.asDriver()
            .drive(`switch`.rx.isOn)
            .disposed(by: disposeBag)
    }
}

extension SwitchCell: NibType {

}

extension SwitchCell: Reusable {

}