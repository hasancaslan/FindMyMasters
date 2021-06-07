//
//  City.swift
//  MastersPortal
//
//  Created by HASAN CAN on 2/6/21.
//

import IGListKit

class City: Codable {
    var name: String
    var country: String
    var qualityOfLifeIndex: Double
    var purchasingPowerIndex: Double
    var safetyIndex: Double
    var healthCareIndex: Double
    var costOfLivingIndex: Double
    var propertyPricetoIncome: Double
    var trafficCommuteTimeIndex: Double
    var pollutionIndex: Double
    var climateIndex: Double

    init(
        name: String,
        country: String,
        qualityOfLifeIndex: Double,
        purchasingPowerIndex: Double,
        safetyIndex: Double,
        healthCareIndex: Double,
        costOfLivingIndex: Double,
        propertyPricetoIncome: Double,
        trafficCommuteTimeIndex: Double,
        pollutionIndex: Double,
        climateIndex: Double
    ) {
        self.name = name
        self.country = country
        self.qualityOfLifeIndex = qualityOfLifeIndex
        self.purchasingPowerIndex = purchasingPowerIndex
        self.safetyIndex = safetyIndex
        self.healthCareIndex = healthCareIndex
        self.costOfLivingIndex = costOfLivingIndex
        self.propertyPricetoIncome = propertyPricetoIncome
        self.trafficCommuteTimeIndex = trafficCommuteTimeIndex
        self.pollutionIndex = pollutionIndex
        self.climateIndex = climateIndex
    }

    enum CodingKeys: String, CodingKey, CaseIterable {
        case name = "City"
        case country = "Country"
        case qualityOfLifeIndex = "Quality_of_Life_Index"
        case purchasingPowerIndex = "Purchasing_Power_Index"
        case safetyIndex = "Safety_Index"
        case healthCareIndex = "Health_Care_Index"
        case costOfLivingIndex = "Cost_of_Living_Index"
        case propertyPricetoIncome = "Property_Price_to_Income"
        case trafficCommuteTimeIndex = "Traffic_Commute_Time_Index"
        case pollutionIndex = "Pollution_Index"
        case climateIndex = "Climate_Index"
    }
}

extension City: ListDiffable {
    func diffIdentifier() -> NSObjectProtocol {
        return (name + country) as NSObjectProtocol
    }

    func isEqual(toDiffableObject object: ListDiffable?) -> Bool {
        guard let object = object as? City else { return false }
        return name == object.name && country == object.country
    }
}

