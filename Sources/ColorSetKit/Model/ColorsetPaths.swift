//
//  ColorsetPaths.swift
//  ColorSetKit
//
//  Created by Takehito Koshimizu on 2019/02/16.
//

struct ColorsetPaths {

    let colorsetPaths: [String]
}

extension ColorsetPaths {

    static func currentDir() -> ColorsetPaths {
        return ColorsetPaths(
            colorsetPaths: Command.findColorSets.lines)
    }
}
