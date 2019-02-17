//
//  ColorsetPaths.swift
//  ColorSetKit
//
//  Created by Takehito Koshimizu on 2019/02/16.
//

import ShellKit

struct ColorsetPaths {

    let colorsetPaths: [String]
}

extension ColorsetPaths {

    static func currentDir() -> ColorsetPaths {
        return ColorsetPaths(colorsetPaths: Array(Command.findColorSets.lines))
    }
}
