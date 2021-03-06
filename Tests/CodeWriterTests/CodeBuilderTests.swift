import XCTest
@testable import CodeWriter

final class CodeBuilderTests: XCTestCase {

    func testCodeBuilderWithTabs() {
        let builder = CodeBuilder()
        builder.add(line: "if test {").rightTab().add(line: "print(\"ok\")").leftTab().add(line: "}")
        let res = builder.build()
        XCTAssertEqual(res, "if test {\n    print(\"ok\")\n}\n")
    }

    func testCodeBuilderWithInnerCodeBuilder() {
        let other = CodeBuilder()
        other.add(line: "if test {").rightTab().add(line: "print(\"ok\")").leftTab().add(line: "}")

        let builder = CodeBuilder()
        builder.add(line: "if polymorph {").rightTab().add(code: other).leftTab().add(line: "}")

        let res = builder.build()
        XCTAssertEqual(res, "if polymorph {\n    if test {\n        print(\"ok\")\n    }\n}\n")
    }

    static var allTests = [
        ("testCodeBuilderWithTabs", testCodeBuilderWithTabs),
        ("testCodeBuilderWithInnerCodeBuilder", testCodeBuilderWithInnerCodeBuilder)
    ]
}
