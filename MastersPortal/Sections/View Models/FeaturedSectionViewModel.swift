//
//  File.swift
//  MastersPortal
//
//  Created by HASAN CAN on 13/5/21.
//

import Foundation

class FeaturedSectionViewModel: NSObject {
    let cells: [FeaturedItemViewModel]

    var count: Int {
        cells.count
    }

    init(cells: [FeaturedItemViewModel]) {
        self.cells = cells
    }
}
