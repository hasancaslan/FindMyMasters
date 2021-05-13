//
//  ConfigurableCell.swift
//  MastersPortal
//
//  Created by HASAN CAN on 9/5/21.
//

import IGListKit

extension ConfigurableCell {
    static var reuseIdentifier: String { return String(describing: Self.self) }
}

protocol ConfigurableCell {
    associatedtype DataType
    func configure(_ viewModel: DataType)
    static var reuseIdentifier: String { get }
}
