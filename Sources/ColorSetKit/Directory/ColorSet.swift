//
//  ColorSet.swift
//  ColorSet
//
//  Created by Takehito Koshimizu on 2019/02/09.
//

import Foundation

public struct ColorSet: Hashable {

    let path: URL

    let name: String

    let fileUrl: URL

    let contents: Contents

}

extension ColorSet {

    public init?(path: String) {
        let path = URL(fileURLWithPath: path)
        let fileUrl = ColorSet.fileUrl(from: path)
        guard let name = ColorSet.name(from: path) else { return nil }
        guard let contents = try? ColorSet.contents(from: fileUrl) else { return nil }
        self.init(path: path, name: name, fileUrl: fileUrl, contents: contents)
    }

    static func name(from path: URL) -> String? {
        return path
            .lastPathComponent
            .split(separator: ".")
            .first
            .map(String.init)
    }

    static func contents(from url: URL) throws -> Contents {
        return try NSData(contentsOf: url)
            .flatMap { try JSONDecoder().decode(Contents.self, from:$0 as Data) }!
    }

    static func fileUrl(from path: URL) -> URL {
        var temp = path
        temp.appendPathComponent("Contents")
        temp.appendPathExtension("json")
        return temp
    }

}
