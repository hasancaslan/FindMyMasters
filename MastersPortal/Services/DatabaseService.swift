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
            let databaseFilePath = Bundle.main.path(forResource: "mastersportal", ofType: "sqlite3")!
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
                try row.decode()
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

    public func getCheapestUniversitiesInField(field: String) -> [CheapProgramDataContainer]? {
        guard let db = DB else {
            connectionError()
            return nil
        }
        let query = """
            SELECT *
            FROM (SELECT tution_1_currency               as currency,
                         tution_1_money + tution_2_money as total,
                         country_name,
                         university_name,
                         program_name
                  FROM Terms
                           NATURAL JOIN Places
                  WHERE program_name LIKE '%\(field)%'
                  GROUP BY country_name, total) as q
            WHERE 2 >= (SELECT count(*)
                        FROM (SELECT tution_1_currency               as currency,
                                     tution_1_money + tution_2_money as total,
                                     country_name,
                                     university_name,
                                     program_name
                              FROM Terms
                                       NATURAL JOIN Places
                              WHERE program_name LIKE '%\(field)%'
                              GROUP BY country_name, total) as q2
                        WHERE q.country_name = q2.country_name
                          AND q2.total < q.total)
            ORDER BY total ASC;

            """

        do {
            let stmt = try db.prepare(query)
            var programs = [CheapProgramDataContainer]()
            for row in stmt {
                programs.append(
                    CheapProgramDataContainer(
                        currency: row[0] as! String,
                        total: Int(row[1] as! Int64),
                        countryName: row[2] as! String,
                        universityName: row[3] as! String,
                        programName: row[4] as! String))
            }

            return programs
        } catch {
            decodeError(table: "CHEAP PROGRAM", error: error)
        }

        return nil
    }

    public func getProgramsWithMultiKeyword(keyword1: String, keyword2: String) -> [CheapProgramDataContainer]? {
        guard let db = DB else {
            connectionError()
            return nil
        }

        let query = """
            select tution_1_currency as currency, tution_1_money + tution_2_money as total, university_name, program_name
            from terms
            where total > 0
              and program_name in
                  (select program_name from terms where program_name LIKE '%\(keyword1)%' OR program_name LIKE '%\(keyword2)%')
            group by total, currency
            order by total asc;

            """

        do {
            let stmt = try db.prepare(query)
            var programs = [CheapProgramDataContainer]()
            for row in stmt {
                programs.append(
                    CheapProgramDataContainer(
                        currency: row[0] as! String,
                        total: Int(row[1] as! Int64),
                        countryName: "",
                        universityName: row[2] as! String,
                        programName: row[3] as! String))
            }

            return programs
        } catch {
            decodeError(table: "MULTI KEYWORD", error: error)
        }

        return nil
    }

    public func getAllProgramsInCity(name: String, country: String) -> [Program]? {
        guard let db = DB else {
            connectionError()
            return nil
        }
        let query = """
            SELECT PROGRAMS.university_name,
                   PROGRAMS.program_name,
                   PROGRAMS.duration,
                   PROGRAMS.language
            FROM PROGRAMS
                     JOIN PLACES
                          ON PROGRAMS.university_name = PLACES.university_name
                              AND PROGRAMS.program_name = PLACES.program_name
                     JOIN CITY ON PLACES.country_name = CITY.Country
                AND CITY.City = PLACES.city
            WHERE CITY.City = '\(name)'
              AND CITY.Country = '\(country)';
            """

        do {
            let stmt = try db.prepare(query)
            var programs = [Program]()
            for row in stmt {
                programs.append(
                    Program(
                        name: row[0] as! String,
                        university: row[1] as! String,
                        duration: row[2] as! String,
                        language: row[3] as! String))
            }

            return programs
        } catch {
            decodeError(table: "PROGRAM DETAILS", error: error)
        }

        return nil
    }

    func getProgramDetails(name: String, university: String) -> ProgramDetailDataContainer? {
        guard let db = DB else {
            connectionError()
            return nil
        }

        let query = """
            SELECT P.university_name,
                   P.program_name,
                   T.deadline,
                   P.language,
                   P.duration,
                   P2.city,
                   P2.country_name,
                   T.tution_1_money,
                   T.tution_1_currency,
                   T.academic_req
            FROM PROGRAMS P
                     JOIN PLACES P2 on P.program_name = P2.program_name
                AND P.university_name = P2.university_name
                     JOIN TERMS T on P.program_name = T.program_name
                AND P.university_name = T.university_name
            WHERE P.program_name = '\(name)'
              AND P.university_name = '\(university)';
            """

        do {
            let stmt = try db.prepare(query)
            for row in stmt {
                return ProgramDetailDataContainer(
                    universityName: row[0] as! String,
                    programName: row[1] as! String,
                    deadline: row[2] as! String,
                    language: row[3] as! String,
                    duration: row[4] as! String,
                    cityName: row[5] as! String,
                    countryName: row[6] as! String,
                    tution1Money: Int(row[7] as! Int64),
                    tution1Currency: row[8] as! String,
                    academicRequirement: row[9] as! String)
            }
        } catch {
            decodeError(table: "PROGRAM DETAILS", error: error)
        }

        return nil
    }

    public func getProgramsWithDurationAndIELTSScore(score: Double, duration: String) -> [ProgramDetailDataContainer]? {
        guard let db = DB else {
            connectionError()
            return nil
        }

        let query = """
            SELECT DISTINCT university_name,
                            program_name,
                            deadline,
                            language,
                            duration,
                            city,
                            country_name,
                            tution_1_money + tution_1_money as total,
                            tution_1_currency,
                            academic_req,
                            ielts_score                     as score
            FROM terms
                     NATURAL JOIN Places
                     NATURAL JOIN Programs
            where strftime('%s', 'now') - strftime('%s', deadline) < 0
              AND CAST(score AS REAL) <= \(score)
              AND Programs.duration IN (select programs.duration from programs where duration LIKE '\(duration)%')
            ORDER BY total DESC, score DESC;
            """

        do {
            let stmt = try db.prepare(query)
            var programs = [ProgramDetailDataContainer]()
            for row in stmt {
                programs.append(
                    ProgramDetailDataContainer(
                        universityName: row[0] as! String,
                        programName: row[1] as! String,
                        deadline: row[2] as! String,
                        language: row[3] as! String,
                        duration: row[4] as! String,
                        cityName: row[5] as! String,
                        countryName: row[6] as! String,
                        tution1Money: Int(row[7] as! Int64),
                        tution1Currency: row[8] as! String,
                        academicRequirement: row[9] as! String))
            }

            return programs
        } catch {
            decodeError(table: "IELTS, DURATION", error: error)
        }

        return nil
    }

    //    func getAllPlaces() {
    //        guard let db = DB else {
    //            return connectionError()
    //        }
    //
    //        let universityName = Expression<String>(Place.CodingKeys.universityName.rawValue)
    //        let programName = Expression<String>(Place.CodingKeys.programName.rawValue)
    //        let countryName = Expression<String>(Place.CodingKeys.countryName.rawValue)
    //        let countryCode = Expression<String>(Place.CodingKeys.countryCode.rawValue)
    //        let cityName = Expression<String>(Place.CodingKeys.cityName.rawValue)
    //
    //        do {
    //            for place in try db.prepare(placesTable) {
    //                print("id: \(place[universityName]), name: \(place[programName]), email: \(place[countryName])")
    //            }
    //        } catch {
    //            decodeError(table: "PLACES", error: error)
    //        }
    //    }
}
