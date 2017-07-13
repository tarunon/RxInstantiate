//
//  SliderCell.swift
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

class SliderCell: UITableViewCell, RxInjectable {
    typealias Dependency = Float
    var storage = LazyVariable<Float>()
    let disposeBag = DisposeBag()

    @IBOutlet weak var slider: UISlider!

    override func awakeFromNib() {
        super.awakeFromNib()
        storage.asDriver()
            .drive(slider.rx.value)
            .disposed(by: disposeBag)
    }
}

extension SliderCell: NibType {

}

extension SliderCell: Reusable {
    
}
