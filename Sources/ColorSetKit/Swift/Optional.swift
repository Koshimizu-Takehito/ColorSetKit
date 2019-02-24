//
//  Optional.swift
//  ColorSetKit
//
//  Created by Takehito Koshimizu on 2019/02/11.
//

protocol OptionalProtocol: ExpressibleByNilLiteral {
    associatedtype Wrapped

    var unsafelyUnwrapped: Wrapped { get }

    func map<U>(_ transform: (Wrapped) throws -> U) rethrows -> U?
    func flatMap<U>(_ transform: (Wrapped) throws -> U?) rethrows -> U?

    static func ~= (lhs: _OptionalNilComparisonType, rhs: Self) -> Bool

    static func == (lhs: Self, rhs: _OptionalNilComparisonType) -> Bool
    static func == (lhs: _OptionalNilComparisonType, rhs: Self) -> Bool

    static func != (lhs: Self, rhs: _OptionalNilComparisonType) -> Bool
    static func != (lhs: _OptionalNilComparisonType, rhs: Self) -> Bool
}

extension Optional: OptionalProtocol {}

extension Optional where Wrapped: Sequence {

    var unwrapped: [Wrapped.Element] {
        switch self {
        case .none:
            return []
        case .some(let wrapped):
            return Array(wrapped)
        }
    }
}

extension Sequence where Element: OptionalProtocol {

    @inlinable
    func compact() -> [Element.Wrapped] {
        return compactMap { element in
            switch element {
            case nil:
                return Element.Wrapped?.none
            default:
                return element.unsafelyUnwrapped
            }
        }
    }
}
