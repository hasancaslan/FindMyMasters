//
//  Term.swift
//  MastersPortal
//
//  Created by HASAN CAN on 2/6/21.
//

import IGListKit

class Term: Codable {
    var universityName: String
    var programName: String
    var deadline: String
    var academicRequirement: String
    var tution1Currency: String
    var tution1Money: Int
    var tution1Type: String
    var tution2Currency: String
    var tution2Money: Int
    var tution2Type: String
    var tuitionPriceSpecification: String
    var ieltsScore: Int

    init(
        universityName: String,
        programName: String,
        deadline: String,
        academicRequirement: String,
        tution1Currency: String,
        tution1Money: Int,
        tution1Type: String,
        tution2Currency: String,
        tution2Money: Int,
        tution2Type: String,
        ieltsScore: Int,
        tuitionPriceSpecification: String
    ) {
        self.universityName = universityName
        self.programName = programName
        self.deadline = academicRequirement
        self.academicRequirement = academicRequirement
        self.tution1Currency = tution1Currency
        self.tution1Money = tution1Money
        self.tution1Type = tution1Type
        self.tution2Currency = tution2Currency
        self.tution2Money = tution2Money
        self.tution2Type = tution2Type
        self.ieltsScore = ieltsScore
        self.tuitionPriceSpecification = tuitionPriceSpecification
    }

    init(
        program: Program,
        deadline: String,
        academicRequirement: String,
        tution1Currency: String,
        tution1Money: Int,
        tution1Type: String,
        tution2Currency: String,
        tution2Money: Int,
        tution2Type: String,
        ieltsScore: Int,
        tuitionPriceSpecification: String
    ) {
        self.universityName = program.university
        self.programName = program.name
        self.deadline = academicRequirement
        self.academicRequirement = academicRequirement
        self.tution1Currency = tution1Currency
        self.tution1Money = tution1Money
        self.tution1Type = tution1Type
        self.tution2Currency = tution2Currency
        self.tution2Money = tution2Money
        self.tution2Type = tution2Type
        self.ieltsScore = ieltsScore
        self.tuitionPriceSpecification = tuitionPriceSpecification
    }

    enum CodingKeys: String, CodingKey, CaseIterable {
        case universityName = "university_name"
        case programName = "program_name"
        case deadline
        case academicRequirement = "academic_req"
        case tution1Currency = "tution_1_currency"
        case tution1Money = "tution_1_money"
        case tution1Type = "tution_1_type"
        case tution2Currency = "tution_2_currency"
        case tution2Money = "tution_2_money"
        case tution2Type = "tution_2_type"
        case tuitionPriceSpecification = "tuition_price_specification"
        case ieltsScore = "ielts_score"
    }
}

extension Term: ListDiffable {
    func diffIdentifier() -> NSObjectProtocol {
        return (universityName + programName) as NSObjectProtocol
    }

    func isEqual(toDiffableObject object: ListDiffable?) -> Bool {
        guard let object = object as? Term else { return false }
        return universityName == object.universityName && programName == object.programName
    }
}
