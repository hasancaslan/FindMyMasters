//
//  SectionTitleViewModel.swift
//  MastersPortal
//
//  Created by HASAN CAN on 10/5/21.
//

import Foundation

class SectionTitleViewModel: NSObject {
    var title: String
    var navigationTitle: String?

    init(title: String, navigationTitle: String? = nil) {
        self.title = title
        self.navigationTitle = navigationTitle
    }
}
