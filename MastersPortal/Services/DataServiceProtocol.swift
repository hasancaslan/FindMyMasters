//
//  DataServiceProtocol.swift
//  MastersPortal
//
//  Created by HASAN CAN on 2/6/21.
//

import Foundation
import IGListKit
import SQLite

protocol DataServiceProtocol {
    associatedtype T
    func insert(item: T) throws -> Int64
    func delete(item: T) throws
    func findAll() throws -> [T]?
}
