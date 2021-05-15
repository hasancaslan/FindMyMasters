//
//  DiciplineLayoutSection.swift
//  MastersPortal
//
//  Created by HASAN CAN on 9/5/21.
//

import IGListKit
import UIKit

struct DiciplineLayoutSection: LayoutSection {
//    func configureCell(collectionContext: ListCollectionContext, sectionController: ListSectionController, index: Int, item: AnyHashable) -> UICollectionViewCell {
//        let cell = collectionContext.dequeueReusableCell(withNibName: SmallCell.reuseIdentifier, bundle: Bundle.main, for: sectionController, at: index)
//
//        if let cell = cell as? SmallCell,
//            let item = item as? DiciplineCellViewModel {
//            cell.configure(item)
//        }
//
//        return cell
//    }

    func layoutSection() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)

        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.92), heightDimension: .fractionalHeight(0.3))
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitem: item, count: 3)

        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .groupPagingCentered

        return section
    }

    func sectionController() -> ListSectionController {
        ListSectionController()
    }
}
