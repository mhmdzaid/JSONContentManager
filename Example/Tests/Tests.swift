import XCTest
import JSONContentManager

class Tests: XCTestCase {
    var contentManager: JSONContentManager!
    
    override func setUp() {
        super.setUp()
        contentManager = JSONContentManager(JSONFile: "jsonTest", bundle: Bundle(for: type(of: self).self))
    }
    
    func testGetValueFor() {
        XCTAssertTrue(contentManager.value(from: "Product.specs.height") is Int)
        XCTAssertEqual(contentManager.value(from:  "Product.specs.height") as! Int,
                       40)
    }
    
    func testStringValueFor() {
        let content = contentManager.stringValue(from: "Product.bill",
                                                 placeholders: ["12.35$","40,30$"])
        XCTAssertEqual(content, "you paid 12.35$ of 40,30$.")
    }
    
    override func tearDown() {
        contentManager = nil
        super.tearDown()
    }
}
