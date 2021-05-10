//
//  SmallCellItem.swift
//  MastersPortal
//
//  Created by HASAN CAN on 10/5/21.
//

import UIKit

struct SmallCellItem: SectionItem {
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
}
