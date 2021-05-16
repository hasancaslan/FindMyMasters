//
//  QuickFactItemViewModel.swift
//  MastersPortal
//
//  Created by HASAN CAN on 16/5/21.
//

import UIKit

class QuickFactItemViewModel: NSObject {
    var title: String
    var subtitle: String
    var icon: UIImage

    init(title: String, subtitle: String, icon: UIImage) {
        self.title = title
        self.subtitle = subtitle
        self.icon = icon
    }
}
