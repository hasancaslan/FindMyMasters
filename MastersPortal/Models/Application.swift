//
//  Application.swift
//  MastersPortal
//
//  Created by HASAN CAN on 2/6/21.
//

import IGListKit
import SQLite

class Application: Codable {
    var universityName: String
    var programName: String
    var programType: String
    var sid: Int
    var aid: Int

    init(
        universityName: String,
        programName: String,
        programType: String,
        sid: Int,
        aid: Int
    ) {
        self.universityName = universityName
        self.programName = programName
        self.programType = programType
        self.sid = sid
        self.aid = aid
    }

    init(program: Program, student: Student, aid: Int) {
        self.universityName = program.university
        self.programName = program.name
        self.programType = program.type
        self.sid = student.sid
        self.aid = aid
    }

    enum CodingKeys: String, CodingKey, CaseIterable {
        case universityName = "university_name"
        case programName = "program_name"
        case programType = "program_type"
        case sid
        case aid
    }
}

extension Application: ListDiffable {
    func diffIdentifier() -> NSObjectProtocol {
        return aid as NSObjectProtocol
    }

    func isEqual(toDiffableObject object: ListDiffable?) -> Bool {
        guard let object = object as? Application else { return false }
        return sid == object.aid
    }
}
