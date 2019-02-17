//
//  Configurator.swift
//  ColorSetKit
//
//  Created by Takehito Koshimizu on 2019/02/17.
//

#if canImport(AppKit)
import AppKit

@available(macOS, introduced:10.12)
class Configurator {
    private init() {}
}

extension Configurator {

    static func configure(_ colorList: NSColorList, with colorSets: [ColorSet]) {
        colorSets
            .flatMap(colorAndKeys)
            .forEach(colorList.setColor)
    }

    static func colorAndKeys(colorSet: ColorSet) -> [(color: NSColor, key: String)] {
        let name = colorSet.name
        return colorSet.contents.attributes.map {
            colorAndKey(fileName: name, attributes: $0)
        }
    }

    static func colorAndKey(fileName: String, attributes: Attributes) -> (color: NSColor, key: String) {
        let color = attributes.color.nsColor
        let key = Formatter.colorName(fileName: fileName, attributes: attributes)
        return (color, key)
    }
}

#endif
