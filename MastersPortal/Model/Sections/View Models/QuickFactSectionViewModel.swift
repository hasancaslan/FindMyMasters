//
//  QuickFactSectionViewModel.swift
//  MastersPortal
//
//  Created by HASAN CAN on 16/5/21.
//

import Foundation

class QuickFactSectionViewModel: NSObject {
    let cells: [FeaturedItemViewModel]

    var count: Int {
        cells.count
    }

    init(cells: [FeaturedItemViewModel]) {
        self.cells = cells
    }
}
