//
//  Command.swift
//  ColorSetKit
//
//  Created by Takehito Koshimizu on 2019/02/10.
//

import Foundation

public struct Command: Hashable {

    public let command: String

    public init(command: String) {
        self.command = command
    }

    public var lines: [String] {
        return text.split(separator: "\n").map(String.init)
    }

    public var text: String {
        let stdOut = readStdOut()
        return String(data: stdOut, encoding: .utf8)!
    }

    public func readStdOut() -> Data {
        let (process, pipe) = (Process(), Pipe())
        process.launchPath = "/bin/sh"
        process.arguments = ["-c", command]
        process.standardOutput = pipe
        process.launch()
        return pipe.fileHandleForReading.readDataToEndOfFile()
    }

}

extension Command: ExpressibleByStringLiteral {

    public init(unicodeScalarLiteral value: String) {
        self.init(command: value)
    }

    public init(extendedGraphemeClusterLiteral value: String) {
        self.init(command: value)
    }

    public init(stringLiteral value: String) {
        self.init(command: value)
    }

}
