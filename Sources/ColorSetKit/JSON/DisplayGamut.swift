//
//  DisplayGamut.swift
//  ColorSet
//
//  Created by Takehito Koshimizu on 2019/02/09.
//

enum DisplayGamut: String, Codable, Hashable, CaseIterable {

    case displayP3 = "display-P3"

    case sRGB = "sRGB"
}

extension DisplayGamut: CustomStringConvertible {

    var description: String {
        let index = DisplayGamut.allCases.firstIndex(of: self)!
        return Description.allCases[index].rawValue
    }

    private enum Description: String, CaseIterable {

        case displayP3 = "Display P3\t"

        case sRGB = "sRGB\t\t"
    }
}
