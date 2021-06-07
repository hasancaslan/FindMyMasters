//
//  CountriesViewModel.swift
//  MastersPortal
//
//  Created by HASAN CAN on 7/6/21.
//

import FlagKit

class CountriesViewModel: NSObject {
    private let countriesTitle = SectionTitleViewModel(title: "Countries")

    let countryData: [CountryItemViewModel] = {
        var countries: [String] = []
        var codes: [String] = []
        for code in NSLocale.isoCountryCodes {
            let id = NSLocale.localeIdentifier(fromComponents: [NSLocale.Key.countryCode.rawValue: code])
            let name = NSLocale(localeIdentifier: "en_UK").displayName(forKey: NSLocale.Key.identifier, value: id) ?? "Country not found for code: \(code)"
            codes.append(code)
            countries.append(name)
        }

        return codes.compactMap { countryCode in
            let id = NSLocale.localeIdentifier(fromComponents: [NSLocale.Key.countryCode.rawValue: countryCode])
            guard let flag = Flag(countryCode: countryCode),
                let name = NSLocale(localeIdentifier: "en_UK").displayName(forKey: NSLocale.Key.identifier, value: id)
            else { return nil }
            let styledImage = flag.image(style: .circle)
            return CountryItemViewModel(title: name, icon: styledImage)
        }
    }()

    private var countryViewModel: CountriesSectionViewModel {
        CountriesSectionViewModel(cells: countryData)
    }

    var sections: [CollectionSection] {
        [CountriesSection(countryViewModel)]
    }
}
