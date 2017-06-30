import XCTest
import RxInstantiate
import Instantiate
import InstantiateStandard

class RxInstantiateTests: XCTestCase {
    func testSingleTypeCell() {
        let dependency = TestViewController.Dependency(
            title: "TestTitle",
            dataSources: [
                TestCell.Dependency(
                    color: .black,
                    text: .string("Hello")
                ),
                TestCell.Dependency(
                    color: .red,
                    text: .attributedString(NSAttributedString(string: "White Text", attributes: [NSForegroundColorAttributeName: UIColor.white]))
                )
            ]
        )
        let viewController = TestViewController(with: dependency)
        _ = viewController.view // load view
        XCTAssertEqual(viewController.title, dependency.title)
        let cells = viewController.tableView.visibleCells.flatMap { $0 as? TestCell }
        XCTAssertEqual(cells[0].backgroundColor, dependency.dataSources[0].color)
        XCTAssertEqual(cells[0].label.text, dependency.dataSources[0].text.string)
        XCTAssertEqual(cells[1].backgroundColor, dependency.dataSources[1].color)
        XCTAssertEqual(cells[1].label.attributedText, dependency.dataSources[1].text.attributedString)
    }


    static var allTests = [
        ("testSingleTypeCell", testSingleTypeCell),
    ]
}
