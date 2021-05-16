//
//  Program.swift
//  MastersPortal
//
//  Created by HASAN CAN on 16/5/21.
//

import Foundation

class Program: NSObject {
    var name: String
    var university: String
    var duration: String
    var applyDate: String
    var startDate: String
    var tuition: Double
    var about: String

    init(name: String, university: String, duration: String, applyDate: String, startDate: String, tuition: Double, about: String) {
        self.name = name
        self.university = university
        self.duration = duration
        self.applyDate = applyDate
        self.startDate = startDate
        self.tuition = tuition
        self.about = about
    }
}
