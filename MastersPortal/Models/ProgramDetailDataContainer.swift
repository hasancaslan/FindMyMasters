//
//  ProgramDetailDataContainer.swift
//  MastersPortal
//
//  Created by HASAN CAN on 7/6/21.
//

import Foundation

struct ProgramDetailDataContainer {
    var universityName: String
    var programName: String

    var deadline: String
    var language: String
    var tution: String
    var duration: String

    var cityName: String
    var countryName: String

    var academicRequirement: String

    init(program: Program, term: Term, place: Place) {
        universityName = program.university
        programName = program.name

        deadline = term.deadline
        language = program.language
        tution = "\(term.tution1Money) \(term.tution1Currency)"
        duration = program.duration

        cityName = place.cityName
        countryName = place.countryName

        academicRequirement = term.academicRequirement
    }

    init(
        universityName: String,
        programName: String,
        deadline: String,
        language: String,
        duration: String,
        cityName: String,
        countryName: String,
        tution1Money: Int,
        tution1Currency: String,
        academicRequirement: String
    ) {
        self.universityName = universityName
        self.programName = programName

        self.deadline = deadline
        self.language = language
        self.tution = "\(tution1Money) \(tution1Currency)"
        self.duration = duration

        self.cityName = cityName
        self.countryName = countryName

        self.academicRequirement = academicRequirement
    }
}
