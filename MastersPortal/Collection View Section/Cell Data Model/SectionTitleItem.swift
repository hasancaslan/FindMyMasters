//
//  SectionTitleItem.swift
//  MastersPortal
//
//  Created by HASAN CAN on 10/5/21.
//

import Foundation

struct SectionTitleItem: Hashable {
    let identifier = UUID()

    var title: String
    var navigationTitle: String?

    init(title: String, navigationTitle: String? = nil) {
        self.title = title
        self.navigationTitle = navigationTitle
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(identifier)
    }

    static func == (lhs: SectionTitleItem, rhs: SectionTitleItem) -> Bool {
        return lhs.identifier == rhs.identifier
    }
}
