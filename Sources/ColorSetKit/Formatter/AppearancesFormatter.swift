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

    func string(from appearances: Appearances) -> String {
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

    private func string(from pair: (Luminosity, Contrast)) -> String {
        switch pair {
        case (.dark, .high):
            return "Dark Appearance | High Contrast"
        case (.light, .high):
            return "Light Appearance | High Contrast"
        }
    }

    private func string(from luminosity: Luminosity) -> String {
        switch (luminosity, isHighContrastSupported) {
        case (.dark, true):
            return "Dark Appearance | Normal Contrast"
        case (.light, true):
            return "Light Appearance | Normal Contrast"
        case (.dark, false):
            return "Dark Appearance"
        case (.light, false):
            return "Light Appearance"
        }
    }

    private func string(from contrast:Contrast) -> String {
        switch (isDarkModeSupported, contrast) {
        case (true, .high):
            return "Any Luminosity | High Contrast"
        case (false, .high):
            return "High Contrast"
        }
    }

    private func string() -> String {
        switch (isDarkModeSupported, isHighContrastSupported) {
        case (true, true):
            return "Any Luminosity | Normal Contrast"
        case (true, false):
            return "Any Appearance"
        case (false, true):
            return "Normal Contrast"
        case (false, false):
            return ""
        }
    }
}

