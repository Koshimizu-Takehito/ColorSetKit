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

    let appearances: [AppearanceValue]?

    enum CodingKeys: String, CodingKey {

        case idiom, color

        case displayGamut = "display-gamut"

        case appearances
    }

}
