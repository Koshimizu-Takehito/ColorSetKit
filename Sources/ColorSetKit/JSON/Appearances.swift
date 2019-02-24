//
//  Appearances.swift
//  ColorSet
//
//  Created by Takehito Koshimizu on 2019/02/09.
//

struct Appearances: Hashable {

    let luminosity: Luminosity?

    let contrast: Contrast?

    init(luminosity: Luminosity?, contrast: Contrast?) {
        self.luminosity = luminosity
        self.contrast = contrast
    }

    init(items: [AppearanceItem]) {
        var luminosity: Luminosity? = nil
        var contrast: Contrast? = nil
        for item in items {
            switch item {
            case .luminosity(let value):
                luminosity = value
            case .contrast(let value):
                contrast = value
            }
        }
        self.init(luminosity: luminosity, contrast: contrast)
    }

    var items: [AppearanceItem]? {
        var items = [AppearanceItem?]()
        items.append(luminosity.map(AppearanceItem.luminosity))
        items.append(contrast.map(AppearanceItem.contrast))
        return items.compact().wrapOptional()
    }

    static func null() -> Appearances {
        return  Appearances(luminosity: nil, contrast: nil)
    }
}
