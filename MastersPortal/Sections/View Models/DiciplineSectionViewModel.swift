//
//  DiciplineSectionViewModel.swift
//  MastersPortal
//
//  Created by HASAN CAN on 13/5/21.
//

import Foundation

class DiciplineSectionViewModel: NSObject {
    let cells: [DiciplineItemViewModel]

    var count: Int {
        return cells.count
    }

    init(cells: [DiciplineItemViewModel]) {
        self.cells = cells
    }
}
