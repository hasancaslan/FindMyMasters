////
////  DataService.swift
////  MastersPortal
////
////  Created by HASAN CAN on 2/6/21.
////
//
// import Foundation
// import SQLite
//
// class DataService<T: Codable>: DataServiceProtocol where T: PrimaryKeyFilter, T.FilterDataType == T {
//    let table: Table
//
//    init(tableName: String) {
//        table = Table(tableName)
//    }
//
//    //    static func createTable() throws {
//    //        guard let DB = DatabaseService.shared.BBDB else {
//    //            throw DataAccessError.DatabaseConnectionError
//    //        }
//    //
//    //        do {
//    //            _ = try DB.run(
//    //                table.create(ifNotExists: true) { t in
//    //                    t.column(teamId, primaryKey: true)
//    //                    t.column(city)
//    //                    t.column(nickName)
//    //                    t.column(abbreviation)
//    //                })
//    //
//    //        } catch _ {
//    //            // Error throw if table already exists
//    //        }
//    //    }
//
//    func insert(item: T) throws -> Int64 {
//        guard let db = DatabaseService.shared.DB else {
//            throw DataAccessError.DatabaseConnectionError
//        }
//
//        do {
//            let insert = try table.insert(item)
//            let rowId = try db.run(insert)
//            guard rowId > 0 else {
//                throw DataAccessError.InsertError
//            }
//
//            return rowId
//        } catch _ {
//            throw DataAccessError.InsertError
//        }
//    }
//
//    func delete(item: T) throws {
//        guard let db = DatabaseService.shared.DB else {
//            throw DataAccessError.DatabaseConnectionError
//        }
//
//        let query = table.filter(T.getPrimaryKeyFilter(item: item))
//
//        do {
//            let tmp = try db.run(query.delete())
//            guard tmp == 1 else {
//                throw DataAccessError.DeleteError
//            }
//        } catch _ {
//            throw DataAccessError.DeleteError
//        }
//    }
//
//    //    func find(id: Int) throws -> T? {
//    //        guard let db = DatabaseService.shared.BBDB else {
//    //            throw DataAccessError.DatabaseConnectionError
//    //        }
//    //
//    //        let query = table.filter(sid == id)
//    //        let loadedStudents: [Student] = try db.prepare(query).map { row in
//    //            try row.decode()
//    //        }
//    //
//    //        return loadedStudents.first
//    //    }
//
//    func findAll() throws -> [T]? {
//        guard let db = DatabaseService.shared.DB else {
//            throw DataAccessError.DatabaseConnectionError
//        }
//
//        let loadedRows: [T] = try db.prepare(table).map { row in
//            try row.decode()
//        }
//
//        return loadedRows
//    }
// }
