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
    var type: String
    var language: String
    var url: String

    init(
        name: String,
        university: String,
        duration: String,
        type: String,
        language: String,
        url: String
    ) {
        self.name = name
        self.university = university
        self.duration = duration
        self.type = type
        self.language = language
        self.url = url
    }

    enum CodingKeys: String, CodingKey, CaseIterable {
        case university = "university_name"
        case name = "program_name"
        case type = "program_type"
        case duration
        case language
        case url = "program_url"
    }
}

extension Program: ListDiffable {
    func diffIdentifier() -> NSObjectProtocol {
        return (name + university + type) as NSObjectProtocol
    }

    func isEqual(toDiffableObject object: ListDiffable?) -> Bool {
        guard let object = object as? Program else { return false }
        return name == object.name && university == object.university && type == object.type
    }
}
