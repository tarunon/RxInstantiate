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

class SliderCollectionViewCell: UICollectionViewCell, RxViewProtocol {
    typealias Dependency = Float
    var viewModel = LazyVariable<Float>()
    let disposeBag = DisposeBag()

    @IBOutlet weak var slider: UISlider!

    override func awakeFromNib() {
        super.awakeFromNib()
        viewModel.asDriver()
            .drive(slider.rx.value)
            .disposed(by: disposeBag)
    }
}

extension SliderCollectionViewCell: NibType {

}

extension SliderCollectionViewCell: Reusable {
    
}
