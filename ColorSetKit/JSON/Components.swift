//
//  Components.swift
//  ColorSet
//
//  Created by Takehito Koshimizu on 2019/02/09.
//

import CoreGraphics

struct Components: Codable, Hashable {

    let red: String?
    let green: String?
    let blue: String?
    let white: String?
    let alpha: String
}

extension Components {

    var colorComponents: [CGFloat] {
        return components.compactMap(toCGFloat)
    }
}

private extension Components {

    var components: [String] {
        switch (red, green, blue, white) {
        case (_, _, _, let white?):
            return [white, alpha]
        case (let red?, let green?, let blue?, _):
            return [red, green, blue, alpha]
        default:
            return []
        }
    }

    private func toCGFloat(_ string: String) -> CGFloat? {
        switch string {
        case _ where string.hasPrefix("0x"):
            return hexToCGFloat(string)
        case _ where string.hasPrefix("0.") || string.hasPrefix("1."):
            return Float(string).map(CGFloat.init)
        default:
            return Int(string).map(intToCGFloat)
        }
    }

    private func hexToCGFloat(_ hex: String) -> CGFloat? {
        let hex = hex.suffix(from: hex.index(hex.startIndex, offsetBy: "0x".count))
        return Int(hex, radix: 16).map(intToCGFloat)
    }

    private func intToCGFloat(_ int: Int) -> CGFloat {
        return CGFloat(int) / 255
    }
}
