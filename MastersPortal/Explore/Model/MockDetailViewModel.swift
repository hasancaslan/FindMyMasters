//
//  MockDetailVİewModel.swift
//  MastersPortal
//
//  Created by HASAN CAN on 17/5/21.
//

import UIKit

class MockDetailViewModel: NSObject {
    let factData: [QuickFactItemViewModel] = [QuickFactItemViewModel(title: "10.000", subtitle: "tuition", icon: UIImage(systemName: "dollarsign.circle.fill")!)]

    private var factViewModel: QuickFactSectionViewModel {
        QuickFactSectionViewModel(cells: factData)
    }

    var sections: [Section] {
        [
            QuickFactSection(factViewModel)
        ]
    }
}
