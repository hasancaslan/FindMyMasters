//
//  ExtraLargeAppCellData.swift
//  MastersPortal
//
//  Created by HASAN CAN on 9/5/21.
//

import UIKit

struct ExtraLargeCellItem: SectionItem {
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
}
