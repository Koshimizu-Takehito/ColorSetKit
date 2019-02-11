//
//  ColorSpace.swift
//  ColorSet
//
//  Created by Takehito Koshimizu on 2019/02/09.
//

import AppKit

enum ColorSpace: String, Codable, Hashable {

    case srgb = "srgb"
    case extendedLinearSrgb = "extended-linear-srgb"
    case extendedSrgb = "extended-srgb"
    case displayP3 = "display-p3"
    case grayGamma22 = "gray-gamma-22"
    case extendedGray = "extended-gray"
}

extension ColorSpace {

    public var colorSpace: NSColorSpace {
        switch self {
        case .srgb:
            return .sRGB
        case .extendedLinearSrgb:
            let name = CGColorSpace.extendedLinearSRGB
            let cgSpace = CGColorSpace(name: name)!
            let nsSpace = NSColorSpace(cgColorSpace: cgSpace)!
            return nsSpace
        case .extendedSrgb:
            return .extendedSRGB
        case .displayP3:
            return .displayP3
        case .grayGamma22:
            return .genericGamma22Gray
        case .extendedGray:
            return .extendedGenericGamma22Gray
        }
    }
}
