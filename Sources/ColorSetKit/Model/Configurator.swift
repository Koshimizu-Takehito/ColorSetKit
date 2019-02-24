//
//  Configurator.swift
//  ColorSetKit
//
//  Created by Takehito Koshimizu on 2019/02/17.
//

#if canImport(AppKit)
import AppKit

@available(macOS, introduced:10.12)
final class Configurator {
    private init() {}
}

@available(macOS, introduced:10.12)
extension Configurator {

    static func configure(_ colorList: NSColorList, with colorSets: [ColorSet]) {
        colorSets.flatMap(colorAndKeys).forEach(colorList.setColor)
    }

    private static func colorAndKeys(colorSet: ColorSet) -> [(color: NSColor, key: String)] {
        return colorSet.contents.attributes.map(colorAndKey(colorSet))
    }

    private static func colorAndKey(_ colorSet: ColorSet) -> (Attributes) -> (color: NSColor, key: String) {
        let formatter = ColorNameFormatter(colorSet: colorSet)
        return { (attributes: Attributes) in
            return (attributes.color.nsColor, formatter.string(from: attributes))
        }
    }
}

#endif
