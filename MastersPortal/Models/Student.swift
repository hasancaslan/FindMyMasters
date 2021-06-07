//
//  Student.swift
//  MastersPortal
//
//  Created by HASAN CAN on 2/6/21.
//

import IGListKit
import SQLite

class Student: Codable {
    var name: String
    var gender: String
    var birthday: Date
    var ssn: Int
    var languages: String
    var sid: Int

    init(
        name: String,
        gender: String,
        birthday: Date,
        ssn: Int,
        languages: String,
        sid: Int
    ) {
        self.name = name
        self.gender = gender
        self.birthday = birthday
        self.ssn = ssn
        self.languages = languages
        self.sid = sid
    }

    enum CodingKeys: String, CodingKey, CaseIterable {
        case name
        case gender
        case birthday
        case ssn
        case languages
        case sid
    }
}

extension Student: ListDiffable {
    func diffIdentifier() -> NSObjectProtocol {
        return sid as NSObjectProtocol
    }

    func isEqual(toDiffableObject object: ListDiffable?) -> Bool {
        guard let object = object as? Student else { return false }
        return sid == object.sid
    }
}
