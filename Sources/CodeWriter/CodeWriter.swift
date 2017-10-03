//
//  CodeWriter.swift
//  CodeWriter
//
//  Created by Benoit BRIATTE on 16/08/2017.
//

import Foundation

public protocol CodeWriter {

    associatedtype Description

    func write(description: Description, depth: Int) -> String
}

public extension CodeWriter {
    
    public func write(description: Description) -> String {
        return self.write(description: description, depth: 0)
    }
}
