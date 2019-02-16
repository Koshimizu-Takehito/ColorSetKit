//
//  ColorsetPaths.swift
//  ColorSetKit
//
//  Created by Takehito Koshimizu on 2019/02/16.
//

public struct ColorsetPaths {

    public let colorsetPaths: [String]

}

extension ColorsetPaths {

    public static func currentDir() -> ColorsetPaths {
        return ColorsetPaths(
            colorsetPaths: Command.findColorSets.lines)
    }

}
