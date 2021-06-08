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
    func getFeaturedPrograms() -> [FeaturedSection] {
        let programs = DatabaseService.shared.getAllPrograms()
        let filteredPrograms = programs?.filter { $0.university == "Koc University" }

        let popular = filteredPrograms?.compactMap { program in
            FeaturedItemViewModel(
                caption: "POPULAR",
                title: program.name,
                subtitle: program.university,
                thumbnail: getRandomPhoto())
        }

        let popularSection = FeaturedSectionViewModel(cells: popular ?? [])

        let new = filteredPrograms?.compactMap { program in
            FeaturedItemViewModel(
                caption: "NEW",
                title: program.name,
                subtitle: program.university,
                thumbnail: getRandomPhoto())
        }

        let newSection = FeaturedSectionViewModel(cells: new ?? [])

        return [
            FeaturedSection(popularSection),
            FeaturedSection(newSection),
        ]
    }

    func getRandomPhoto() -> UIImage {
        let randomInt = Int.random(in: 1 ..< 9)
        return UIImage(named: "\(randomInt).jpg") ?? Asset.DemoImages.kuCyber.image
    }

    var sections: [CollectionSection] {
        return getFeaturedPrograms()
    }
}
