//
//  AppearanceValue.swift
//  ColorSet
//
//  Created by Takehito Koshimizu on 2019/02/09.
//

import Foundation

enum Appearance: Codable, Hashable {

    case contrast(Contrast)
    case luminosity(Luminosity)

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let appearance = try container.decode(String.self, forKey: .appearance)
        let value = try container.decode(String.self, forKey: .value)

        switch try Appearance(value: appearance) {
        case .contrast:
            try self = .contrast(Contrast(value: value))
        case .luminosity:
            try self = .luminosity(Luminosity(value: value))
        }
    }

    func encode(to encoder: Encoder) throws {
        var continer = encoder.container(keyedBy: CodingKeys.self)
        try continer.encode(appearance, forKey: .appearance)
        try continer.encode(value, forKey: .value)
    }

    enum CodingKeys: String, Codable, Hashable, CodingKey {
        case appearance
        case value
    }

    static func luminosity(value: Appearance) -> Luminosity? {
        switch value {
        case .luminosity(let unpacked):
            return unpacked
        default:
            return nil
        }
    }

    static func contrast(value: Appearance) -> Contrast? {
        switch value {
        case .contrast(let unpacked):
            return unpacked
        default:
            return nil
        }
    }

    private var appearance: String {
        switch self {
        case .contrast(_):
            return Appearance.contrast.rawValue
        case .luminosity(_):
            return Appearance.luminosity.rawValue
        }
    }

    private var value: String {
        switch self {
        case .contrast(let value):
            return value.rawValue
        case .luminosity(let value):
            return value.rawValue
        }
    }
}

extension Appearance {

    enum Appearance: String, Codable, Hashable {

        case contrast
        case luminosity

        init(value: String) throws {
            switch Appearance(rawValue: value) {
            case .none:
                throw Error.appearance(value)
            case .some(let value):
                self = value
            }
        }
    }

    enum Error: Swift.Error {
        case appearance(String)
        case value(String)
    }

}

enum Contrast: String, Codable, Hashable {

    case high

    init(value: String) throws {
        switch Contrast(rawValue: value) {
        case .none:
            throw Appearance.Error.value(value)
        case .some(let value):
            self = value
        }
    }
}

enum Luminosity: String, Codable, Hashable {

    case dark
    case light

    init(value: String) throws {
        switch Luminosity(rawValue: value) {
        case .none:
            throw Appearance.Error.value(value)
        case .some(let value):
            self = value
        }
    }
}
