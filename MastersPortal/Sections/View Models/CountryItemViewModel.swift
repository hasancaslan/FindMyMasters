//
//  CountryItemViewModel.swift
//  MastersPortal
//
//  Created by HASAN CAN on 10/5/21.
//

import UIKit

class CountryItemViewModel: NSObject {
    let identifier = UUID()

    var title: String
    var icon: UIImage

    init(title: String, icon: UIImage) {
        self.title = title
        self.icon = icon
    }

//    func hash(into hasher: inout Hasher) {
//        hasher.combine(identifier)
//    }
//
//    static func == (lhs: ListCellItem, rhs: ListCellItem) -> Bool {
//        return lhs.identifier == rhs.identifier
//    }
}
