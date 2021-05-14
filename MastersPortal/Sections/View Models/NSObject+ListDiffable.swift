//
//  NSObject+ListDiffable.swift
//  MastersPortal
//
//  Created by HASAN CAN on 12/5/21.
//

import Foundation
import IGListKit

// MARK: - ListDiffable

extension NSObject: ListDiffable {
    public func diffIdentifier() -> NSObjectProtocol {
        return self
    }

    public func isEqual(toDiffableObject object: ListDiffable?) -> Bool {
        return isEqual(object)
    }
}
