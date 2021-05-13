//
//  FeaturedLayoutSection.swift
//  MastersPortal
//
//  Created by HASAN CAN on 9/5/21.
//

import IGListKit
import UIKit

struct FeaturedLayoutSection: LayoutSection {
//    func configureCell(collectionContext: ListCollectionContext, sectionController: ListSectionController, index: Int, item: AnyHashable) -> UICollectionViewCell {
//        let cell = collectionContext.dequeueReusableCell(withNibName: FeaturedCell.reuseIdentifier, bundle: Bundle.main, for: sectionController, at: index)
//
//        if let cell = cell as? FeaturedCell,
//            let item = item as? FeaturedItemViewModel {
//            cell.configure(item)
//        }
//
//        return cell
//    }

    func layoutSection() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)

        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.92), heightDimension: .fractionalHeight(0.4))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])

        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .groupPagingCentered

        return section
    }

//    func sectionController() -> ListSectionController {
//        return FeaturedSectionController()
//    }
}
