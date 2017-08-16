//
//  CodeBuilder.swift
//  CodeWriter
//
//  Created by Benoit BRIATTE on 09/08/2017.
//

import Foundation

public class CodeBuilder {

    private var code: String
    private var depth: Int

    public static func from(code: String, depth: Int = 0, crlf: Bool = false) -> CodeBuilder {
        return CodeBuilder(depth: depth).add(string: code, indent: true, crlf: crlf)
    }

    public init(depth: Int = 0) {
        self.code = ""
        self.depth = depth
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
            self.code += String(repeating: "\t", count: self.depth)
        }
        self.code += string
        if crlf {
            self.code += "\n"
        }
        return self
    }

    @discardableResult
    public func add(code builder: CodeBuilder, indent: Bool = true, crlf: Bool = true) -> CodeBuilder {
        let code = builder.build()
        if code.count == 0 {
            if crlf {
                return self.add(string: "\n", crlf: crlf)
            }
            return self
        }
        var arr = code.components(separatedBy: "\n")
        let last = arr.count - 1
        if arr[last] == "" {
            arr.remove(at: last)
        }
        let separator = "\n\(String(repeating: "\t", count: self.depth))"
        return self.add(string: arr.joined(separator: separator), indent: indent, crlf: crlf)
    }

    public func build() -> String {
        return self.code
    }
}
