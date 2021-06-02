//
//  Place.swift
//  MastersPortal
//
//  Created by HASAN CAN on 2/6/21.
//

import IGListKit

class Place: Codable {
    var universityName: String
    var programName: String
    var countryName: String
    var countryCode: String
    var cityName: String

    init(
        universityName: String,
        programName: String,
        countryName: String,
        countryCode: String,
        cityName: String
    ) {
        self.universityName = universityName
        self.programName = programName
        self.countryName = countryName
        self.countryCode = countryCode
        self.cityName = cityName
    }

    init(
        program: Program,
        countryName: String,
        countryCode: String,
        cityName: String
    ) {
        self.universityName = program.university
        self.programName = program.name
        self.countryName = countryName
        self.countryCode = countryCode
        self.cityName = cityName
    }

    enum CodingKeys: String, CodingKey {
        case universityName = "university_name"
        case programName = "program_name"
        case countryName = "country_name"
        case countryCode = "country_code"
        case cityName = "city"
    }
}

extension Place: ListDiffable {
    func diffIdentifier() -> NSObjectProtocol {
        return (universityName + countryName + programName) as NSObjectProtocol
    }

    func isEqual(toDiffableObject object: ListDiffable?) -> Bool {
        guard let object = object as? Place else { return false }
        return universityName == object.universityName && countryName == object.countryName && programName == object.programName
    }
}
