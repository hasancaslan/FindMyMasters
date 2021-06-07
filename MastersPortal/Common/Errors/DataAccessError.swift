//
//  DataAccessError.swift
//  MastersPortal
//
//  Created by HASAN CAN on 2/6/21.
//

import Foundation

enum DataAccessError: Error {
    case DatabaseConnectionError
    case InsertError
    case DeleteError
    case SearchError
    case NilInData
}
