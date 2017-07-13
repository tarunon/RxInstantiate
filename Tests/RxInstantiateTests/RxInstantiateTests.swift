import XCTest
import RxInstantiate
import Instantiate
import InstantiateStandard

class RxInstantiateTests: XCTestCase {
    func testSingleCell() {
        let dependency = SingleCellTableViewController.Dependency(
            title: "TestTitle",
            dataSources: [
                LabelCell.Dependency(
                    color: .black,
                    text: .string("Hello")
                ),
                LabelCell.Dependency(
                    color: .red,
                    text: .attributedString(NSAttributedString(string: "White Text", attributes: [NSForegroundColorAttributeName: UIColor.white]))
                )
            ]
        )
        let viewController = SingleCellTableViewController(with: dependency)
        _ = viewController.view // load view
        XCTAssertEqual(viewController.title, dependency.title)
        let cells = viewController.tableView.visibleCells.flatMap { $0 as? LabelCell }
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
        let labelCell = viewController.tableView.visibleCells[0] as! LabelCell
        let switchCell = viewController.tableView.visibleCells[1] as! SwitchCell
        let sliderCell = viewController.tableView.visibleCells[2] as! SliderCell

        XCTAssertEqual(labelCell.label.text, "World")
        XCTAssertEqual(switchCell.switch.isOn, true)
        XCTAssertEqual(sliderCell.slider.value, 50)
    }

    static var allTests = [
        ("testSingleTypeCell", testSingleCell),
    ]
}
