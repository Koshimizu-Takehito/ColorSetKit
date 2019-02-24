//
//  AttributesFormatter.swift
//  ColorSetKit
//
//  Created by Takehito Koshimizu on 2019/02/24.
//

final class AttributesFormatter {

    private let formatter: AppearancesFormatter

    init(formatter: AppearancesFormatter) {
        self.formatter = formatter
    }

    convenience init(contents: Contents) {
        self.init(formatter: .init(contents: contents))
    }

    func string(from attributes: Attributes) -> String {
        let strings = [
            attributes.idiom.description,
            attributes.displayGamut?.description,
            formatter.string(from: attributes.appearances)]
        return strings
            .compact()
            .joined(separator: " | ")
    }
}
