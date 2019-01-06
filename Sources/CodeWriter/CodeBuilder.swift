//
//  CodeBuilder.swift
//  CodeWriter
//
//  Created by Benoit BRIATTE on 09/08/2017.
//

import Foundation

public class CodeBuilder {

    public static let defaultTab = "    "
    public static let newLine = "\n"

    private var code: String
    private var depth: Int
    private var tab: String
    public var indentString: String {
        return String(repeating: self.tab, count: self.depth)
    }

    public static func from(code: String, depth: Int = 0, crlf: Bool = false) -> CodeBuilder {
        return CodeBuilder(depth: depth).add(string: code, indent: true, crlf: crlf)
    }

    public init(depth: Int = 0, tab: String = CodeBuilder.defaultTab) {
        self.code = ""
        self.depth = depth
        self.tab = tab
    }

    @discardableResult
    public func rightTab() -> CodeBuilder {
        self.depth += 1
        return self
    }

    @discardableResult
    public func leftTab() -> CodeBuilder {
        if self.depth > 0 {
            self.depth -= 1
        }
        return self
    }

    @discardableResult
    public func add(line: String) -> CodeBuilder {
        return self.add(string: line, indent: true, crlf: true)
    }

    @discardableResult
    public func add(string: String, indent: Bool = false, crlf: Bool = false) -> CodeBuilder {
        if indent {
            self.code += self.indentString
        }
        self.code += string
        if crlf {
            self.code += CodeBuilder.newLine
        }
        return self
    }

    @discardableResult
    public func add(lines: [String]) -> CodeBuilder {
        return self.add(strings: lines, indent: true, crlf: true)
    }

    @discardableResult
    public func add(strings: [String], indent: Bool = false, crlf: Bool = false) -> CodeBuilder {
        guard strings.count > 0 else {
            return self
        }
        var separator = crlf == true ? CodeBuilder.newLine : ""
        separator += indent == true ? self.indentString : ""
        return self.add(string: strings.joined(separator: separator), indent: indent, crlf: crlf)
    }

    @discardableResult
    public func add(code builder: CodeBuilder, indent: Bool = true, crlf: Bool = true) -> CodeBuilder {
        let code = builder.build()
        guard code.count > 0 else {
            return self
        }
        var arr = code.components(separatedBy: CodeBuilder.newLine)
        let last = arr.count - 1
        if arr[last] == "" { // clear empty newline
            arr.remove(at: last)
        }
        let seperator = CodeBuilder.newLine + self.indentString
        return self.add(string: arr.joined(separator: seperator), indent: indent, crlf: crlf)
    }

    public func build() -> String {
        return self.code
    }
}
