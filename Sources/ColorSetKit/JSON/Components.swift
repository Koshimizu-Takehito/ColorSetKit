//
//  Components.swift
//  ColorSet
//
//  Created by Takehito Koshimizu on 2019/02/09.
//

enum Components: Codable, Hashable {

    case rgb(red: String, green: String, blue: String, alpha: String)

    case grayscale(white: String, alpha: String)

    enum CodingKeys: String, CodingKey {
        case red
        case green
        case blue
        case white
        case alpha
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let alpha = try container.decode(String.self, forKey: .alpha)

        if let white = try container.decodeIfPresent(String.self, forKey: .white) {
            self = .grayscale(
                white: white,
                alpha: alpha)
        } else {
            try self = .rgb(
                red: container.decode(String.self, forKey: .red),
                green: container.decode(String.self, forKey: .green),
                blue: container.decode(String.self, forKey: .blue),
                alpha: alpha)
        }
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        switch self {
        case .rgb(let red, let green, let blue, let alpha):
            try container.encode(red, forKey: .red)
            try container.encode(green, forKey: .green)
            try container.encode(blue, forKey: .blue)
            try container.encode(alpha, forKey: .alpha)
        case .grayscale(let white, let alpha):
            try container.encode(white, forKey: .white)
            try container.encode(alpha, forKey: .alpha)
        }
    }

}

#if canImport(CoreGraphics)
import CoreGraphics

extension Components {

    var colorComponents: [CGFloat] {
        return components.compactMap(Components.toCGFloat)
    }

}

private extension Components {

    var components: [String] {
        switch self {
        case .rgb(let red, let green, let blue, let alpha):
            return [red, green, blue, alpha]
        case .grayscale(let white, let alpha):
            return [white, alpha]
        }
    }

    private static func toCGFloat(_ string: String) -> CGFloat? {
        switch string {
        case _ where string.hasPrefix("0x"):
            return hexToCGFloat(string)
        case _ where string.hasPrefix("0.") || string.hasPrefix("1."):
            return Float(string).map(CGFloat.init)
        default:
            return Int(string).map(intToCGFloat)
        }
    }

    private static func hexToCGFloat(_ hex: String) -> CGFloat? {
        let hex = hex.suffix(from: hex.index(hex.startIndex, offsetBy: "0x".count))
        return Int(hex, radix: 16).map(intToCGFloat)
    }

    private static func intToCGFloat(_ int: Int) -> CGFloat {
        return CGFloat(int) / 255
    }

}

#endif
