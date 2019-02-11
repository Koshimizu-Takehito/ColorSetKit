//
//  IdiomGamut.swift
//  ColorSet
//
//  Created by Takehito Koshimizu on 2019/02/09.
//

import AppKit

struct IdiomGamut: Codable, Hashable {
    let color: Color
    let idiom: Idiom
    let displayGamut: DisplayGamut?
    let appearances: [AppearanceValue]?

    enum CodingKeys: String, CodingKey {
        case idiom, color
        case displayGamut = "display-gamut"
        case appearances
    }
}

extension IdiomGamut {

    var pair: (color: NSColor, info: [String]) {
        var info: [String?] = appearances?.map { $0.value.rawValue } ?? []
        info.append(displayGamut?.rawValue)
        return (color.nsColor, info.compactMap { $0 })
    }
}
