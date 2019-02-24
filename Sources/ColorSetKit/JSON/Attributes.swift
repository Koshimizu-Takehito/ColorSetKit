//
//  Attributes.swift
//  ColorSet
//
//  Created by Takehito Koshimizu on 2019/02/09.
//

struct Attributes: Codable, Hashable {

    let color: Color

    let idiom: Idiom

    let displayGamut: DisplayGamut?

    let appearances: Appearances

    enum CodingKeys: String, CodingKey {

        case color

        case idiom

        case displayGamut = "display-gamut"

        case appearances
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        color = try container.decode(Color.self, forKey: .color)
        idiom = try container.decode(Idiom.self, forKey: .idiom)
        displayGamut = try container.decodeIfPresent(DisplayGamut.self, forKey: .displayGamut)
        appearances = (try container.decodeIfPresent([AppearanceItem].self, forKey: .appearances))
            .map(Appearances.init) ?? .null()
    }

    func encode(to encoder: Encoder) throws {
        var continer = encoder.container(keyedBy: CodingKeys.self)
        try continer.encode(color, forKey: .color)
        try continer.encode(idiom, forKey: .idiom)
        try continer.encodeIfPresent(displayGamut, forKey: .displayGamut)
        try continer.encodeIfPresent(appearances.items, forKey: .appearances)
    }
}
