//
//  FeaturedSection.swift
//  MastersPortal
//
//  Created by HASAN CAN on 16/5/21.
//

import IGListKit

typealias FeaturedSectionViewModel = SectionViewModel<FeaturedItemViewModel>

struct FeaturedSection: Section {
    var layoutSection: NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)

        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.92), heightDimension: .fractionalHeight(0.4))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])

        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .groupPagingCentered

        return section
    }

    var sectionController: ListSectionController
    var viewModel: ListDiffable

    init(_ viewModel: FeaturedSectionViewModel) {
        self.viewModel = viewModel
        sectionController = FeaturedSectionController()
    }
}
