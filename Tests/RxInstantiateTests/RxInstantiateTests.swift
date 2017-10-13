import XCTest
import RxInstantiate
import Instantiate
import InstantiateStandard

class RxInstantiateTests: XCTestCase {
    func testSingleCell() {
        let dependency = SingleCellTableViewController.Dependency(
            title: "TestTitle",
            dataSources: [
                LabelTableViewCell.Dependency(
                    color: .black,
                    text: .string("Hello")
                ),
                LabelTableViewCell.Dependency(
                    color: .red,
                    text: .attributedString(NSAttributedString(string: "White Text", attributes: [NSAttributedStringKey.foregroundColor: UIColor.white]))
                )
            ]
        )
        let viewController = SingleCellTableViewController(with: dependency)
        _ = viewController.view // load view
        XCTAssertEqual(viewController.title, dependency.title)
        let cells = viewController.tableView.visibleCells.flatMap { $0 as? LabelTableViewCell }
        XCTAssertEqual(cells[0].backgroundColor, dependency.dataSources[0].color)
        XCTAssertEqual(cells[0].label.text, dependency.dataSources[0].text.string)
        XCTAssertEqual(cells[1].backgroundColor, dependency.dataSources[1].color)
        XCTAssertEqual(cells[1].label.attributedText, dependency.dataSources[1].text.attributedString)
    }

    func testMultipleCell() {
        let dependency = MultipleCellTableViewController.Dependency(
            dataSources: [
                .label(.init(
                    color: .black,
                    text: .string("World")
                )),
                .switch(true),
                .slider(50)
            ]
        )
        let viewController = MultipleCellTableViewController(with: dependency)
        _ = viewController.view // load view
        viewController.collectionView.layoutIfNeeded()

        let labelCell = viewController.collectionView.cellForItem(at: [0, 0]) as! LabelCollectionViewCell
        let switchCell = viewController.collectionView.cellForItem(at: [0, 1]) as! SwitchCollectionViewCell
        let sliderCell = viewController.collectionView.cellForItem(at: [0, 2]) as! SliderCollectionViewCell

        XCTAssertEqual(labelCell.label.text, "World")
        XCTAssertEqual(switchCell.switch.isOn, true)
        XCTAssertEqual(sliderCell.slider.value, 50)
    }

    static var allTests = [
        ("testSingleTypeCell", testSingleCell),
    ]
}
