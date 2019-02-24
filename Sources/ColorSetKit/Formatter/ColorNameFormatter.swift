//
//  ColorNameFormatter.swift
//  ColorSetKit
//
//  Created by Takehito Koshimizu on 2019/02/24.
//

final class ColorNameFormatter {

    private let colorSetName: String
    private let formatter: AttributesFormatter

    init(colorSetName: String, formatter: AttributesFormatter) {
        self.colorSetName = colorSetName
        self.formatter = formatter
    }

    convenience init(colorSet: ColorSet) {
        self.init(colorSetName: colorSet.name, formatter: .init(contents: colorSet.contents))
    }

    func string(from attributes: Attributes) -> String {
        return "\(colorSetName) ( \(formatter.string(from: attributes)) )"
    }
}

