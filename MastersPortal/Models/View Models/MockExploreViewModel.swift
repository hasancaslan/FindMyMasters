//
//  FeaturedViewModel.swift
//  MastersPortal
//
//  Created by HASAN CAN on 12/5/21.
//

import FlagKit
import IGListKit

// MARK: - ListAdapterDataSource

class FeaturedViewModel: NSObject {
    private let featuredData =
        [
            FeaturedItemViewModel(
                caption: "POPULAR",
                title: "Cyber Security",
                subtitle: "Koç University",
                thumbnail: Asset.DemoImages.kuCyber.image
            ),
            FeaturedItemViewModel(
                caption: "POPULAR",
                title: "Cyber Security",
                subtitle: "Koç University",
                thumbnail: Asset.DemoImages.kuCyber.image
            ),
            FeaturedItemViewModel(
                caption: "POPULAR",
                title: "Cyber Security",
                subtitle: "Koç University",
                thumbnail: Asset.DemoImages.kuCyber.image
            ),
            FeaturedItemViewModel(
                caption: "POPULAR",
                title: "Cyber Security",
                subtitle: "Koç University",
                thumbnail: Asset.DemoImages.kuCyber.image
            ),
            FeaturedItemViewModel(
                caption: "POPULAR",
                title: "Cyber Security",
                subtitle: "Koç University",
                thumbnail: Asset.DemoImages.kuCyber.image
            ),
        ]

    private var featuredViewModel: FeaturedSectionViewModel {
        FeaturedSectionViewModel(cells: featuredData)
    }

    var sections: [CollectionSection] {
        [FeaturedSection(featuredViewModel)]
    }
}
