//
//  AttributesFormatter.swift
//  ColorSetKit
//
//  Created by Takehito Koshimizu on 2019/02/17.
//

import Foundation

class Formatter {
    private init() {}
}

extension Formatter {

    static func colorName(fileName: String, attributes: Attributes) -> String {
        let attributes = format(attributes: attributes)
        return "\(fileName) ( \(attributes.joined(separator: " | "))) )"
    }

    static func format(attributes: Attributes) -> [String] {
        var info: [String?] = []
        info.append(format(idiom: attributes.idiom))
        info.append(format(displayGamut: attributes.displayGamut))
        info.append(format(appearances: attributes.appearances))
        return info.compactMap { $0 }
    }

    static func format(idiom: Idiom) -> String {
        return idiom.description
    }

    static func format(displayGamut: DisplayGamut?) -> String? {
        return displayGamut?.description
    }

    // TODO: 実装
    static func format(appearances: [AppearanceValue]?) -> String? {
        fatalError()
    }
}
