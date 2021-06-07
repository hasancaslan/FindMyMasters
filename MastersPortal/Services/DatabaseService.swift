//
//  DatabaseService.swift
//  MastersPortal
//
//  Created by HASAN CAN on 2/6/21.
//

import Foundation
import SQLite

final class DatabaseService {
    static let shared = {
        DatabaseService()
    }()

    let programsTable = Table("PROGRAMS")
    let citiesTable = Table("CITY")
    let placesTable = Table("PLACES")

    let DB: Connection?

    private init() {
        do {
            let databaseFilePath = Bundle.main.path(forResource: "mastersportal", ofType: "sqlite")!
            DB = try Connection(databaseFilePath)
        } catch {
            print("Could not connect to db.")
            print(error.localizedDescription)
            DB = nil
        }
    }

    func connectionError() {
        print("Could not connect to db.")
    }

    func decodeError(table: String, error: Error) {
        print("Could not decode \(table) table.")
        print(error)
    }

    func getAllPrograms() -> [Program]? {
        guard let db = DB else {
            connectionError()
            return nil
        }

        do {
            let loadedRows: [Program] = try db.prepare(programsTable).map { row in
                print(row)
                return try row.decode()
            }

            return loadedRows
        } catch {
            decodeError(table: "PROGRAMS", error: error)
            return nil
        }
    }
    
    func getAllCitiesInCountry(country: String) -> [City]? {
        guard let db = DB else {
            connectionError()
            return nil
        }

        let queryString = "SELECT * FROM CITY WHERE Country = '\(country)'"
        let countryColumn = Expression<String>(City.CodingKeys.country.rawValue)
        let query = citiesTable.filter(countryColumn == country)
        
        do {
            let loadedCities: [City] = try db.prepare(query).map { row in
                try row.decode()
            }

            return loadedCities
        } catch {
            decodeError(table: "CITY", error: error)
            return nil
        }
    }

    func findCity(name: String, country: String) -> City? {
        guard let db = DB else {
            connectionError()
            return nil
        }

        let queryString = "SELECT * FROM CITY WHERE City = '\(name)' AND Country = '\(country)'"
        let nameColumn = Expression<String>(City.CodingKeys.name.rawValue)
        let countryColumn = Expression<String>(City.CodingKeys.country.rawValue)
        let query = citiesTable.filter(nameColumn == name && countryColumn == country)
        
        do {
            let loadedCities: [City] = try db.prepare(query).map { row in
                try row.decode()
            }

            return loadedCities.first
        } catch {
            decodeError(table: "CITY", error: error)
            return nil
        }
    }

    func getAllPlaces() {
        guard let db = DB else {
            return connectionError()
        }

        let universityName = Expression<String>(Place.CodingKeys.universityName.rawValue)
        let programName = Expression<String>(Place.CodingKeys.programName.rawValue)
        let countryName = Expression<String>(Place.CodingKeys.countryName.rawValue)
        let countryCode = Expression<String>(Place.CodingKeys.countryCode.rawValue)
        let cityName = Expression<String>(Place.CodingKeys.cityName.rawValue)

        do {
            for place in try db.prepare(placesTable) {
                print("id: \(place[universityName]), name: \(place[programName]), email: \(place[countryName])")
            }
        } catch {
            decodeError(table: "PLACES", error: error)
        }
    }
}
