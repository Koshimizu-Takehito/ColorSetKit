//
//  AppearancesFormatter.swift
//  ColorSetKit
//
//  Created by Takehito Koshimizu on 2019/02/24.
//

final class AppearancesFormatter {

    private let isDarkModeSupported: Bool
    private let isHighContrastSupported: Bool

    init(isDarkModeSupported: Bool, isHighContrastSupported: Bool) {
        self.isDarkModeSupported = isDarkModeSupported
        self.isHighContrastSupported = isHighContrastSupported
    }

    convenience init(contents: Contents) {
        self.init(isDarkModeSupported: contents.isDarkModeSupported,
                  isHighContrastSupported: contents.isHighContrastSupported)
    }

    func string(from appearances: Appearances) -> [String] {
        switch (appearances.luminosity, appearances.contrast) {
        case (let luminosity?, let contrast?):
            return string(from: (luminosity, contrast))
        case (let luminosity?, nil):
            return string(from: luminosity)
        case (nil, let contrast?):
            return string(from: contrast)
        case (nil, nil):
            return string()
        }
    }

    private func string(from pair: (Luminosity, Contrast)) -> [String] {
        switch pair {
        case (.dark, .high):
            return ["Dark Appearance\t", "High Contrast\t\t\t\t"]
        case (.light, .high):
            return ["Light Appearance\t", "High Contrast\t\t\t\t"]
        }
    }

    private func string(from luminosity: Luminosity) -> [String] {
        switch (luminosity, isHighContrastSupported) {
        case (.dark, true):
            return ["Dark Appearance\t", "Normal Contrast\t"]
        case (.light, true):
            return ["Light Appearance\t", "Normal Contrast\t"]
        case (.dark, false):
            return ["Dark Appearance\t"]
        case (.light, false):
            return ["Light Appearance\t"]
        }
    }

    private func string(from contrast:Contrast) -> [String] {
        switch (isDarkModeSupported, contrast) {
        case (true, .high):
            return ["Any Luminosity\t\t", "High Contrast\t\t\t\t"]
        case (false, .high):
            return ["High Contrast\t\t\t\t"]
        }
    }

    private func string() -> [String] {
        switch (isDarkModeSupported, isHighContrastSupported) {
        case (true, true):
            return ["Any Luminosity\t\t", "Normal Contrast\t"]
        case (true, false):
            return ["Any Appearance\t\t"]
        case (false, true):
            return ["Normal Contrast\t"]
        case (false, false):
            return []
        }
    }
}

