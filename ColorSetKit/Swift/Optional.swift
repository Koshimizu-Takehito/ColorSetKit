//
//  Optional.swift
//  ColorSetKit
//
//  Created by Takehito Koshimizu on 2019/02/11.
//

extension Optional where Wrapped: Sequence {

    public var safelyUnwrapped: [Wrapped.Element] {
        switch self {
        case .none:
            return []
        case .some(let wrapped):
            return Array(wrapped)
        }
    }
}

