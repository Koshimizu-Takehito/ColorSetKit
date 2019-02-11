//
//  Contents.swift
//  ColorSet
//
//  Created by Takehito Koshimizu on 2019/02/09.
//

import AppKit

struct Contents: Codable, Hashable {
    let info: Info
    let colors: [IdiomGamut]
}

extension Contents {

    var pairs: [(color: NSColor, info: [String])] {
        return colors.map { $0.pair }
    }
}
