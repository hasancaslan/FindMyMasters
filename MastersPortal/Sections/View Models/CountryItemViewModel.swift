//
//  CountryItemViewModel.swift
//  MastersPortal
//
//  Created by HASAN CAN on 10/5/21.
//

import UIKit

class CountryItemViewModel: NSObject {
    var title: String
    var icon: UIImage

    init(title: String, icon: UIImage) {
        self.title = title
        self.icon = icon
    }
}
