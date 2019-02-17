//
//  Contents.swift
//  ColorSet
//
//  Created by Takehito Koshimizu on 2019/02/09.
//

struct Contents: Codable, Hashable {

    let info: Info

    let attributes: [Attributes]

    enum CodingKeys: String, CodingKey {
        case info
        case attributes = "colors"
    }
}
