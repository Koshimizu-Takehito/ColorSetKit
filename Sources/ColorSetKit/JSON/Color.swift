//
//  Color.swift
//  ColorSet
//
//  Created by Takehito Koshimizu on 2019/02/09.
//

struct Color: Codable, Hashable {

    let colorSpace: ColorSpace

    let components: Components

    enum CodingKeys: String, CodingKey {
        case colorSpace = "color-space"
        case components
    }

}

#if canImport(AppKit)
import AppKit

@available(macOS, introduced:10.12)
extension Color {

    var nsColor: NSColor {
        let components = self.components.colorComponents
        return NSColor(colorSpace: colorSpace.colorSpace,
                       components: components,
                       count: components.count)
    }
    
}

#endif
