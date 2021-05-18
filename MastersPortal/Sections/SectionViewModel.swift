//
//  SectionViewModel.swift
//  MastersPortal
//
//  Created by HASAN CAN on 17/5/21.
//

import Foundation

class SectionViewModel<DataType: NSObject>: NSObject {
    let cells: [DataType]

    var count: Int {
        cells.count
    }

    init(cells: [DataType]) {
        self.cells = cells
    }
}
