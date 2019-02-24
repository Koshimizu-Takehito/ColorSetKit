//
//  Appearances.swift
//  ColorSet
//
//  Created by Takehito Koshimizu on 2019/02/09.
//

struct Appearances: Codable, Hashable {

    let luminosity: Luminosity?

    let contrast: Contrast?

    init(from decoder: Decoder) throws {
        var luminosity = Luminosity?.none
        var contrast = Contrast?.none
        var container = try decoder.unkeyedContainer()
        while container.isAtEnd {
            switch try container.decode(AppearanceItem.self) {
            case .luminosity(let value):
                luminosity = value
            case .contrast(let value):
                contrast = value
            }
        }
        self.luminosity = luminosity
        self.contrast = contrast
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.unkeyedContainer()
        try luminosity.map(AppearanceItem.luminosity).map { try container.encode($0) }
        try contrast.map(AppearanceItem.contrast).map { try container.encode($0) }
    }
}
