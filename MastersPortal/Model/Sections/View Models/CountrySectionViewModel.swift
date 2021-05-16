//
//  CountrySectionViewModel.swift
//  MastersPortal
//
//  Created by HASAN CAN on 13/5/21.
//

import Foundation

class CountrySectionViewModel: NSObject {
    let cells: [CountryItemViewModel]

    var count: Int {
        cells.count
    }

    init(cells: [CountryItemViewModel]) {
        self.cells = cells
    }
}
