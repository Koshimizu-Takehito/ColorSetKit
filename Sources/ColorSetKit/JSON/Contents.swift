//
//  Contents.swift
//  ColorSet
//
//  Created by Takehito Koshimizu on 2019/02/09.
//

struct Contents: Codable, Hashable {
    let info: Info
    let colors: [IdiomGamut]
}

#if canImport(AppKit)
import AppKit

@available(macOS, introduced:10.12)
extension Contents {

    var pairs: [(color: NSColor, info: [String])] {
        return colors.map { $0.pair }
    }
}

#endif
