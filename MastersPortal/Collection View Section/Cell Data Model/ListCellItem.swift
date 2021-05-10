//
//  ListCellItem.swift
//  MastersPortal
//
//  Created by HASAN CAN on 10/5/21.
//

import UIKit

struct ListCellItem: SectionItem {
    var title: String
    var icon: UIImage

    init(title: String, icon: UIImage) {
        self.title = title
        self.icon = icon
    }
}
