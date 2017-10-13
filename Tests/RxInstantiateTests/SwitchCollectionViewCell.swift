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

class SwitchCollectionViewCell: UICollectionViewCell, RxViewProtocol {
    typealias Dependency = Bool
    var viewModel = LazyVariable<Bool>()
    let disposeBag = DisposeBag()

    @IBOutlet weak var `switch`: UISwitch!

    override func awakeFromNib() {
        super.awakeFromNib()
        viewModel.asDriver()
            .drive(`switch`.rx.isOn)
            .disposed(by: disposeBag)
    }
}

extension SwitchCollectionViewCell: NibType {

}

extension SwitchCollectionViewCell: Reusable {

}
