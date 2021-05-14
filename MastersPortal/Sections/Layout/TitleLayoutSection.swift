//
//  TitleLayoutSection.swift
//  MastersPortal
//
//  Created by HASAN CAN on 9/5/21.
//

import IGListKit
import UIKit

struct TitleLayoutSection: LayoutSection {
//    func configureCell(collectionContext: ListCollectionContext, sectionController: ListSectionController, index: Int, item: AnyHashable) -> UICollectionViewCell {
//        let cell = collectionContext.dequeueReusableCell(withNibName: SectionTitleCell.reuseIdentifier, bundle: Bundle.main, for: sectionController, at: index)
//
//        if let cell = cell as? SectionTitleCell,
//            let item = item as? SectionTitleViewModel {
//            cell.configure(item)
//        }
//
//        return cell
//    }

    func sectionController() -> ListSectionController {
        return ListSectionController()
    }

    func layoutSection() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)

        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(50))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])

        let section = NSCollectionLayoutSection(group: group)

//        let headerSize = NSCollectionLayoutSize(
//                   widthDimension: .fractionalWidth(1.0),
//                   heightDimension: .estimated(22))
//               let sectionHeader = NSCollectionLayoutBoundarySupplementaryItem(
//                   layoutSize: headerSize,
//                   elementKind: UICollectionView.elementKindSectionHeader,
//                   alignment: .top)
//
//                section.boundarySupplementaryItems = [sectionHeader]
//
        return section
    }

//    func header(collectionView: UICollectionView, indexPath: IndexPath) -> UICollectionReusableView? {
//        let header = collectionView.dequeueReusableSupplementaryView(
//            ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: String(describing: SectionTitleSupplementaryView.self), for: indexPath)
//        if let hdr = header as? SectionTitleSupplementaryView {
//            hdr.configure(
//                SectionHeaderViewModel(
//                    title: "Diciplines",
//                    visibleButton: true,
//                    subtitle: ""))
//            hdr.titleButtonAction = {
//                print("returned", indexPath)
//            }
//        }
//        return header
//    }
}
