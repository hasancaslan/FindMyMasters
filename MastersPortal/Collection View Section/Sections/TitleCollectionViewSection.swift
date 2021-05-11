//
//  TitleCollectionViewSection.swift
//  MastersPortal
//
//  Created by HASAN CAN on 9/5/21.
//

import UIKit

struct TitleCollectionViewSection: LayoutSection {
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

    func configureCell(collectionView: UICollectionView, indexPath: IndexPath, item: AnyHashable) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SectionTitleCell.reuseIdentifier, for: indexPath) as! SectionTitleCell
        cell.configure(item as! SectionTitleItem)
        return cell
    }

//    func header(collectionView: UICollectionView, indexPath: IndexPath) -> UICollectionReusableView? {
//        let header = collectionView.dequeueReusableSupplementaryView(
//            ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: String(describing: SectionTitleSupplementaryView.self), for: indexPath)
//        if let hdr = header as? SectionTitleSupplementaryView {
//            hdr.configure(
//                SectionHeaderItem(
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