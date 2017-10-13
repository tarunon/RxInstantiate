//
//  LabelCell.swift
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

class LabelTableViewCell: UITableViewCell, RxViewProtocol {
    struct Dependency {
        var color: UIColor
        enum Text {
            case string(String)
            case attributedString(NSAttributedString)

            var string: String? {
                if case .string(let string) = self {
                    return string
                }
                return nil
            }

            var attributedString: NSAttributedString? {
                if case .attributedString(let attributedString) = self {
                    return attributedString
                }
                return nil
            }
        }
        var text: Text
    }
    var viewModel = LazyVariable<Dependency>()
    let disposeBag = DisposeBag()

    @IBOutlet weak var label: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        viewModel.asDriver()
            .map { $0.color }
            .drive(
                onNext: { [weak self] (color) in
                    self?.backgroundColor = color
                }
            )
            .disposed(by: disposeBag)

        viewModel.asDriver()
            .flatMap { Driver.from(optional: $0.text.string) }
            .drive(self.label.rx.text)
            .disposed(by: disposeBag)

        viewModel.asDriver()
            .flatMap { Driver.from(optional: $0.text.attributedString) }
            .drive(self.label.rx.attributedText)
            .disposed(by: disposeBag)
    }
}

extension LabelTableViewCell: NibType {

}

extension LabelTableViewCell: Reusable {

}
