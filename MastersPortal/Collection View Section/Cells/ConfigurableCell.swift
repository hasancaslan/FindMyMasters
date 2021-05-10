//
//  ConfigurableCell.swift
//  MastersPortal
//
//  Created by HASAN CAN on 9/5/21.
//

import Foundation

public extension ConfigurableCell {
    static var reuseIdentifier: String { return String(describing: Self.self) }
}

public protocol ConfigurableCell {
    associatedtype DataType
    func configure(_ data: DataType)
    static var reuseIdentifier: String { get }
}
