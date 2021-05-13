//
//  CountryLayoutSection.swift
//  MastersPortal
//
//  Created by HASAN CAN on 9/5/21.
//

import IGListKit
import UIKit

struct CountryLayoutSection: LayoutSection {
//    func configureCell(collectionContext: ListCollectionContext, sectionController: ListSectionController, index: Int, item: AnyHashable) -> UICollectionViewCell {
//        let cell = collectionContext.dequeueReusableCell(withNibName: ListCell.reuseIdentifier, bundle: Bundle.main, for: sectionController, at: index)
//
//        if let cell = cell as? ListCell,
//            let item = item as? CountryCellViewModel {
//            cell.configure(item)
//        }
//
//        return cell
//    }

    func layoutSection() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)

        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(50))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])

        let section = NSCollectionLayoutSection(group: group)
        return section
    }

    func sectionController() -> ListSectionController {
        return ListSectionController()
    }
}
