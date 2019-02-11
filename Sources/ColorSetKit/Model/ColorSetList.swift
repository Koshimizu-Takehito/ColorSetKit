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
        let colorSets = paths.compactMap(ColorSet.init)
        self.init(name: name, colorSets: colorSets)
    }

    public static func ofCurrentDir() -> ColorSets {
        return ColorSets(name: FileInfo.productName, paths: FileInfo.colorsetPaths)
    }
}

#if canImport(AppKit)
import AppKit

// MARK: - Write out NSColorList
@available(macOS, introduced:10.12)
public extension ColorSets {

    /// save the color list to user's ~/Library/Colors directory.
    public func saveToUsersLibraryColors() {
        try? nsColorList.write(to: nil)
    }

    private var nsColorList: NSColorList {
        let colorList = NSColorList(name: name)
        colorSets.colors.forEach(colorList.setColor)
        return colorList
    }
}

// FIXME: XXX:
@available(macOS, introduced:10.12)
extension ColorSet {

    public var colors: [(color: NSColor, key: String)] {
        return contents.pairs.map { pair in
            return (
                color: pair.color,
                key: pair.info.isEmpty
                    ? name
                    : "\(name) ( \(pair.info.joined(separator: " | ")) )")
        }
    }
}

// FIXME: XXX:
@available(macOS, introduced:10.12)
extension Collection where Element==ColorSet {

    var colors: [(color: NSColor, key: String)] {
        return lazy.flatMap { $0.colors }
    }
}

#endif
