//
//  Idiom.swift
//  ColorSet
//
//  Created by Takehito Koshimizu on 2019/02/09.
//

enum Idiom: String, Codable, Hashable, CaseIterable {

    case universal

    case iphone

    case ipad

    case watch

    case tv

    case mac

}

extension Idiom: CustomStringConvertible {

    var description: String {
        let index = Idiom.allCases.firstIndex(of: self)!
        return Description.allCases[index].rawValue
    }

    private enum Description: String, CaseIterable {

        case universal = "Universal"

        case iphone = "iPhone"

        case ipad = "iPad"

        case watch = "Apple Watch"

        case tv = "Apple TV"

        case mac = "Mac"
    }
}
