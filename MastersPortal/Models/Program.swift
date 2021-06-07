//
//  Program.swift
//  MastersPortal
//
//  Created by HASAN CAN on 16/5/21.
//

import IGListKit

class Program: Codable {
    var name: String
    var university: String
    var duration: String
    var language: String

    init(
        name: String,
        university: String,
        duration: String,
        language: String
    ) {
        self.name = name
        self.university = university
        self.duration = duration
        self.language = language
    }

    enum CodingKeys: String, CodingKey, CaseIterable {
        case university = "university_name"
        case name = "program_name"
        case duration
        case language
    }
}

extension Program: ListDiffable {
    func diffIdentifier() -> NSObjectProtocol {
        return (name + university ) as NSObjectProtocol
    }

    func isEqual(toDiffableObject object: ListDiffable?) -> Bool {
        guard let object = object as? Program else { return false }
        return name == object.name && university == object.university
    }
}
