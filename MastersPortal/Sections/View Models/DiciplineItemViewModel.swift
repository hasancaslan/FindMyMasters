//
//  DiciplineItemViewModel.swift
//  MastersPortal
//
//  Created by HASAN CAN on 10/5/21.
//

import UIKit

class DiciplineItemViewModel: NSObject {
    let identifier = UUID()

    var buttonTitle: String
    var title: String
    var subtitle: String
    var icon: UIImage

    init(title: String, subtitle: String, icon: UIImage, buttonTitle: String) {
        self.title = title
        self.subtitle = subtitle
        self.icon = icon
        self.buttonTitle = buttonTitle
    }

//    func hash(into hasher: inout Hasher) {
//        hasher.combine(identifier)
//    }
//
//    static func == (lhs: SmallCellItem, rhs: SmallCellItem) -> Bool {
//        return lhs.identifier == rhs.identifier
//    }
}
