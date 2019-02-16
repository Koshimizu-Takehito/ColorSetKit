//
//  IdiomGamut.swift
//  ColorSet
//
//  Created by Takehito Koshimizu on 2019/02/09.
//

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

#if canImport(AppKit)
import AppKit

@available(macOS, introduced:10.12)
extension IdiomGamut {

    var pair: (color: NSColor, info: [String]) {
        // FIXME: append appearance
        var info: [String?] = appearances?.map { $0.value.rawValue } ?? []
        // FIXME: append idiom
        info.append(displayGamut?.rawValue)
        return (color.nsColor, info.compactMap { $0 })
    }
}

#endif
