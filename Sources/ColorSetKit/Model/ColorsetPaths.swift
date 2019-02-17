//
//  ColorsetPaths.swift
//  ColorSetKit
//
//  Created by Takehito Koshimizu on 2019/02/16.
//

import ShellKit

struct ColorsetPaths {

    let paths: [String]
}

extension ColorsetPaths {

    static func currentDir() -> ColorsetPaths {
        return ColorsetPaths(paths: Array(Command.findColorSets.lines))
    }
}
