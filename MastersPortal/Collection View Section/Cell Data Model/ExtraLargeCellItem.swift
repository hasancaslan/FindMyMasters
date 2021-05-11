//
//  ExtraLargeAppCellData.swift
//  MastersPortal
//
//  Created by HASAN CAN on 9/5/21.
//

import UIKit

struct ExtraLargeCellItem: Hashable {
    let identifier = UUID()

    var caption: String
    var title: String
    var subtitle: String
    var thumbnail: UIImage

    init(caption: String, title: String, subtitle: String, thumbnail: UIImage) {
        self.caption = caption
        self.title = title
        self.subtitle = subtitle
        self.thumbnail = thumbnail
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(identifier)
    }

    static func == (lhs: ExtraLargeCellItem, rhs: ExtraLargeCellItem) -> Bool {
        return lhs.identifier == rhs.identifier
    }
}
