//
//  DiciplinesSection.swift
//  MastersPortal
//
//  Created by HASAN CAN on 16/5/21.
//

import IGListKit

typealias DiciplinesSectionViewModel = SectionViewModel<DiciplineItemViewModel>

struct DiciplinesSection: Section {
    var layoutSection: NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)

        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.92), heightDimension: .fractionalHeight(0.3))
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitem: item, count: 3)

        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .groupPagingCentered

        return section
    }

    var sectionController: ListSectionController
    var viewModel: ListDiffable

    init(_ viewModel: DiciplinesSectionViewModel) {
        self.viewModel = viewModel
        sectionController = DiciplinesSectionController()
    }
}
