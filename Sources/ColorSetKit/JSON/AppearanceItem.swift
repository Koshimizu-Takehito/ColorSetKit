//
//  AppearanceItem.swift
//  ColorSetKit
//
//  Created by Takehito Koshimizu on 2019/02/23.
//

enum AppearanceItem: Codable, Hashable {

    case luminosity(Luminosity)

    case contrast(Contrast)

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        switch try container.decode(Key.self, forKey: .key) {
        case .luminosity:
            try self = .luminosity(container.decode(Luminosity.self, forKey: .value))
        case .contrast:
            try self = .contrast(container.decode(Contrast.self, forKey: .value))
        }
    }

    func encode(to encoder: Encoder) throws {
        var continer = encoder.container(keyedBy: CodingKeys.self)
        switch self {
        case .luminosity(let value):
            try continer.encode(Key.luminosity, forKey: .key)
            try continer.encode(value, forKey: .value)
        case .contrast(let value):
            try continer.encode(Key.contrast, forKey: .key)
            try continer.encode(value, forKey: .value)
        }
    }

    enum CodingKeys: String, Codable, Hashable, CodingKey {
        case key = "appearance"
        case value
    }

    private enum Key: String, Codable, Hashable {
        case contrast
        case luminosity
    }
}
