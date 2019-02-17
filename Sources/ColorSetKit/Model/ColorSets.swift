//
//  ColorSets.swift
//  ColorSetKit
//
//  Created by Takehito Koshimizu on 2019/02/11.
//

// MARK: - ColorSets
/// ColorSets
public struct ColorSets: Hashable {

    private let name: String

    private let colorSets: [ColorSet]
}

// MARK: - Instanciate
public extension ColorSets {

    public init(name: String, paths: [String]) {
        self.init(
            name: name,
            colorSets: paths.compactMap(ColorSet.init))
    }

    public static func currentDir() -> ColorSets {
        return ColorSets(
            name: FileInfo.currentDir().outputName,
            paths: ColorsetPaths.currentDir().paths)
    }
}

#if canImport(AppKit)
import AppKit

// MARK: - Write out NSColorList
@available(macOS, introduced:10.12)
public extension ColorSets {

    /// save the color list to user's \"~/Library/Colors\" directory.
    public func write() {
        let list = NSColorList(name: name)
        Configurator.configure(list, with: colorSets)
        try? list.write(to: nil)
    }
}

#endif
