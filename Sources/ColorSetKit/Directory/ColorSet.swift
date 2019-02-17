//
//  ColorSet.swift
//  ColorSet
//
//  Created by Takehito Koshimizu on 2019/02/09.
//

import Foundation

struct ColorSet: Hashable {

    let path: URL

    let name: String

    let fileUrl: URL

    let contents: Contents

}

extension ColorSet {

    init(path: String) throws {
        let path = URL(fileURLWithPath: path)
        let fileUrl = ColorSet.fileUrl(from: path)
        let contents = try ColorSet.contents(from: fileUrl)
        let name = ColorSet.name(from: path)
        self.init(path: path, name: name, fileUrl: fileUrl, contents: contents)
    }

    static func fileUrl(from path: URL) -> URL {
        var temp = path
        temp.appendPathComponent("Contents")
        temp.appendPathExtension("json")
        return temp
    }

    static func contents(from url: URL) throws -> Contents {
        let data = try NSData(contentsOf: url, options: []) as Data
        return try JSONDecoder().decode(Contents.self, from:data)
    }

    static func name(from path: URL) -> String {
        return (path.lastPathComponent as NSString)
            .deletingPathExtension
    }
}
