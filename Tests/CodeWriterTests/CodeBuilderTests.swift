import XCTest
@testable import CodeWriter

class CodeBuilderTests: XCTestCase {

    func testCodeBuilderWithTabs() {
        let builder = CodeBuilder()
        builder.add(line: "if test {").rightTab().add(line: "print(\"ok\")").leftTab().add(line: "}")
        let res = builder.build()
        XCTAssertEqual(res, "if test {\n\tprint(\"ok\")\n}\n")
    }

    func testCodeBuilderWithInnerCodeBuilder() {
        let other = CodeBuilder()
        other.add(line: "if test {").rightTab().add(line: "print(\"ok\")").leftTab().add(line: "}")

        let builder = CodeBuilder()
        builder.add(line: "if polymorph {").rightTab().add(code: other).leftTab().add(line: "}")

        let res = builder.build()
        XCTAssertEqual(res, "if polymorph {\n\tif test {\n\t\tprint(\"ok\")\n\t}\n}\n")
    }

    static var allTests = [
        ("testCodeBuilderWithTabs", testCodeBuilderWithTabs),
        ("testCodeBuilderWithInnerCodeBuilder", testCodeBuilderWithInnerCodeBuilder)
    ]
}

